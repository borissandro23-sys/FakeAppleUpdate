#import <UIKit/UIKit.h>

@interface PSListController : UIViewController
@end

@interface PSSpecifier : NSObject
+ (instancetype)preferenceSpecifierNamed:(NSString *)name target:(id)target set:(SEL)setter get:(SEL)getter detail:(Class)detail cell:(NSInteger)cell edit:(Class)edit;
- (id)propertyForKey:(NSString *)key;
- (void)setProperty:(id)value forKey:(NSString *)key;
@end

static NSString * const FAUDefaultsSuite = @"com.sasha.fakeappleupdate";
static NSString * const FAUVersionKey = @"SelectedVersion";
static NSString * const FAUVersionNameKey = @"SelectedVersionName";
static NSString * const FAUAvailableKey = @"FakeUpdateAvailable";
static NSString * const FAUResourcePath = @"/var/jb/Library/Application Support/FakeAppleUpdate";

static NSArray<NSDictionary *> *FAUVersionCatalog(void) {
    static NSArray *items;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *versions = @[
            @[@"iPhone OS 1", @"01_iPhoneOS_1.png"],
            @[@"iPhone OS 2", @"02_iPhoneOS_2.png"],
            @[@"iPhone OS 3", @"03_iPhoneOS_3.png"],
            @[@"iOS 4", @"04_iOS_4.png"],
            @[@"iOS 5", @"05_iOS_5.png"],
            @[@"iOS 6", @"06_iOS_6.png"],
            @[@"iOS 7", @"07_iOS_7.png"],
            @[@"iOS 8", @"08_iOS_8.png"],
            @[@"iOS 9", @"09_iOS_9.png"],
            @[@"iOS 10", @"10_iOS_10.png"],
            @[@"iOS 11", @"11_iOS_11.png"],
            @[@"iOS 12", @"12_iOS_12.png"],
            @[@"iOS 13", @"13_iOS_13.png"],
            @[@"iOS 14", @"14_iOS_14.png"],
            @[@"iOS 15", @"15_iOS_15.png"],
            @[@"iOS 16", @"16_iOS_16.png"],
            @[@"iOS 17", @"17_iOS_17.png"],
            @[@"iOS 18", @"18_iOS_18.png"],
            @[@"iOS 26", @"19_iOS_26.png"],
            @[@"iOS 27", @"20_iOS_27.png"]
        ];
        NSMutableArray *result = [NSMutableArray arrayWithCapacity:versions.count];
        for (NSUInteger i = 0; i < versions.count; i++) {
            [result addObject:@{@"name": versions[i][0], @"image": versions[i][1]}];
        }
        items = result.copy;
    });
    return items;
}

static NSDictionary *FAUSelectedVersion(void) {
    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:FAUDefaultsSuite];
    NSString *saved = [defaults stringForKey:FAUVersionNameKey];
    for (NSDictionary *item in FAUVersionCatalog()) {
        if ([item[@"name"] isEqualToString:saved]) return item;
    }
    return FAUVersionCatalog()[14];
}

static UIImage *FAUImageForVersion(NSDictionary *item) {
    NSString *path = [FAUResourcePath stringByAppendingPathComponent:item[@"image"]];
    return [UIImage imageWithContentsOfFile:path];
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

    UIBarButtonItem *reset = [[UIBarButtonItem alloc] initWithTitle:@"Сбросить" style:UIBarButtonItemStylePlain target:self action:@selector(resetVersion)];
    self.navigationItem.rightBarButtonItem = reset;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.filteredVersions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VersionCell" forIndexPath:indexPath];
    NSDictionary *item = self.filteredVersions[indexPath.row];
    cell.textLabel.text = item[@"name"];
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
    [defaults setObject:item[@"image"] forKey:FAUVersionKey];
    [defaults synchronize];
    [tableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (searchText.length == 0) {
        self.filteredVersions = FAUVersionCatalog();
    } else {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name CONTAINS[cd] %@", searchText];
        self.filteredVersions = [FAUVersionCatalog() filteredArrayUsingPredicate:predicate];
    }
    [self.tableView reloadData];
}

- (void)resetVersion {
    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:FAUDefaultsSuite];
    [defaults removeObjectForKey:FAUVersionNameKey];
    [defaults removeObjectForKey:FAUVersionKey];
    [defaults synchronize];
    [self.tableView reloadData];
}

@end

@interface FakeUpdatePreviewController : UIViewController
@end

@implementation FakeUpdatePreviewController {
    UIButton *_updateButton;
    UIActivityIndicatorView *_spinner;
    UILabel *_statusLabel;
    UILabel *_versionLabel;
    UIImageView *_versionIcon;
    BOOL _isRunning;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Обновление ПО";
    self.view.backgroundColor = [UIColor systemGroupedBackgroundColor];

    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:FAUDefaultsSuite];
    [defaults setBool:YES forKey:FAUAvailableKey];
    [defaults synchronize];

    UIStackView *stack = [[UIStackView alloc] init];
    stack.axis = UILayoutConstraintAxisVertical;
    stack.spacing = 18.0;
    stack.alignment = UIStackViewAlignmentFill;
    stack.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:stack];

    NSDictionary *selected = FAUSelectedVersion();
    _versionIcon = [[UIImageView alloc] initWithImage:FAUImageForVersion(selected)];
    _versionIcon.contentMode = UIViewContentModeScaleAspectFit;
    _versionIcon.clipsToBounds = YES;
    _versionIcon.layer.cornerRadius = 14.0;
    [_versionIcon.heightAnchor constraintEqualToConstant:112.0].active = YES;

    UILabel *heading = [[UILabel alloc] init];
    heading.text = @"Доступно обновление ПО";
    heading.font = [UIFont systemFontOfSize:22 weight:UIFontWeightSemibold];
    heading.textAlignment = NSTextAlignmentCenter;
    heading.numberOfLines = 0;

    _versionLabel = [[UILabel alloc] init];
    _versionLabel.text = selected[@"name"];
    _versionLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightMedium];
    _versionLabel.textAlignment = NSTextAlignmentCenter;
    _versionLabel.textColor = [UIColor secondaryLabelColor];

    UILabel *details = [[UILabel alloc] init];
    details.text = @"Это локальный макет экрана. Он не загружает и не устанавливает обновления.";
    details.font = [UIFont systemFontOfSize:14];
    details.textAlignment = NSTextAlignmentCenter;
    details.textColor = [UIColor secondaryLabelColor];
    details.numberOfLines = 0;

    _statusLabel = [[UILabel alloc] init];
    _statusLabel.text = @"Обновление готово к проверке";
    _statusLabel.font = [UIFont systemFontOfSize:15];
    _statusLabel.textAlignment = NSTextAlignmentCenter;
    _statusLabel.textColor = [UIColor secondaryLabelColor];
    _statusLabel.numberOfLines = 0;

    _spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
    _spinner.hidesWhenStopped = YES;

    _updateButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _updateButton.backgroundColor = [UIColor systemBlueColor];
    [_updateButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [_updateButton setTitle:@"Обновить сейчас" forState:UIControlStateNormal];
    _updateButton.titleLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightSemibold];
    _updateButton.layer.cornerRadius = 12.0;
    [_updateButton addTarget:self action:@selector(startFakeUpdate) forControlEvents:UIControlEventTouchUpInside];

    UIButton *laterButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [laterButton setTitle:@"Обновить позже" forState:UIControlStateNormal];
    laterButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [laterButton addTarget:self action:@selector(closePreview) forControlEvents:UIControlEventTouchUpInside];

    [stack addArrangedSubview:_versionIcon];
    [stack addArrangedSubview:heading];
    [stack addArrangedSubview:_versionLabel];
    [stack addArrangedSubview:details];
    [stack addArrangedSubview:_statusLabel];
    [stack addArrangedSubview:_spinner];
    [stack addArrangedSubview:_updateButton];
    [stack addArrangedSubview:laterButton];

    [NSLayoutConstraint activateConstraints:@[
        [stack.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:24],
        [stack.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-24],
        [stack.centerYAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.centerYAnchor],
        [_updateButton.heightAnchor constraintGreaterThanOrEqualToConstant:50]
    ]];
}

- (void)startFakeUpdate {
    if (_isRunning) return;
    _isRunning = YES;
    _updateButton.enabled = NO;
    _updateButton.alpha = 0.55;
    _statusLabel.text = @"Проверка обновления…";
    [_spinner startAnimating];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(30 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self->_isRunning = NO;
        [self->_spinner stopAnimating];
        self->_updateButton.enabled = YES;
        self->_updateButton.alpha = 1.0;
        self->_statusLabel.text = @"Не удалось завершить проверку";
        NSArray<NSString *> *errors = @[
            @"Не удалось проверить наличие обновления.",
            @"Ошибка загрузки обновления.",
            @"Не удалось проверить подлинность обновления.",
            @"Сервер обновления недоступен.",
            @"Произошла неизвестная ошибка.",
            @"Обновление временно недоступно.",
            @"Не удалось подготовить обновление.",
            @"Не удалось проверить подключение к интернету.",
            @"Недостаточно места для загрузки обновления.",
            @"Повторите попытку позже.",
            @"Не удалось установить соединение с сервером обновления. Произошла ошибка конфигурации.",
            @"Не удалось установить обновление. Неверная конфигурация профиля обновления",
            @"Ошибка обновления: параметр UpdateTargetVersion не найден",
            @"Не удаётся продолжить. Файл конфигурации обновления повреждён или отсутствует",
            @"Обновление прервано. Обязательный параметр SoftwareUpdateChannel не задан",
            @"Не удалось применить конфигурацию. Значение параметра DeviceTier выходит за допустимые пределы",
            @"Ошибка проверки манифеста: ключ BuildVersion не найден"
        ];
        NSString *message = errors[arc4random_uniform((uint32_t)errors.count)];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Не удалось проверить обновление" message:message preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"Повторить" style:UIAlertActionStyleDefault handler:^(__unused UIAlertAction *action) { [self startFakeUpdate]; }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"ОК" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    });
}

- (void)closePreview {
    [self.navigationController popViewControllerAnimated:YES];
}

@end

%hook PSListController
- (NSArray *)specifiers {
    NSArray *original = %orig;
    if (![original isKindOfClass:NSArray.class] || original.count == 0) return original;
    BOOL hasPicker = NO, hasPreview = NO;
    NSInteger updateIndex = NSNotFound;
    for (NSUInteger i = 0; i < original.count; i++) {
        id specifier = original[i];
        NSString *identifier = [specifier respondsToSelector:@selector(propertyForKey:)] ? [specifier propertyForKey:@"id"] : nil;
        if ([identifier isEqualToString:@"FAKE_UPDATE_PICKER"]) hasPicker = YES;
        if ([identifier isEqualToString:@"FAKE_UPDATE_PREVIEW"]) hasPreview = YES;
        if ([identifier isEqualToString:@"SOFTWARE_UPDATE_LINK"]) updateIndex = (NSInteger)i;
    }
    if ((hasPicker && hasPreview) || updateIndex == NSNotFound) return original;

    NSMutableArray *updated = [original mutableCopy];
    NSUInteger insertIndex = (NSUInteger)updateIndex + 1;
    if (!hasPicker) {
        PSSpecifier *picker = [PSSpecifier preferenceSpecifierNamed:@"Выбрать версию iOS" target:self set:NULL get:NULL detail:FakeUpdateVersionPickerController.class cell:2 edit:Nil];
        [picker setProperty:@"FAKE_UPDATE_PICKER" forKey:@"id"];
        [updated insertObject:picker atIndex:insertIndex++];
    }
    if (!hasPreview) {
        PSSpecifier *preview = [PSSpecifier preferenceSpecifierNamed:@"Предпросмотр обновления" target:self set:NULL get:NULL detail:FakeUpdatePreviewController.class cell:2 edit:Nil];
        [preview setProperty:@"FAKE_UPDATE_PREVIEW" forKey:@"id"];
        [updated insertObject:preview atIndex:insertIndex];
    }
    return updated;
}
%end

%ctor {
    NSLog(@"[FakeAppleUpdate] Local preview loaded");
}
