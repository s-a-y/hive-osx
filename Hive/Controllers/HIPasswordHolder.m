#import "HIPasswordHolder.h"

@interface HIPasswordHolder ()

@property (nonatomic, strong) NSMutableData *mutableDataPassword;

@end

@implementation HIPasswordHolder

- (void)dealloc {
    if (self.mutableDataPassword) {
        // The owner should have called clear right away.
        // Who knows how long it might have been retained.
        NSLog(@"Error: Password was not wiped from memory until deallocation.");
        [self clear];
    }
}

- (id)initWithString:(NSString *)password {
    self = [super init];
    if (self) {
        _mutableDataPassword = [[password dataUsingEncoding:NSUTF8StringEncoding] mutableCopy];
    }
    return self;
}

- (void)clear {
    [self.mutableDataPassword resetBytesInRange:NSMakeRange(0, self.mutableDataPassword.length)];
    self.mutableDataPassword = nil;
}

@end