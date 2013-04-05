//
//  GEOMyCenterViewController.m
//  icar
//
//  Created by Pharaoh on 13-4-3.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "GEOMyCenterViewController.h"

@interface GEOMyCenterViewController ()
@property(nonatomic) UIView* backGroundView;
@end

@implementation GEOMyCenterViewController



- (void)viewDidLoad
{
    [super viewDidLoad];

	self.tableView.separatorColor = [UIColor colorWithRed:0.878 green:0.878 blue:0.878 alpha:1];
	self.backGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, -self.tableView.bounds.size.height, self.tableView.bounds.size.width, self.tableView.bounds.size.height)];
	self.backGroundView.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1];
	[self.view insertSubview:self.backGroundView belowSubview:self.tableView];
	
	CALayer *bottomBorderLayer = [CALayer layer];
	bottomBorderLayer.borderColor = [UIColor colorWithRed:0.878 green:0.878 blue:0.878 alpha:1].CGColor;
	bottomBorderLayer.borderWidth = 4;
	bottomBorderLayer.frame = CGRectMake(0, self.headerView.bounds.size.height, self.headerView.bounds.size.width, 1);
	[self.headerView.layer addSublayer:bottomBorderLayer];
}

- (void)viewDidUnload {
	[self setHeaderView:nil];
	[super viewDidUnload];
}
@end
