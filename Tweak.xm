#import "libactivator.h"
#import "headers.h"

static SpringBoard *springBoard = nil;

@interface LAHomer : NSObject <LAListener, UIAlertViewDelegate>
@end

NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.johnmatula.homerrr.plist"];
/*NSString* commandToRun = [[prefs objectForKey:@"commandToRun"] boolValue];*/
NSString *commandToRun = [prefs objectForKey:@"commandToRun"];
BOOL preventDefault = [[prefs objectForKey:@"preventDefault"] boolValue];

@implementation LAHomer

- (void)activator:(LAActivator *)activator receiveDeactivateEvent:(LAEvent *)event {

    system([commandToRun UTF8String]);

    if(preventDefault) {
      [event setHandled:YES]; // To prevent the default OS implementation
    }
}

- (void)openURL:(NSURL *)URL {
    if ([springBoard respondsToSelector:@selector(openURL:)]) {
        [springBoard openURL:URL];
    } else if ([springBoard respondsToSelector:@selector(applicationOpenURL:)]) {
        [springBoard applicationOpenURL:URL publicURLsOnly:NO animating:YES];
    }
}

+ (void)load {
    if ([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"])
        [[%c(LAActivator) sharedInstance] registerListener:[self new] forName:@"com.johnmatula.homerrr"];
}

@end

%hook SpringBoard

- (void)applicationDidFinishLaunching:(id)fp8 {
    %orig;
    springBoard = self;
}

%end
