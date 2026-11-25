#import <UIKit/UIKit.h>

// Initial scaffold only.
// The fake update interface will be implemented as an isolated local UI.
// Do not hook Apple's download, verification, installation, or persistence APIs.

%ctor {
    NSLog(@"[FakeAppleUpdate] Loaded (UI prototype scaffold)");
}
