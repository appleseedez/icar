//
//  GEOInputAccessoryToolbar.m
//  icar
//
//  Created by Pharaoh on 13-4-7.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "GEOInputAccessoryToolbar.h"

@implementation GEOInputAccessoryToolbar
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"GEOInputAccessoryView" owner:self options:nil][0];
    }
    return self;
}


@end
