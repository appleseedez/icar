//
//  GEOGoodsLocationViewController.h
//  icar
//
//  Created by Pharaoh on 13-3-28.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"
@interface GEOGoodsLocationViewController : UIViewController <BMKMapViewDelegate>
- (IBAction)close:(id)closeButton;
@property(nonatomic,weak) BMKMapManager* baiduMapManager;
@property(nonatomic,weak) CLLocation* goodyLocation;

@property (nonatomic) BMKMapView* mapView;


@end
