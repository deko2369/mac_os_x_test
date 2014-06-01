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

- (void)createMenu {
	NSMenu *menubar = [NSMenu new];
	NSMenuItem *appMenuItem = [NSMenuItem new];

	// あちこちのサイトにあるこの記述は利用できない
	// スクラッチでやる場合は NSMenu を新たに生成し、
	// setMainMenu: メソッドで NSApp へ登録する
	// [[NSApp mainMenu] addItem: appMenuItem];

	[menubar addItem: appMenuItem];
	[NSApp setMainMenu: menubar];

	NSMenu *appMenu = [NSMenu new];
	NSMenuItem *quitMenuItem =
		[[NSMenuItem alloc] initWithTitle: @"Quit" 
								   action: @selector(terminate:)
							keyEquivalent: @"q"];
	[appMenu addItem: quitMenuItem];

	[appMenuItem setSubmenu: appMenu];
}

- (void)applicationWillFinishLaunching: (NSNotification *)aNotification {
	[self createMenu];
}
@end
