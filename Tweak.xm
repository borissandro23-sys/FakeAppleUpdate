#import <UIKit/UIKit.h>

@interface PSListController : UIViewController
@end

@interface PSSpecifier : NSObject
+ (instancetype)preferenceSpecifierNamed:(NSString *)name
                                  target:(id)target
                                     set:(SEL)setter
                                     get:(SEL)getter
                                  detail:(Class)detail
                                    cell:(NSInteger)cell
                                    edit:(Class)edit;
- (id)propertyForKey:(NSString *)key;
- (void)setProperty:(id)value forKey:(NSString *)key;
@end

@interface FakeUpdatePreviewController : UIViewController
@end

static NSString * const FAUDefaultsSuite = @"com.sasha.fakeappleupdate";
static NSString * const FAUAvailableKey = @"FakeUpdateAvailable";

@implementation FakeUpdatePreviewController {
    UIButton *_updateButton;
    UIActivityIndicatorView *_spinner;
    UILabel *_statusLabel;
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

    UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"gear"]];
    icon.tintColor = [UIColor systemBlueColor];
    icon.contentMode = UIViewContentModeScaleAspectFit;
    [icon.heightAnchor constraintEqualToConstant:54.0].active = YES;

    UILabel *heading = [[UILabel alloc] init];
    heading.text = @"Доступно обновление ПО";
    heading.font = [UIFont systemFontOfSize:22 weight:UIFontWeightSemibold];
    heading.textAlignment = NSTextAlignmentCenter;
    heading.numberOfLines = 0;

    UILabel *version = [[UILabel alloc] init];
    version.text = @"iOS 15.8.9";
    version.font = [UIFont systemFontOfSize:17];
    version.textAlignment = NSTextAlignmentCenter;
    version.textColor = [UIColor secondaryLabelColor];

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

    [stack addArrangedSubview:icon];
    [stack addArrangedSubview:heading];
    [stack addArrangedSubview:version];
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
            @"Ошибка проверки манифеста: ключ BuildVersion не найден",
        ];
        NSString *message = errors[arc4random_uniform((uint32_t)errors.count)];

        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Не удалось проверить обновление"
                                                                       message:message
                                                                preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"Повторить"
                                                  style:UIAlertActionStyleDefault
                                                handler:^(__unused UIAlertAction *action) {
            [self startFakeUpdate];
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"ОК"
                                                  style:UIAlertActionStyleCancel
                                                handler:nil]];
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

    BOOL alreadyAdded = NO;
    NSInteger updateIndex = NSNotFound;
    for (NSUInteger i = 0; i < original.count; i++) {
        id specifier = original[i];
        NSString *identifier = [specifier respondsToSelector:@selector(propertyForKey:)]
            ? [specifier propertyForKey:@"id"] : nil;
        if ([identifier isEqualToString:@"FAKE_UPDATE_PREVIEW"]) alreadyAdded = YES;
        if ([identifier isEqualToString:@"SOFTWARE_UPDATE_LINK"]) updateIndex = (NSInteger)i;
    }
    if (alreadyAdded || updateIndex == NSNotFound) return original;

    PSSpecifier *preview = [PSSpecifier preferenceSpecifierNamed:@"Предпросмотр обновления"
                                                               target:self
                                                                  set:NULL
                                                                  get:NULL
                                                               detail:FakeUpdatePreviewController.class
                                                                 cell:2
                                                                 edit:Nil];
    if (!preview) return original;
    [preview setProperty:@"FAKE_UPDATE_PREVIEW" forKey:@"id"];

    NSMutableArray *updated = [original mutableCopy];
    [updated insertObject:preview atIndex:(NSUInteger)updateIndex + 1];
    return updated;
}

%end

%ctor {
    NSLog(@"[FakeAppleUpdate] Local preview loaded");
}
