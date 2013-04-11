//
//  GEOCartCell.m
//  icar
//
//  Created by Pharaoh on 13-4-9.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "GEOCartCell.h"
#import "UILabel+LableUtil.h"
@implementation GEOCartCell
- (void) drawRect:(CGRect)rect{
	[super drawRect:rect];
	[self.thumbView addBorder];
	[self.originPriceLabel addBorderAtMid];
	[self addColorBackground];
}
@end
