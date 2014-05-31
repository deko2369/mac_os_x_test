#import "TestController.h"

static id sharedCntr = nil;

@implementation TestController {
}

+ (id)sharedController {
	if(sharedCntr == nil) {
		sharedCntr = [[[self class] alloc] init];
	}
	return sharedCntr;
}

- (void)terminate: (id)sender {
}

- (void)createMenu {
	NSMenu *mainMenu = [[NSMenu alloc] initWithTitle: @"Tester"];
	NSMenuItem *menuItem;
	NSMenu *subMenu;

	menuItem = [mainMenu addItemWithTitle: @"quit"
								   action: @selector(terminate:)
							keyEquivalent: @"q"];
	subMenu = [[NSMenu alloc] initWithTitle: @"Apple"];
	[NSApp performSelector: @selector(setAppleMenu:) withObject: subMenu];
	[mainMenu setSubmenu: subMenu forItem: menuItem];
	[NSApp setWindowsMenu: subMenu];
	[NSApp setMainMenu: mainMenu];
}

- (void)applicationWillFinishLaunching: (NSNotification *)aNotification {
	[self createMenu];
}
@end
