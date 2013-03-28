//
//  GEOGoodsIndexViewController.h
//  icar
//
//  Created by Pharaoh on 13-3-26.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataTableViewController.h"
@interface GEOGoodsIndexViewController : CoreDataTableViewController<CLLocationManagerDelegate>
@property(nonatomic) UIManagedDocument* iCarDatabase;
@property(nonatomic) CLLocation* currentLocation;
@property(nonatomic) CLLocation* lastLocation;
@property (weak, nonatomic) IBOutlet UIButton *refreshIndexButton;
@property(nonatomic) double searchRange;
- (IBAction)refreshIndex:(UIButton*)refreshButton;
- (IBAction) backToHome:(UIButton*)homeButton;
@end
