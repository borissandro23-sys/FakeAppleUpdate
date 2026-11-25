#import <UIKit/UIKit.h>

static NSString * const FAUDefaultsSuite = @"com.sasha.fakeappleupdate";
static NSString * const FAUVersionNameKey = @"SelectedVersionName";
static NSString * const FAUVersionImageKey = @"SelectedVersionImage";
static NSString * const FAUResourcePath = @"/var/jb/Library/Application Support/FakeAppleUpdate";

static NSArray<NSDictionary *> *FAUVersionCatalog(void) {
    static NSArray *items;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *rows = @[
            @[@"iPhone OS 1.0",@"01_iPhoneOS_1.png"], @[@"iPhone OS 1.1",@"01_iPhoneOS_1.png"],
            @[@"iPhone OS 2.0",@"02_iPhoneOS_2.png"], @[@"iPhone OS 2.1",@"02_iPhoneOS_2.png"], @[@"iPhone OS 2.2.1",@"02_iPhoneOS_2.png"],
            @[@"iPhone OS 3.0",@"03_iPhoneOS_3.png"], @[@"iPhone OS 3.1.3",@"03_iPhoneOS_3.png"],
            @[@"iOS 4.0",@"04_iOS_4.png"], @[@"iOS 4.3.5",@"04_iOS_4.png"],
            @[@"iOS 5.0",@"05_iOS_5.png"], @[@"iOS 5.1.1",@"05_iOS_5.png"],
            @[@"iOS 6.0",@"06_iOS_6.png"], @[@"iOS 6.1.6",@"06_iOS_6.png"],
            @[@"iOS 7.0",@"07_iOS_7.png"], @[@"iOS 7.1.2",@"07_iOS_7.png"],
            @[@"iOS 8.0",@"08_iOS_8.png"], @[@"iOS 8.4.1",@"08_iOS_8.png"],
            @[@"iOS 9.0",@"09_iOS_9.png"], @[@"iOS 9.3.6",@"09_iOS_9.png"],
            @[@"iOS 10.0",@"10_iOS_10.png"], @[@"iOS 10.3.4",@"10_iOS_10.png"],
            @[@"iOS 11.0",@"11_iOS_11.png"], @[@"iOS 11.4.1",@"11_iOS_11.png"],
            @[@"iOS 12.0",@"12_iOS_12.png"], @[@"iOS 12.5.7",@"12_iOS_12.png"],
            @[@"iOS 13.0",@"13_iOS_13.png"], @[@"iOS 13.7",@"13_iOS_13.png"],
            @[@"iOS 14.0",@"14_iOS_14.png"], @[@"iOS 14.8.1",@"14_iOS_14.png"],
            @[@"iOS 15.0",@"15_iOS_15.png"], @[@"iOS 15.0.1",@"15_iOS_15.png"], @[@"iOS 15.0.2",@"15_iOS_15.png"],
            @[@"iOS 15.1",@"15_iOS_15.png"], @[@"iOS 15.1.1",@"15_iOS_15.png"], @[@"iOS 15.2",@"15_iOS_15.png"],
            @[@"iOS 15.2.1",@"15_iOS_15.png"], @[@"iOS 15.3",@"15_iOS_15.png"], @[@"iOS 15.3.1",@"15_iOS_15.png"],
            @[@"iOS 15.4",@"15_iOS_15.png"], @[@"iOS 15.4.1",@"15_iOS_15.png"], @[@"iOS 15.5",@"15_iOS_15.png"],
            @[@"iOS 15.6",@"15_iOS_15.png"], @[@"iOS 15.6.1",@"15_iOS_15.png"], @[@"iOS 15.7",@"15_iOS_15.png"],
            @[@"iOS 15.7.1",@"15_iOS_15.png"], @[@"iOS 15.7.2",@"15_iOS_15.png"], @[@"iOS 15.7.3",@"15_iOS_15.png"],
            @[@"iOS 15.7.4",@"15_iOS_15.png"], @[@"iOS 15.7.5",@"15_iOS_15.png"], @[@"iOS 15.7.6",@"15_iOS_15.png"],
            @[@"iOS 15.7.7",@"15_iOS_15.png"], @[@"iOS 15.7.8",@"15_iOS_15.png"], @[@"iOS 15.8",@"15_iOS_15.png"],
            @[@"iOS 15.8.1",@"15_iOS_15.png"], @[@"iOS 15.8.2",@"15_iOS_15.png"], @[@"iOS 15.8.3",@"15_iOS_15.png"],
            @[@"iOS 15.8.4",@"15_iOS_15.png"], @[@"iOS 15.8.5",@"15_iOS_15.png"], @[@"iOS 15.8.6",@"15_iOS_15.png"],
            @[@"iOS 15.8.7",@"15_iOS_15.png"], @[@"iOS 15.8.8",@"15_iOS_15.png"],
            @[@"iOS 16.0",@"16_iOS_16.png"], @[@"iOS 16.0.2",@"16_iOS_16.png"], @[@"iOS 16.1",@"16_iOS_16.png"],
            @[@"iOS 16.1.2",@"16_iOS_16.png"], @[@"iOS 16.2",@"16_iOS_16.png"], @[@"iOS 16.3",@"16_iOS_16.png"],
            @[@"iOS 16.3.1",@"16_iOS_16.png"], @[@"iOS 16.4",@"16_iOS_16.png"], @[@"iOS 16.4.1",@"16_iOS_16.png"],
            @[@"iOS 16.5",@"16_iOS_16.png"], @[@"iOS 16.5.1",@"16_iOS_16.png"], @[@"iOS 16.6",@"16_iOS_16.png"],
            @[@"iOS 16.6.1",@"16_iOS_16.png"], @[@"iOS 16.7",@"16_iOS_16.png"], @[@"iOS 16.7.1",@"16_iOS_16.png"],
            @[@"iOS 16.7.2",@"16_iOS_16.png"], @[@"iOS 16.7.3",@"16_iOS_16.png"], @[@"iOS 16.7.4",@"16_iOS_16.png"],
            @[@"iOS 16.7.5",@"16_iOS_16.png"], @[@"iOS 16.7.6",@"16_iOS_16.png"], @[@"iOS 16.7.7",@"16_iOS_16.png"],
            @[@"iOS 16.7.8",@"16_iOS_16.png"], @[@"iOS 16.7.9",@"16_iOS_16.png"], @[@"iOS 16.7.10",@"16_iOS_16.png"],
            @[@"iOS 16.7.11",@"16_iOS_16.png"], @[@"iOS 16.7.12",@"16_iOS_16.png"], @[@"iOS 16.7.13",@"16_iOS_16.png"],
            @[@"iOS 16.7.14",@"16_iOS_16.png"], @[@"iOS 16.7.15",@"16_iOS_16.png"], @[@"iOS 16.7.16",@"16_iOS_16.png"],
            @[@"iOS 17.0",@"17_iOS_17.png"], @[@"iOS 17.1",@"17_iOS_17.png"], @[@"iOS 17.2",@"17_iOS_17.png"],
            @[@"iOS 17.3",@"17_iOS_17.png"], @[@"iOS 17.4",@"17_iOS_17.png"], @[@"iOS 17.5",@"17_iOS_17.png"],
            @[@"iOS 17.6",@"17_iOS_17.png"], @[@"iOS 17.7",@"17_iOS_17.png"], @[@"iOS 18.0",@"18_iOS_18.png"],
            @[@"iOS 18.1",@"18_iOS_18.png"], @[@"iOS 18.2",@"18_iOS_18.png"], @[@"iOS 18.3",@"18_iOS_18.png"],
            @[@"iOS 18.4",@"18_iOS_18.png"], @[@"iOS 18.5",@"18_iOS_18.png"], @[@"iOS 18.6",@"18_iOS_18.png"],
            @[@"iOS 26.0",@"19_iOS_26.png"], @[@"iOS 26.1",@"19_iOS_26.png"]
        ];
        NSMutableArray *result = [NSMutableArray arrayWithCapacity:rows.count];
        for (NSArray *row in rows) [result addObject:@{@"name":row[0], @"image":row[1]}];
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
    metaLabel.text = @"Apple Inc.\nРазмер: демонстрационные данные";
    metaLabel.font = [UIFont systemFontOfSize:13];
    metaLabel.textColor = [UIColor secondaryLabelColor];
    metaLabel.numberOfLines = 2;
    [updateCard addSubview:metaLabel];

    UILabel *descriptionLabel = [[UILabel alloc] init];
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    descriptionLabel.text = @"Это демонстрационный макет обновления. Он показывает пример описания обновления системы безопасности и исправлений ошибок. Выбранная версия не устанавливается на устройство.";
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
    [_updateButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    _updateButton.titleLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightSemibold];
    _updateButton.backgroundColor = [UIColor systemBlueColor];
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
        message:@"Это настройка только демонстрационного макета. Параметры iOS не изменяются."
        preferredStyle:UIAlertControllerStyleActionSheet];

    [alert addAction:[UIAlertAction actionWithTitle:(current ? @"Выключить" : @"Включить")
        style:UIAlertActionStyleDefault
        handler:^(UIAlertAction *action) {
            [defaults setBool:!current forKey:key];
            UILabel *valueLabel = [sender viewWithTag:100 + tag];
            valueLabel.text = !current ? @"Вкл." : @"Выкл.";
        }]];

    [alert addAction:[UIAlertAction actionWithTitle:@"Отмена" style:UIAlertActionStyleCancel handler:nil]];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        alert.popoverPresentationController.sourceView = sender;
        alert.popoverPresentationController.sourceRect = sender.bounds;
    }
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)downloadTapped {
    if (_checking) return;
    _checking = YES;
    _updateButton.enabled = NO;
    [_updateButton setTitle:@"Проверка…" forState:UIControlStateNormal];
    _updateButton.backgroundColor = [UIColor systemGrayColor];
    _statusLabel.text = @"Идёт имитация проверки обновления…";

    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (!strongSelf) return;

        strongSelf->_checking = NO;
        strongSelf->_statusLabel.text = @"Демонстрация завершена. Обновление не загружалось и не устанавливалось.";
        [strongSelf->_updateButton setTitle:@"Загрузить и установить" forState:UIControlStateNormal];
        strongSelf->_updateButton.backgroundColor = [UIColor systemBlueColor];
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
