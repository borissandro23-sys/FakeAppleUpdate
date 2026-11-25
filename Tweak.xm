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
    UIButton *_updateButton;
    UILabel *_statusLabel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Обновление ПО";
    self.view.backgroundColor = [UIColor systemGroupedBackgroundColor];

    NSDictionary *selected = FAUSelectedVersion();
    UIImageView *artwork = [[UIImageView alloc] initWithImage:FAUImageForVersion(selected)];
    artwork.contentMode = UIViewContentModeScaleAspectFit;
    artwork.translatesAutoresizingMaskIntoConstraints = NO;

    UILabel *title = [[UILabel alloc] init];
    title.text = selected[@"name"];
    title.font = [UIFont systemFontOfSize:28 weight:UIFontWeightSemibold];
    title.textAlignment = NSTextAlignmentCenter;
    title.translatesAutoresizingMaskIntoConstraints = NO;

    UILabel *subtitle = [[UILabel alloc] init];
    subtitle.text = @"iOS содержит новые функции, улучшения и исправления ошибок.";
    subtitle.font = [UIFont systemFontOfSize:15];
    subtitle.textColor = [UIColor secondaryLabelColor];
    subtitle.textAlignment = NSTextAlignmentCenter;
    subtitle.numberOfLines = 0;
    subtitle.translatesAutoresizingMaskIntoConstraints = NO;

    UIView *detailsCard = [[UIView alloc] init];
    detailsCard.backgroundColor = [UIColor secondarySystemGroupedBackgroundColor];
    detailsCard.layer.cornerRadius = 12;
    detailsCard.translatesAutoresizingMaskIntoConstraints = NO;

    UILabel *details = [[UILabel alloc] init];
    details.text = @"Это демонстрационный экран FakeAppleUpdate. Данные версии выбраны вручную. Системная версия iOS не меняется.";
    details.font = [UIFont systemFontOfSize:14];
    details.textColor = [UIColor secondaryLabelColor];
    details.numberOfLines = 0;
    details.translatesAutoresizingMaskIntoConstraints = NO;
    [detailsCard addSubview:details];

    UILabel *size = [[UILabel alloc] init];
    size.text = @"Размер обновления    Макет";
    size.font = [UIFont systemFontOfSize:13];
    size.textColor = [UIColor secondaryLabelColor];
    size.translatesAutoresizingMaskIntoConstraints = NO;

    _statusLabel = [[UILabel alloc] init];
    _statusLabel.text = @"";
    _statusLabel.font = [UIFont systemFontOfSize:13];
    _statusLabel.textColor = [UIColor secondaryLabelColor];
    _statusLabel.textAlignment = NSTextAlignmentCenter;
    _statusLabel.numberOfLines = 0;
    _statusLabel.translatesAutoresizingMaskIntoConstraints = NO;

    _updateButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_updateButton setTitle:@"Загрузить и установить" forState:UIControlStateNormal];
    [_updateButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    _updateButton.titleLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightSemibold];
    _updateButton.backgroundColor = [UIColor systemBlueColor];
    _updateButton.layer.cornerRadius = 12;
    _updateButton.translatesAutoresizingMaskIntoConstraints = NO;
    [_updateButton addTarget:self action:@selector(showDemoNotice) forControlEvents:UIControlEventTouchUpInside];

    UILabel *footnote = [[UILabel alloc] init];
    footnote.text = @"Демонстрация интерфейса. Нажатие кнопки не запускает загрузку и не устанавливает прошивку.";
    footnote.font = [UIFont systemFontOfSize:12];
    footnote.textColor = [UIColor secondaryLabelColor];
    footnote.textAlignment = NSTextAlignmentCenter;
    footnote.numberOfLines = 0;
    footnote.translatesAutoresizingMaskIntoConstraints = NO;

    [self.view addSubview:artwork];
    [self.view addSubview:title];
    [self.view addSubview:subtitle];
    [self.view addSubview:detailsCard];
    [self.view addSubview:size];
    [self.view addSubview:_statusLabel];
    [self.view addSubview:_updateButton];
    [self.view addSubview:footnote];

    [NSLayoutConstraint activateConstraints:@[
        [artwork.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:18],
        [artwork.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [artwork.widthAnchor constraintEqualToConstant:190],
        [artwork.heightAnchor constraintEqualToConstant:120],
        [title.topAnchor constraintEqualToAnchor:artwork.bottomAnchor constant:14],
        [title.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [title.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
        [subtitle.topAnchor constraintEqualToAnchor:title.bottomAnchor constant:8],
        [subtitle.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:28],
        [subtitle.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-28],
        [detailsCard.topAnchor constraintEqualToAnchor:subtitle.bottomAnchor constant:22],
        [detailsCard.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:16],
        [detailsCard.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-16],
        [details.topAnchor constraintEqualToAnchor:detailsCard.topAnchor constant:14],
        [details.bottomAnchor constraintEqualToAnchor:detailsCard.bottomAnchor constant:-14],
        [details.leadingAnchor constraintEqualToAnchor:detailsCard.leadingAnchor constant:16],
        [details.trailingAnchor constraintEqualToAnchor:detailsCard.trailingAnchor constant:-16],
        [size.topAnchor constraintEqualToAnchor:detailsCard.bottomAnchor constant:18],
        [size.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [_updateButton.topAnchor constraintEqualToAnchor:size.bottomAnchor constant:18],
        [_updateButton.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:16],
        [_updateButton.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-16],
        [_updateButton.heightAnchor constraintEqualToConstant:50],
        [_statusLabel.topAnchor constraintEqualToAnchor:_updateButton.bottomAnchor constant:12],
        [_statusLabel.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [_statusLabel.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
        [footnote.topAnchor constraintGreaterThanOrEqualToAnchor:_statusLabel.bottomAnchor constant:12],
        [footnote.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [footnote.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
        [footnote.bottomAnchor constraintLessThanOrEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-12]
    ]];
}
- (void)showDemoNotice {
    _statusLabel.text = @"Демонстрация завершена. Обновление не загружалось.";
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Демонстрационный режим" message:@"FakeAppleUpdate не выполняет проверку серверов Apple, загрузку или установку iOS." preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"ОК" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}
@end

%ctor {
    NSLog(@"[FakeAppleUpdate] Loaded in Preferences");
}
