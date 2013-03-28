//
//  UILabel+LableUtil.m
//  geoy
//
//  Created by Pharaoh on 13-3-17.
//  Copyright (c) 2013年 geoy. All rights reserved.
//

#import "UILabel+LableUtil.h"
#import <QuartzCore/QuartzCore.h>
@implementation UILabel (LableUtil)
-(void)addBorderAtBottomWithFrame:(CGRect) frame{
	CALayer* bottomBorderLayer = [CALayer layer];
	bottomBorderLayer.borderWidth = .5;
	bottomBorderLayer.frame = frame;//;
	bottomBorderLayer.borderColor = [UIColor colorWithRed:0.871 green:0.871 blue:0.871 alpha:1].CGColor;
	[self.layer insertSublayer:bottomBorderLayer atIndex:0];
}


@end
