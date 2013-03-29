//
//  GEOCommentViewController.h
//  icar
//
//  Created by Pharaoh on 13-3-29.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataTableViewController.h"
@interface GEOCommentIndexViewController : CoreDataTableViewController

@property (nonatomic) UIManagedDocument* iCarDatabase;
- (IBAction)close:(UIButton*)closeButtion;
@end
