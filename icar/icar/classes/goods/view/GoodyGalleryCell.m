//
//  ServiceGallaryCell.m
//  geoy
//
//  Created by Pharaoh on 13-3-19.
//  Copyright (c) 2013年 geoy. All rights reserved.
//

#import "GoodyGalleryCell.h"
#import "UIImageView+ImageUtil.h"
#import "UITableViewCell+BackgroundUtil.h"
@implementation GoodyGalleryCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)drawRect:(CGRect)rect{
	[super drawRect:rect];
	[self.gallaryThumbView addBorder];
	[self.galleryThumbView2 addBorder];
	[self.gallaryThumbView3 addBorder];
	[self addBackground];
	
}

@end
