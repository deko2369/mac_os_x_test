#import <Cocoa/Cocoa.h>
#import "TestController.h"

int main(int argc, const char *argv[]) {
	@autoreleasepool {
		TestController *testController = [TestController sharedController];
		NSApplication *app = [NSApplication sharedApplication];
		[app setDelegate: testController];
		return NSApplicationMain(argc, argv);
	}
}
