#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(RNPlus, NSObject)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

RCT_EXTERN_METHOD(navigate:(NSString *)module to:(NSString *)route)
RCT_EXTERN_METHOD(back)

@end
