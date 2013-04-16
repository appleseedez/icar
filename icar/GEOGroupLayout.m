//
//  GEOGroupLayout.m
//  icar
//
//  Created by Pharaoh on 13-4-13.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "GEOGroupLayout.h"

@implementation GEOGroupLayout
- (id)init{
	if (self = [super init]) {
		self.sectionInset = UIEdgeInsetsMake(10,10,10,10);
		self.itemSize = CGSizeMake(45, 45);
	}
	
	return self;
}

- (CGSize)collectionViewContentSize{
	CGSize size = [super collectionViewContentSize];
	size.width = 300;
	return size;
}
@end
