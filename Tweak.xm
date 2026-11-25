#import <UIKit/UIKit.h>

static NSString * const FAUDefaultsSuite = @"com.sasha.fakeappleupdate";
static NSString * const FAUVersionNameKey = @"SelectedVersionName";
static NSString * const FAUVersionImageKey = @"SelectedVersionImage";
static NSString * const FAUResourcePath = @"/var/jb/Library/Application Support/FakeAppleUpdate";

static NSArray<NSDictionary *> *FAUVersionCatalog(void) {
    static NSArray *items;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *groups = @[
            @{@"prefix":@"iPhone OS ", @"image":@"01_iPhoneOS_1.png", @"versions":@"1.0 1.1 1.1.1 1.1.2 1.1.3 1.1.4 1.1.5", @"description":@"Первая версия iPhone OS. Интерфейс Multi-Touch, Safari, телефон, почта, карты и базовые приложения iPhone."},
            @{@"prefix":@"iPhone OS ", @"image":@"02_iPhoneOS_2.png", @"versions":@"2.0 2.0.1 2.0.2 2.1 2.2 2.2.1", @"description":@"Появился App Store и поддержка сторонних приложений. Добавлены push-уведомления для приложений и новые возможности системы."},
            @{@"prefix":@"iPhone OS ", @"image":@"03_iPhoneOS_3.png", @"versions":@"3.0 3.0.1 3.1 3.1.2 3.1.3 3.2 3.2.1 3.2.2", @"description":@"Добавлены копирование и вставка, поиск Spotlight, MMS, голосовое управление и новые функции приложений. Версия 3.2 предназначалась для iPad."},
            @{@"prefix":@"iOS ", @"image":@"04_iOS_4.png", @"versions":@"4.0 4.0.1 4.0.2 4.1 4.2 4.2.1 4.3 4.3.1 4.3.2 4.3.3 4.3.4 4.3.5", @"description":@"Многозадачность, папки на домашнем экране, FaceTime и обновлённый интерфейс. В последующих выпусках добавлялись AirPlay и улучшения производительности."},
            @{@"prefix":@"iOS ", @"image":@"05_iOS_5.png", @"versions":@"5.0 5.0.1 5.1 5.1.1", @"description":@"Добавлены Центр уведомлений, iMessage, iCloud, Напоминания и интеграция Siri на поддерживаемых устройствах."},
            @{@"prefix":@"iOS ", @"image":@"06_iOS_6.png", @"versions":@"6.0 6.0.1 6.0.2 6.1 6.1.1 6.1.2 6.1.3 6.1.4 6.1.5 6.1.6", @"description":@"Появились Apple Maps, Passbook и улучшенная интеграция с Facebook. Поздние обновления исправляли ошибки и проблемы безопасности."},
            @{@"prefix":@"iOS ", @"image":@"07_iOS_7.png", @"versions":@"7.0 7.0.1 7.0.2 7.0.3 7.0.4 7.0.5 7.0.6 7.1 7.1.1 7.1.2", @"description":@"Полностью переработан внешний вид iOS. Добавлены Пункт управления, AirDrop, обновлённая многозадачность и новые системные анимации."},
            @{@"prefix":@"iOS ", @"image":@"08_iOS_8.png", @"versions":@"8.0 8.0.1 8.0.2 8.1 8.1.1 8.1.2 8.1.3 8.2 8.3 8.4 8.4.1", @"description":@"Добавлены виджеты в Центре уведомлений, Continuity, приложение Здоровье, Apple Pay и Apple Music. Появилась поддержка сторонних клавиатур."},
            @{@"prefix":@"iOS ", @"image":@"09_iOS_9.png", @"versions":@"9.0 9.0.1 9.0.2 9.1 9.2 9.2.1 9.3 9.3.1 9.3.2 9.3.3 9.3.4 9.3.5 9.3.6", @"description":@"Улучшена производительность, добавлен режим энергосбережения, обновлены Заметки и Карты. На поддерживаемых устройствах появился Night Shift."},
            @{@"prefix":@"iOS ", @"image":@"10_iOS_10.png", @"versions":@"10.0 10.0.1 10.0.2 10.0.3 10.1 10.1.1 10.2 10.2.1 10.3 10.3.1 10.3.2 10.3.3 10.3.4", @"description":@"Обновлены экран блокировки и уведомления, появились приложения iMessage, Дом и новые возможности Siri. В iOS 10.3 внедрена файловая система APFS."},
            @{@"prefix":@"iOS ", @"image":@"11_iOS_11.png", @"versions":@"11.0 11.0.1 11.0.2 11.0.3 11.1 11.1.1 11.1.2 11.2 11.2.1 11.2.2 11.2.5 11.2.6 11.3 11.3.1 11.4 11.4.1", @"description":@"Обновлён Пункт управления, добавлено приложение Файлы, улучшена работа с iPad и появилась платформа дополненной реальности ARKit. Поддержка 32-битных приложений прекращена."},
            @{@"prefix":@"iOS ", @"image":@"12_iOS_12.png", @"versions":@"12.0 12.0.1 12.1 12.1.1 12.1.2 12.1.3 12.1.4 12.2 12.3 12.3.1 12.3.2 12.4 12.4.1 12.4.2 12.4.3 12.4.4 12.4.5 12.4.6 12.4.7 12.4.8 12.4.9 12.5 12.5.1 12.5.2 12.5.3 12.5.4 12.5.5 12.5.6 12.5.7 12.5.8", @"description":@"Ускорена работа системы на старых устройствах. Добавлены Экранное время, Команды, групповые звонки FaceTime и группировка уведомлений. Поздние версии содержат исправления безопасности."},
            @{@"prefix":@"iOS ", @"image":@"13_iOS_13.png", @"versions":@"13.0 13.1 13.1.1 13.1.2 13.1.3 13.2 13.2.2 13.2.3 13.3 13.3.1 13.4 13.4.1 13.5 13.5.1 13.6 13.6.1 13.7", @"description":@"Добавлены тёмный режим, вход с Apple ID и обновлённые Фото и Карты. На iPhone впервые появилась отдельная от iPad ветка iPadOS."},
            @{@"prefix":@"iOS ", @"image":@"14_iOS_14.png", @"versions":@"14.0 14.0.1 14.1 14.2 14.2.1 14.3 14.4 14.4.1 14.4.2 14.5 14.5.1 14.6 14.7 14.7.1 14.8 14.8.1", @"description":@"Появились виджеты на домашнем экране, Библиотека приложений, компактные вызовы и App Clips. Добавлены новые настройки конфиденциальности."},
            @{@"prefix":@"iOS ", @"image":@"15_iOS_15.png", @"versions":@"15.0 15.0.1 15.0.2 15.1 15.1.1 15.2 15.2.1 15.3 15.3.1 15.4 15.4.1 15.5 15.6 15.6.1 15.7 15.7.1 15.7.2 15.7.3 15.7.4 15.7.5 15.7.6 15.7.7 15.7.8 15.8 15.8.1 15.8.2 15.8.3 15.8.4 15.8.5 15.8.6 15.8.7 15.8.8", @"description":@"Добавлены режимы фокусирования, SharePlay, Live Text и улучшения FaceTime, Safari и Карт. Поздние обновления для старых устройств включают исправления ошибок и безопасности."},
            @{@"prefix":@"iOS ", @"image":@"16_iOS_16.png", @"versions":@"16.0 16.0.1 16.0.2 16.0.3 16.1 16.1.1 16.1.2 16.2 16.3 16.3.1 16.4 16.4.1 16.5 16.5.1 16.6 16.6.1 16.7 16.7.1 16.7.2 16.7.3 16.7.4 16.7.5 16.7.6 16.7.7 16.7.8 16.7.9 16.7.10 16.7.11 16.7.12 16.7.13 16.7.14 16.7.15 16.7.16", @"description":@"Добавлены настраиваемый экран блокировки, виджеты на экране блокировки, редактирование и отмена отправки сообщений и улучшения Фокуса."},
            @{@"prefix":@"iOS ", @"image":@"17_iOS_17.png", @"versions":@"17.0 17.0.1 17.0.2 17.0.3 17.1 17.1.1 17.1.2 17.2 17.2.1 17.3 17.3.1 17.4 17.4.1 17.5 17.5.1 17.6 17.6.1 17.7 17.7.1 17.7.2", @"description":@"Появились режим ожидания StandBy, NameDrop, контактные постеры и интерактивные виджеты. Обновлены Телефон, Сообщения и FaceTime."},
            @{@"prefix":@"iOS ", @"image":@"18_iOS_18.png", @"versions":@"18.0 18.0.1 18.1 18.1.1 18.2 18.2.1 18.3 18.3.1 18.3.2 18.4 18.4.1 18.5 18.6 18.6.1 18.6.2 18.7 18.7.1 18.7.2 18.7.3 18.7.4 18.7.5 18.7.6 18.7.7 18.7.8 18.7.9 18.7.10 18.7.11 18.7.12", @"description":@"Добавлены широкие настройки домашнего экрана и Пункта управления, новые возможности Фото и приложения Пароли. Apple Intelligence доступна на совместимых устройствах и языках."},
            @{@"prefix":@"iOS ", @"image":@"19_iOS_26.png", @"versions":@"26.0 26.0.1 26.1 26.2 26.2.1 26.3 26.3.1 26.4 26.4.1 26.4.2 26.5 26.5.1 26.5.2 26.6 26.6.1 26.6.2 26.7 26.7.1 26.7.2 26.7.3", @"description":@"Выпуск с новым дизайном Liquid Glass и обновлёнными системными интерфейсами. Нумерация перешла к обозначению по году; версии 19–25 публично не выпускались."},
            @{@"prefix":@"iOS ", @"image":@"19_iOS_26.png", @"versions":@"27.0 27.0.1 27.1 27.2 27.2.1", @"description":@"Следующее поколение iOS с дальнейшими изменениями системы и функций Apple Intelligence. Состав возможностей зависит от модели iPhone."}
        ];
        NSMutableArray *result = [NSMutableArray array];
        for (NSDictionary *group in groups) {
            for (NSString *number in [group[@"versions"] componentsSeparatedByString:@" "]) {
                NSString *name = [group[@"prefix"] stringByAppendingString:number];
                [result addObject:@{@"name":name, @"image":group[@"image"], @"description":group[@"description"], @"isBeta":@NO}];
            }
        }
        NSArray *betaVersions = @[
            @{@"name":@"iOS 15.0 Developer Beta", @"image":@"15_iOS_15.png", @"description":@"Предварительная тестовая сборка iOS 15. В ней проверялись режимы Фокусирования, SharePlay, Live Text и изменения FaceTime до публичного выпуска.", @"isBeta":@YES},
            @{@"name":@"iOS 16.0 Developer Beta", @"image":@"16_iOS_16.png", @"description":@"Предварительная тестовая сборка iOS 16 с ранними вариантами настраиваемого экрана блокировки и новых функций Сообщений.", @"isBeta":@YES},
            @{@"name":@"iOS 17.0 Developer Beta", @"image":@"17_iOS_17.png", @"description":@"Предварительная тестовая сборка iOS 17. В ней тестировались StandBy, NameDrop, контактные постеры и интерактивные виджеты.", @"isBeta":@YES},
            @{@"name":@"iOS 18.0 Developer Beta", @"image":@"18_iOS_18.png", @"description":@"Предварительная тестовая сборка iOS 18 с ранними версиями обновлённого домашнего экрана, Пункта управления и приложения Фото.", @"isBeta":@YES},
            @{@"name":@"iOS 26.0 Developer Beta", @"image":@"19_iOS_26.png", @"description":@"Предварительная тестовая сборка iOS 26 с ранним вариантом дизайна Liquid Glass и новыми системными интерфейсами.", @"isBeta":@YES},
            @{@"name":@"iOS 27.0 Developer Beta", @"image":@"19_iOS_26.png", @"description":@"Предварительная тестовая сборка iOS 27. В ней проверяются новые системные функции и изменения интерфейса.", @"isBeta":@YES},
            @{@"name":@"iOS 27.2 Developer Beta", @"image":@"19_iOS_26.png", @"description":@"Тестовая сборка iOS 27.2 для разработчиков. Состав изменений зависит от конкретного beta-релиза.", @"isBeta":@YES},
            @{@"name":@"iOS 27.3 Developer Beta", @"image":@"19_iOS_26.png", @"description":@"Бета-версия iOS 27.3 для тестирования приложений и системных изменений до общего выпуска.", @"isBeta":@YES},
            @{@"name":@"iOS 27.3 Public Beta", @"image":@"19_iOS_26.png", @"description":@"Публичная тестовая версия iOS 27.3. Это демонстрационная запись, не пакет обновления Apple.", @"isBeta":@YES}
        ];
        [result addObjectsFromArray:betaVersions];
        items = result.copy;
    });
    return items;
}

static NSDictionary *FAUSelectedVersion(void) {
    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:FAUDefaultsSuite];
    NSString *saved = [defaults stringForKey:FAUVersionNameKey];
    for (NSDictionary *item in FAUVersionCatalog()) if ([item[@"name"] isEqualToString:saved]) return item;
    for (NSDictionary *item in FAUVersionCatalog()) if ([item[@"name"] isEqualToString:@"iOS 15.8.8"]) return item;
    return FAUVersionCatalog().lastObject;
}

static NSString *FAUUpdateSizeForVersion(NSDictionary *item) {
    NSString *name = item[@"name"] ?: @"iOS 18.0";
    NSString *versionPart = [[name componentsSeparatedByString:@" "] lastObject];
    NSArray<NSString *> *parts = [versionPart componentsSeparatedByString:@"."];
    NSInteger major = parts.count > 0 ? parts[0].integerValue : 18;
    NSInteger minor = parts.count > 1 ? parts[1].integerValue : 0;
    NSInteger patch = parts.count > 2 ? parts[2].integerValue : 0;

    // Ориентировочная величина для макета. Реальный размер OTA зависит от устройства и сборки.
    NSInteger megabytes = (minor == 0 && patch == 0)
        ? (850 + major * 42)
        : (180 + minor * 55 + patch * 35);
    if ([item[@"isBeta"] boolValue]) megabytes += 120;
    megabytes = MAX(120, MIN(megabytes, 2600));

    if (megabytes >= 1024) {
        double gigabytes = megabytes / 1024.0;
        return [NSString stringWithFormat:@"Размер: около %.1f ГБ", gigabytes];
    }
    return [NSString stringWithFormat:@"Размер: около %ld МБ", (long)megabytes];
}

static UIImage *FAUImageForVersion(NSDictionary *item) {
    return [UIImage imageWithContentsOfFile:[FAUResourcePath stringByAppendingPathComponent:item[@"image"]]];
}

@interface FakeUpdateVersionPickerController : UITableViewController <UISearchBarDelegate>
@property(nonatomic, copy) NSArray<NSDictionary *> *filteredVersions;
@property(nonatomic, strong) UISearchBar *searchBar;
@end

@implementation FakeUpdateVersionPickerController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Версия iOS";
    self.tableView.backgroundColor = [UIColor systemGroupedBackgroundColor];
    self.filteredVersions = FAUVersionCatalog();
    self.searchBar = [[UISearchBar alloc] init];
    self.searchBar.placeholder = @"Поиск версии";
    self.searchBar.delegate = self;
    self.tableView.tableHeaderView = self.searchBar;
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"VersionCell"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { return self.filteredVersions.count; }
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    NSDictionary *item = self.filteredVersions[indexPath.row];
    cell.textLabel.text = item[@"name"];
    cell.detailTextLabel.text = [item[@"isBeta"] boolValue] ? @"Бета-версия · тестовая сборка" : @"Стабильный выпуск";
    cell.detailTextLabel.textColor = [item[@"isBeta"] boolValue] ? [UIColor systemOrangeColor] : [UIColor secondaryLabelColor];
    cell.imageView.image = FAUImageForVersion(item);
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    cell.accessoryType = [FAUSelectedVersion()[@"name"] isEqualToString:item[@"name"]] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    cell.backgroundColor = [UIColor secondarySystemGroupedBackgroundColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *item = self.filteredVersions[indexPath.row];
    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:FAUDefaultsSuite];
    [defaults setObject:item[@"name"] forKey:FAUVersionNameKey];
    [defaults setObject:item[@"image"] forKey:FAUVersionImageKey];
    [defaults synchronize];
    [tableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (!searchText.length) self.filteredVersions = FAUVersionCatalog();
    else self.filteredVersions = [FAUVersionCatalog() filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"name CONTAINS[cd] %@", searchText]];
    [self.tableView reloadData];
}
@end

@interface FakeUpdatePreviewController : UIViewController
@end

@implementation FakeUpdatePreviewController {
    UIScrollView *_scrollView;
    UIView *_contentView;
    UIButton *_updateButton;
    UILabel *_statusLabel;
    UILabel *_versionLabel;
    UILabel *_autoValueLabel;
    UILabel *_betaValueLabel;
    BOOL _checking;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Обновление ПО";
    self.view.backgroundColor = [UIColor systemGroupedBackgroundColor];
    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeNever;

    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:FAUDefaultsSuite];
    BOOL autoUpdates = [defaults objectForKey:@"DemoAutoUpdatesEnabled"] ? [defaults boolForKey:@"DemoAutoUpdatesEnabled"] : YES;
    BOOL betaUpdates = [defaults boolForKey:@"DemoBetaUpdatesEnabled"];

    _scrollView = [[UIScrollView alloc] init];
    _scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    _scrollView.alwaysBounceVertical = YES;
    [self.view addSubview:_scrollView];

    _contentView = [[UIView alloc] init];
    _contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [_scrollView addSubview:_contentView];

    [NSLayoutConstraint activateConstraints:@[
        [_scrollView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
        [_scrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [_scrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [_scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
        [_contentView.topAnchor constraintEqualToAnchor:_scrollView.contentLayoutGuide.topAnchor],
        [_contentView.leadingAnchor constraintEqualToAnchor:_scrollView.contentLayoutGuide.leadingAnchor],
        [_contentView.trailingAnchor constraintEqualToAnchor:_scrollView.contentLayoutGuide.trailingAnchor],
        [_contentView.bottomAnchor constraintEqualToAnchor:_scrollView.contentLayoutGuide.bottomAnchor],
        [_contentView.widthAnchor constraintEqualToAnchor:_scrollView.frameLayoutGuide.widthAnchor]
    ]];

    UIView *settingsCard = [self makeGroupedCard];
    [_contentView addSubview:settingsCard];

    UIControl *autoRow = [self makeSettingsRowWithTitle:@"Автообновление"
                                                  value:(autoUpdates ? @"Вкл." : @"Выкл.")
                                                    tag:1];
    [settingsCard addSubview:autoRow];

    UIView *separator = [self makeSeparator];
    [settingsCard addSubview:separator];

    UIControl *betaRow = [self makeSettingsRowWithTitle:@"Beta-обновления"
                                                  value:(betaUpdates ? @"Вкл." : @"Выкл.")
                                                    tag:2];
    [settingsCard addSubview:betaRow];

    UIView *updateCard = [self makeGroupedCard];
    [_contentView addSubview:updateCard];

    NSDictionary *selected = FAUSelectedVersion();
    UIImage *icon = FAUImageForVersion(selected);
    if (!icon) icon = [self placeholderIconWithText:@"iOS"];

    UIImageView *iconView = [[UIImageView alloc] initWithImage:icon];
    iconView.translatesAutoresizingMaskIntoConstraints = NO;
    iconView.contentMode = UIViewContentModeScaleAspectFit;
    iconView.layer.cornerRadius = 13;
    iconView.clipsToBounds = YES;
    [updateCard addSubview:iconView];

    _versionLabel = [[UILabel alloc] init];
    _versionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _versionLabel.text = selected[@"name"] ?: @"iOS";
    _versionLabel.font = [UIFont systemFontOfSize:21 weight:UIFontWeightSemibold];
    _versionLabel.textColor = [UIColor labelColor];
    _versionLabel.numberOfLines = 1;
    [updateCard addSubview:_versionLabel];

    UILabel *metaLabel = [[UILabel alloc] init];
    metaLabel.translatesAutoresizingMaskIntoConstraints = NO;
    metaLabel.text = [NSString stringWithFormat:@"Apple Inc.\n%@%@", [selected[@"isBeta"] boolValue] ? @"Бета-версия · " : @"", FAUUpdateSizeForVersion(selected)];
    metaLabel.font = [UIFont systemFontOfSize:13];
    metaLabel.textColor = [UIColor secondaryLabelColor];
    metaLabel.numberOfLines = 2;
    [updateCard addSubview:metaLabel];

    UILabel *descriptionLabel = [[UILabel alloc] init];
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    descriptionLabel.text = selected[@"description"] ?: @"Описание этой версии отсутствует. Это демонстрационный макет.";
    descriptionLabel.font = [UIFont systemFontOfSize:15];
    descriptionLabel.textColor = [UIColor labelColor];
    descriptionLabel.numberOfLines = 0;
    [updateCard addSubview:descriptionLabel];

    UIButton *supportButton = [UIButton buttonWithType:UIButtonTypeSystem];
    supportButton.translatesAutoresizingMaskIntoConstraints = NO;
    [supportButton setTitle:@"Подробнее об обновлениях безопасности Apple" forState:UIControlStateNormal];
    supportButton.titleLabel.font = [UIFont systemFontOfSize:15];
    supportButton.titleLabel.numberOfLines = 0;
    supportButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    supportButton.titleLabel.textAlignment = NSTextAlignmentLeft;
    [supportButton setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
    [supportButton addTarget:self action:@selector(openSupportLink) forControlEvents:UIControlEventTouchUpInside];
    [updateCard addSubview:supportButton];

    _updateButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _updateButton.translatesAutoresizingMaskIntoConstraints = NO;
    [_updateButton setTitle:@"Загрузить и установить" forState:UIControlStateNormal];
    [_updateButton setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
    _updateButton.tintColor = [UIColor systemBlueColor];
    _updateButton.titleLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightSemibold];
    _updateButton.backgroundColor = UIColor.whiteColor;
    _updateButton.layer.borderWidth = 1.0 / UIScreen.mainScreen.scale;
    _updateButton.layer.borderColor = [UIColor colorWithWhite:0.82 alpha:1.0].CGColor;
    _updateButton.layer.cornerRadius = 13;
    _updateButton.clipsToBounds = YES;
    [_updateButton addTarget:self action:@selector(downloadTapped) forControlEvents:UIControlEventTouchUpInside];
    [_contentView addSubview:_updateButton];

    _statusLabel = [[UILabel alloc] init];
    _statusLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _statusLabel.font = [UIFont systemFontOfSize:13];
    _statusLabel.textColor = [UIColor secondaryLabelColor];
    _statusLabel.textAlignment = NSTextAlignmentCenter;
    _statusLabel.numberOfLines = 0;
    [_contentView addSubview:_statusLabel];

    UILabel *footnote = [[UILabel alloc] init];
    footnote.translatesAutoresizingMaskIntoConstraints = NO;
    footnote.text = @"Демонстрационный режим. Проверка серверов Apple, загрузка и установка iOS не выполняются.";
    footnote.font = [UIFont systemFontOfSize:12];
    footnote.textColor = [UIColor secondaryLabelColor];
    footnote.textAlignment = NSTextAlignmentCenter;
    footnote.numberOfLines = 0;
    [_contentView addSubview:footnote];

    [NSLayoutConstraint activateConstraints:@[
        [settingsCard.topAnchor constraintEqualToAnchor:_contentView.topAnchor constant:18],
        [settingsCard.leadingAnchor constraintEqualToAnchor:_contentView.leadingAnchor constant:16],
        [settingsCard.trailingAnchor constraintEqualToAnchor:_contentView.trailingAnchor constant:-16],

        [autoRow.topAnchor constraintEqualToAnchor:settingsCard.topAnchor],
        [autoRow.leadingAnchor constraintEqualToAnchor:settingsCard.leadingAnchor],
        [autoRow.trailingAnchor constraintEqualToAnchor:settingsCard.trailingAnchor],
        [autoRow.heightAnchor constraintEqualToConstant:48],

        [separator.topAnchor constraintEqualToAnchor:autoRow.bottomAnchor],
        [separator.leadingAnchor constraintEqualToAnchor:settingsCard.leadingAnchor constant:16],
        [separator.trailingAnchor constraintEqualToAnchor:settingsCard.trailingAnchor],
        [separator.heightAnchor constraintEqualToConstant:1.0 / UIScreen.mainScreen.scale],

        [betaRow.topAnchor constraintEqualToAnchor:separator.bottomAnchor],
        [betaRow.leadingAnchor constraintEqualToAnchor:settingsCard.leadingAnchor],
        [betaRow.trailingAnchor constraintEqualToAnchor:settingsCard.trailingAnchor],
        [betaRow.heightAnchor constraintEqualToConstant:48],
        [betaRow.bottomAnchor constraintEqualToAnchor:settingsCard.bottomAnchor],

        [updateCard.topAnchor constraintEqualToAnchor:settingsCard.bottomAnchor constant:20],
        [updateCard.leadingAnchor constraintEqualToAnchor:_contentView.leadingAnchor constant:16],
        [updateCard.trailingAnchor constraintEqualToAnchor:_contentView.trailingAnchor constant:-16],

        [iconView.topAnchor constraintEqualToAnchor:updateCard.topAnchor constant:18],
        [iconView.leadingAnchor constraintEqualToAnchor:updateCard.leadingAnchor constant:16],
        [iconView.widthAnchor constraintEqualToConstant:60],
        [iconView.heightAnchor constraintEqualToConstant:60],

        [_versionLabel.topAnchor constraintEqualToAnchor:updateCard.topAnchor constant:18],
        [_versionLabel.leadingAnchor constraintEqualToAnchor:iconView.trailingAnchor constant:14],
        [_versionLabel.trailingAnchor constraintEqualToAnchor:updateCard.trailingAnchor constant:-14],

        [metaLabel.topAnchor constraintEqualToAnchor:_versionLabel.bottomAnchor constant:3],
        [metaLabel.leadingAnchor constraintEqualToAnchor:_versionLabel.leadingAnchor],
        [metaLabel.trailingAnchor constraintEqualToAnchor:_versionLabel.trailingAnchor],

        [descriptionLabel.topAnchor constraintEqualToAnchor:iconView.bottomAnchor constant:18],
        [descriptionLabel.leadingAnchor constraintEqualToAnchor:updateCard.leadingAnchor constant:16],
        [descriptionLabel.trailingAnchor constraintEqualToAnchor:updateCard.trailingAnchor constant:-16],

        [supportButton.topAnchor constraintEqualToAnchor:descriptionLabel.bottomAnchor constant:12],
        [supportButton.leadingAnchor constraintEqualToAnchor:updateCard.leadingAnchor constant:16],
        [supportButton.trailingAnchor constraintEqualToAnchor:updateCard.trailingAnchor constant:-16],
        [supportButton.bottomAnchor constraintEqualToAnchor:updateCard.bottomAnchor constant:-18],

        [_updateButton.topAnchor constraintEqualToAnchor:updateCard.bottomAnchor constant:24],
        [_updateButton.leadingAnchor constraintEqualToAnchor:_contentView.leadingAnchor constant:16],
        [_updateButton.trailingAnchor constraintEqualToAnchor:_contentView.trailingAnchor constant:-16],
        [_updateButton.heightAnchor constraintEqualToConstant:50],

        [_statusLabel.topAnchor constraintEqualToAnchor:_updateButton.bottomAnchor constant:14],
        [_statusLabel.leadingAnchor constraintEqualToAnchor:_contentView.leadingAnchor constant:20],
        [_statusLabel.trailingAnchor constraintEqualToAnchor:_contentView.trailingAnchor constant:-20],

        [footnote.topAnchor constraintEqualToAnchor:_statusLabel.bottomAnchor constant:12],
        [footnote.leadingAnchor constraintEqualToAnchor:_contentView.leadingAnchor constant:20],
        [footnote.trailingAnchor constraintEqualToAnchor:_contentView.trailingAnchor constant:-20],
        [footnote.bottomAnchor constraintEqualToAnchor:_contentView.bottomAnchor constant:-28]
    ]];
}

- (UIView *)makeGroupedCard {
    UIView *card = [[UIView alloc] init];
    card.translatesAutoresizingMaskIntoConstraints = NO;
    card.backgroundColor = [UIColor secondarySystemGroupedBackgroundColor];
    card.layer.cornerRadius = 12;
    card.clipsToBounds = YES;
    return card;
}

- (UIControl *)makeSettingsRowWithTitle:(NSString *)title value:(NSString *)value tag:(NSInteger)tag {
    UIControl *row = [[UIControl alloc] init];
    row.translatesAutoresizingMaskIntoConstraints = NO;
    row.tag = tag;
    row.accessibilityLabel = title;
    row.accessibilityHint = @"Открыть демонстрационную настройку";
    [row addTarget:self action:@selector(settingsRowTapped:) forControlEvents:UIControlEventTouchUpInside];

    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    titleLabel.text = title;
    titleLabel.font = [UIFont systemFontOfSize:17];
    titleLabel.textColor = [UIColor labelColor];
    [row addSubview:titleLabel];

    UILabel *valueLabel = [[UILabel alloc] init];
    valueLabel.translatesAutoresizingMaskIntoConstraints = NO;
    valueLabel.text = value;
    valueLabel.font = [UIFont systemFontOfSize:17];
    valueLabel.textColor = [UIColor secondaryLabelColor];
    valueLabel.tag = 100 + tag;
    [row addSubview:valueLabel];

    UIImageView *chevron = [[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"chevron.right"]];
    chevron.translatesAutoresizingMaskIntoConstraints = NO;
    chevron.tintColor = [UIColor tertiaryLabelColor];
    [row addSubview:chevron];

    [NSLayoutConstraint activateConstraints:@[
        [titleLabel.leadingAnchor constraintEqualToAnchor:row.leadingAnchor constant:16],
        [titleLabel.centerYAnchor constraintEqualToAnchor:row.centerYAnchor],
        [chevron.trailingAnchor constraintEqualToAnchor:row.trailingAnchor constant:-14],
        [chevron.centerYAnchor constraintEqualToAnchor:row.centerYAnchor],
        [chevron.widthAnchor constraintEqualToConstant:10],
        [chevron.heightAnchor constraintEqualToConstant:15],
        [valueLabel.trailingAnchor constraintEqualToAnchor:chevron.leadingAnchor constant:-7],
        [valueLabel.centerYAnchor constraintEqualToAnchor:row.centerYAnchor]
    ]];
    return row;
}

- (UIView *)makeSeparator {
    UIView *separator = [[UIView alloc] init];
    separator.translatesAutoresizingMaskIntoConstraints = NO;
    separator.backgroundColor = [UIColor separatorColor];
    return separator;
}

- (UIImage *)placeholderIconWithText:(NSString *)text {
    CGSize size = CGSizeMake(120, 120);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:25];
    [[UIColor systemBlueColor] setFill];
    [path fill];
    NSDictionary *attributes = @{
        NSFontAttributeName: [UIFont systemFontOfSize:(text.length > 3 ? 24 : 40) weight:UIFontWeightBold],
        NSForegroundColorAttributeName: UIColor.whiteColor
    };
    CGSize textSize = [text sizeWithAttributes:attributes];
    [text drawAtPoint:CGPointMake((size.width - textSize.width) / 2.0, (size.height - textSize.height) / 2.0) withAttributes:attributes];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)settingsRowTapped:(UIControl *)sender {
    NSInteger tag = sender.tag;
    BOOL isAuto = (tag == 1);
    NSString *title = isAuto ? @"Автообновление" : @"Beta-обновления";
    NSString *key = isAuto ? @"DemoAutoUpdatesEnabled" : @"DemoBetaUpdatesEnabled";
    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:FAUDefaultsSuite];
    BOOL current = [defaults objectForKey:key] ? [defaults boolForKey:key] : isAuto;

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
        message:(isAuto ? @"Это настройка только демонстрационного макета. Параметры iOS не изменяются." : @"Переключатель влияет только на версии, помеченные как Beta. Стабильные версии не затрагиваются.")
        preferredStyle:UIAlertControllerStyleActionSheet];

    [alert addAction:[UIAlertAction actionWithTitle:(current ? @"Выключить" : @"Включить")
        style:UIAlertActionStyleDefault
        handler:^(UIAlertAction *action) {
            [defaults setBool:!current forKey:key];
            UILabel *valueLabel = [sender viewWithTag:100 + tag];
            valueLabel.text = !current ? @"Вкл." : @"Выкл.";
        }]];

    [alert addAction:[UIAlertAction actionWithTitle:@"Отмена" style:UIAlertActionStyleCancel handler:nil]];
    if (UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        alert.popoverPresentationController.sourceView = sender;
        alert.popoverPresentationController.sourceRect = sender.bounds;
    }
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)downloadTapped {
    if (_checking) return;

    NSDictionary *selected = FAUSelectedVersion();
    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:FAUDefaultsSuite];
    BOOL betaUpdatesEnabled = [defaults boolForKey:@"DemoBetaUpdatesEnabled"];
    if ([selected[@"isBeta"] boolValue] && !betaUpdatesEnabled) {
        _statusLabel.text = @"Бета-обновления выключены для выбранной тестовой версии.";
        UIAlertController *betaAlert = [UIAlertController alertControllerWithTitle:@"Beta-обновления выключены"
            message:@"Включи Beta-обновления в настройках этого макета, чтобы продолжить демонстрацию выбранной бета-версии. Стабильные версии от этого переключателя не зависят."
            preferredStyle:UIAlertControllerStyleAlert];
        [betaAlert addAction:[UIAlertAction actionWithTitle:@"Понятно" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:betaAlert animated:YES completion:nil];
        return;
    }

    _checking = YES;
    _updateButton.enabled = NO;
    [_updateButton setTitle:@"Проверка…" forState:UIControlStateNormal];
    _updateButton.backgroundColor = UIColor.whiteColor;
    [_updateButton setTitleColor:[UIColor systemGrayColor] forState:UIControlStateNormal];
    _statusLabel.text = @"Идёт имитация проверки обновления…";

    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (!strongSelf) return;

        strongSelf->_checking = NO;
        strongSelf->_statusLabel.text = @"Демонстрация завершена. Обновление не загружалось и не устанавливалось.";
        [strongSelf->_updateButton setTitle:@"Загрузить и установить" forState:UIControlStateNormal];
        strongSelf->_updateButton.backgroundColor = UIColor.whiteColor;
        [strongSelf->_updateButton setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
        strongSelf->_updateButton.enabled = YES;

        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Демонстрационный режим"
            message:@"FakeAppleUpdate не подключается к серверам Apple и не выполняет загрузку или установку iOS. Это только визуальная демонстрация."
            preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"Понятно" style:UIAlertActionStyleDefault handler:nil]];
        [strongSelf presentViewController:alert animated:YES completion:nil];
    });
}

- (void)openSupportLink {
    NSURL *url = [NSURL URLWithString:@"https://support.apple.com/HT201222"];
    if (!url) return;
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
        if (!success) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Не удалось открыть ссылку"
                message:@"Открой страницу https://support.apple.com/HT201222 в браузере."
                preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"ОК" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
}
@end

%ctor {
    NSLog(@"[FakeAppleUpdate] Loaded in Preferences");
}
