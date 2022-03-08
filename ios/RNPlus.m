#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(RNPlus, NSObject)

RCT_EXTERN_METHOD(navigate:(NSString *)module to:(NSString *)route)

@end
