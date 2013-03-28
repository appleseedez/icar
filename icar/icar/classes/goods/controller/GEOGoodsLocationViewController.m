//
//  GEOGoodsLocationViewController.m
//  icar
//
//  Created by Pharaoh on 13-3-28.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "GEOGoodsLocationViewController.h"
#import "GEOBaiduMapManager.h"
@interface GEOGoodsLocationViewController ()

@end

@implementation GEOGoodsLocationViewController


- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	if (self.baiduMapManager ==nil) {
		self.baiduMapManager = [[GEOBaiduMapManager share] bmManager];
		BOOL ret = [self.baiduMapManager start:@"231E84632DE2DEBCA976E3ADF8E0732C9642006A" generalDelegate:nil];
		NSAssert(ret == YES, @"百度地图启动失败了");
		
	}
}


-(void)viewDidLoad{
	self.mapView = [[BMKMapView alloc] initWithFrame:self.view.bounds];
	self.mapView.delegate = self;
	BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];

	NSAssert(self.goodyLocation != nil, @"位置数据没有取到,无法标点");
	
	BMKCoordinateRegion region;
	region.center = self.goodyLocation.coordinate;
	BMKCoordinateSpan span;
	span.latitudeDelta = .005;
	span.longitudeDelta = .005;
	region.span = span;
	[self.mapView setRegion:region animated:YES];
	annotation.coordinate = self.goodyLocation.coordinate;
	annotation.title = @"在这里";
	[self.mapView addAnnotation:annotation];
	
	self.view = self.mapView;
}

-(BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation{
	if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
		BMKPinAnnotationView *newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"GoodyAnnotation"];
		newAnnotationView.pinColor = BMKPinAnnotationColorGreen;
		newAnnotationView.animatesDrop = YES;// 设置该标注点动画显示
		return newAnnotationView;
	}
	return nil;
}

#pragma mark - actions


- (void)close:(id)closeButton{
	[self.navigationController popViewControllerAnimated:YES];
}

@end
