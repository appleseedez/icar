//
//  GEOBackground.m
//  icar
//
//  Created by Pharaoh on 13-3-31.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "GEOBackground.h"

@implementation GEOBackground

- (void)drawRect:(CGRect)rect{
	CALayer* backgroundColorLayer = [CALayer layer];
	backgroundColorLayer.frame = self.bounds;
	backgroundColorLayer.backgroundColor = [UIColor colorWithRed:0.2 green:0.4 blue:0.6 alpha:.8].CGColor;
	
	[self.layer addSublayer:backgroundColorLayer];
	CALayer *bottomBorder = [CALayer layer];
	
	bottomBorder.frame = CGRectMake(0.0f, self.bounds.size.height, self.bounds.size.width, 1.0f);
	
	bottomBorder.backgroundColor = [UIColor colorWithRed:0.878 green:0.878 blue:0.878 alpha:1].CGColor;
	
	[self.layer addSublayer:bottomBorder];
}

@end
