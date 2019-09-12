//
//  QumparaSDK.h
//  QumparaSDK
//
//  Created by Tolga Seremet on 23.05.2019.
//  Copyright © 2019 Tolga Seremet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^QPSVirtualCurrencyCompletion)(NSString *currencyCode, NSInteger amount, NSError *error);

@protocol QumparaSDKDelegate <NSObject>
@optional
- (void)didLoadOfferWall;
- (void)didFailToLoadOfferWallWithError:(NSError *)error;
- (void)didShowOfferWall;
- (void)didDismissOfferWall;
@end

@interface QumparaSDK : NSObject
+ (void)startWithApplicationID:(NSString *)applicationID;
+ (void)startWithApplicationID:(NSString *)applicationID testMode:(BOOL)isTestMode;
+ (void)setDelegate:(id<QumparaSDKDelegate>)delegate;
+ (void)setUserID:(NSString *)userID;
+ (void)setAdjustID:(NSString *)adjustID;
+ (void)loadOfferwall;
+ (void)showOfferwallFromViewController:(UIViewController *)controller;
+ (void)spendVirtualCurrencyWithCompletion:(QPSVirtualCurrencyCompletion)completion;
+ (NSString *)SDKVersion;
@end

