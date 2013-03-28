//
//  GEOGoodsDetailViewController.h
//  icar
//
//  Created by Pharaoh on 13-3-28.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodyMetaCell.h"
#import "GoodyProviderCell.h"
#import "GoodyGalleryCell.h"
@interface GEOGoodsDetailViewController : UITableViewController
- (IBAction)close:(UIButton*)closeButton;
@property (nonatomic) CLLocation* goodyLocation;
@property (nonatomic,weak) NSString* goodyId;
@end
