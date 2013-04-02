//
//  GEOMyStuffCell.m
//  icar
//
//  Created by Pharaoh on 13-3-31.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "GEOMyStuffCell.h"

@implementation GEOMyStuffCell
- (void)drawRect:(CGRect)rect{
	[super drawRect:rect];
	[self.thumbView addBorder];
	[self addColorBackground];
	
	UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width*.05, self.bounds.size.height, self.bounds.size.width*.9, 0.5)];
	line.backgroundColor = [UIColor colorWithRed:0.878 green:0.878 blue:0.878 alpha:1];// #e0e0e0
	
	UIImageView *lineShadow = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width*.9, self.bounds.size.height-2, self.bounds.size.width*.05, 2)];
	
	lineShadow.backgroundColor = [UIColor orangeColor];
	[self addSubview:line];
	[self addSubview:lineShadow];
}


@end
