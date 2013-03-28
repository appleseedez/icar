//
//  GEOBaiduMapManager.m
//  icar
//
//  Created by Pharaoh on 13-3-28.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "GEOBaiduMapManager.h"

static GEOBaiduMapManager* _mapManagerInstance;
@implementation GEOBaiduMapManager
+ (void)initialize{
	NSAssert(self==[GEOBaiduMapManager class], @"Singleton! NOT for subclass");
	_mapManagerInstance = [GEOBaiduMapManager new];
}

+ (GEOBaiduMapManager *)share{
	return _mapManagerInstance;
}

@synthesize bmManager = _bmManager;

-(BMKMapManager *)bmManager{
	if (_bmManager ==nil) {
		_bmManager = [[BMKMapManager alloc] init];
	}
	return _bmManager;
}
@end
