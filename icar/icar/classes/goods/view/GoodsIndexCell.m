//
//  ServiceIndexCell.m
//  geoy
//
//  Created by Pharaoh on 13-3-16.
//  Copyright (c) 2013年 geoy. All rights reserved.
//

#import "GoodsIndexCell.h"

@implementation GoodsIndexCell

- (void)drawRect:(CGRect)rect{
	[super drawRect:rect];
	[self.thumbView addBorder];
	[self addGradientBackground];
}
@end
