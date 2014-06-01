#import "TestController.h"

static id sharedCntr = nil;

@implementation TestController {
	NSWindow *window;
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

- (void)createWindow {
	window = [[NSWindow alloc]
		initWithContentRect: NSMakeRect(300, 300, 200, 100)
				  styleMask: (NSTitledWindowMask |
						      NSMiniaturizableWindowMask |
						      NSResizableWindowMask)
				  backing: NSBackingStoreBuffered
					defer: YES];
	[window setTitle: @"Hello World"];
}

- (void)applicationWillFinishLaunching: (NSNotification *)aNotification {
	[self createMenu];
	[self createWindow];
}

- (void)applicationDidFinishLaunching: (NSNotification *)aNotification {
	[window makeKeyAndOrderFront: self];
}
@end
