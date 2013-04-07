//
//  GEOLoginHeaderView.m
//  icar
//
//  Created by Pharaoh on 13-4-7.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "GEOLoginHeaderView.h"

@implementation GEOLoginHeaderView

- (void)drawRect:(CGRect)rect
{
	[super drawRect:rect];
    [self.headerImageView addBorder];
}


@end
