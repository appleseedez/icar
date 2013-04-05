//
//  CommentCell.m
//  icar
//
//  Created by Pharaoh on 13-3-29.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "CommentCell.h"

@implementation CommentCell

- (void)drawRect:(CGRect)rect{
	[super drawRect:rect];
	[self.thumbView addBorder];
	[self addColorBackground];
}
@end
