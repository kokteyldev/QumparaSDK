//
//  QumparaSDK.h
//  QumparaSDK
//
//  Created by Tolga Seremet on 23.05.2019.
//  Copyright © 2019 Tolga Seremet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol QumparaSDKDelegate <NSObject>
@optional
- (void)didLoadOfferWall;
- (void)didFailToLoadOfferWallWithError:(NSError *)error;
- (void)didSpendVirtualCurrencyWithCode:(NSString *)currencyCode andAmound:(NSInteger)amount;
@end

@interface QumparaSDK : NSObject
+ (void)startWithApplicationID:(NSString *)applicationID;
+ (void)setDelegate:(id<QumparaSDKDelegate>)delegate;
+ (void)setAdjustID:(NSString *)adjustID;
+ (void)loadOfferwall;
+ (void)showOfferwallFromViewController:(UIViewController *)controller;
+ (void)spendVirtualCurrency;
+ (NSString *)SDKVersion;
@end

