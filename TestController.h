#import <Cocoa/Cocoa.h>

@interface TestController: NSObject <NSApplicationDelegate>
+ (id)sharedController;
- (void) applicationWillFinishLaunching: (NSNotification *)aNotification;
@end
