//
//  GEOLoginViewController.m
//  icar
//
//  Created by Pharaoh on 13-4-7.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "GEOLoginViewController.h"

@interface GEOLoginViewController ()
@property(nonatomic) UIView* backGroundView;


@property (weak, nonatomic) IBOutlet UIButton *loginButton;


@end

@implementation GEOLoginViewController


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


	[self.loginButton.layer setBorderColor:[UIColor clearColor].CGColor];
	[self.loginButton.layer setBorderWidth:1];
	[self.loginButton.layer setCornerRadius:3];
	self.loginButton.clipsToBounds = YES;
}





- (IBAction)closeLoginView:(UIButton *)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidUnload {

	[self setHeaderView:nil];

	[self setLoginButton:nil];
	[super viewDidUnload];
}


- (IBAction)doLogin:(UIButton *)sender {
	///NSAssert(self.successBlock == nil, @"opps");
	if (YES && self.successBlock) {
		[self dismissViewControllerAnimated:YES completion:^{
			self.successBlock();
		}];
		
	}
}
@end
