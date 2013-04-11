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

- (void)awakeFromNib{
	[super awakeFromNib];
	[self.gallaryThumbView addBorder];
	[self.galleryThumbView2 addBorder];
	[self.gallaryThumbView3 addBorder];

}



@end
