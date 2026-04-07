//
//  QumparaSDKResources.m
//  QumparaSDK
//
//  This file exists only to give Swift Package Manager a non-binary
//  source target so it has somewhere to attach `QumparaResources.bundle`
//  as a SPM resource. The bundle is consumed at runtime by
//  `+[NSBundle qpBundle]` (see NSBundle+KKQP.m in the source repo) via
//  the SWIFTPM_MODULE_BUNDLE accessor that SwiftPM auto-generates for
//  Objective-C targets that declare `resources:`.
//
//  Do not delete.
//

#import <Foundation/Foundation.h>

@interface QumparaSDKResources : NSObject
@end

@implementation QumparaSDKResources
@end
