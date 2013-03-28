//
//  GEOBaiduMapManager.h
//  icar
//
//  Created by Pharaoh on 13-3-28.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BMapKit.h"
@interface GEOBaiduMapManager : NSObject
+ (GEOBaiduMapManager *)share;
@property(nonatomic,readonly) BMKMapManager* bmManager;
@end
