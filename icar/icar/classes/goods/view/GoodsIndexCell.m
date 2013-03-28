//
//  ServiceIndexCell.m
//  geoy
//
//  Created by Pharaoh on 13-3-16.
//  Copyright (c) 2013年 geoy. All rights reserved.
//

#import "GoodsIndexCell.h"
#import "UIImageView+ImageUtil.h"
#import "UITableViewCell+BackgroundUtil.h"
@implementation GoodsIndexCell

- (void)drawRect:(CGRect)rect{
	[super drawRect:rect];
	[self.thumbView addBorder];
	[self addBackground];
}
@end
