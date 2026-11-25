#import "FAURootListController.h"
#import <Preferences/PSSpecifier.h>

@implementation FAURootListController
- (NSArray *)specifiers {
    if (_specifiers) return _specifiers;
    PSSpecifier *group = [PSSpecifier preferenceSpecifierNamed:@"Локальный макет обновления" target:self set:NULL get:NULL detail:nil cell:PSGroupCell edit:nil];
    [group setProperty:@"Выбери версию iOS и открой предпросмотр. Настоящая загрузка и установка обновлений не выполняются." forKey:@"footerText"];
    PSSpecifier *versions = [PSSpecifier preferenceSpecifierNamed:@"Выбрать версию iOS" target:self set:NULL get:NULL detail:nil cell:PSButtonCell edit:nil];
    [versions setProperty:@"showVersionPicker:" forKey:@"action"];
    PSSpecifier *preview = [PSSpecifier preferenceSpecifierNamed:@"Предпросмотр обновления" target:self set:NULL get:NULL detail:nil cell:PSButtonCell edit:nil];
    [preview setProperty:@"showUpdatePreview:" forKey:@"action"];
    _specifiers = [NSMutableArray arrayWithObjects:group, versions, preview, nil];
    return _specifiers;
}
- (void)showVersionPicker:(PSSpecifier *)specifier {
    Class cls = NSClassFromString(@"FakeUpdateVersionPickerController");
    if (!cls) return;
    UIViewController *controller = [[cls alloc] init];
    controller.title = @"Версия iOS";
    [self.navigationController pushViewController:controller animated:YES];
}
- (void)showUpdatePreview:(PSSpecifier *)specifier {
    Class cls = NSClassFromString(@"FakeUpdatePreviewController");
    if (!cls) return;
    [self.navigationController pushViewController:[[cls alloc] init] animated:YES];
}
@end
