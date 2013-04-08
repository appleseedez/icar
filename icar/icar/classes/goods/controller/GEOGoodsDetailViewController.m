//
//  GEOGoodsDetailViewController.m
//  icar
//
//  Created by Pharaoh on 13-3-28.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "GEOGoodsDetailViewController.h"
#import "GEOInputAccessoryToolbar.h"
#import "UIViewController+LoginManager.h"
@interface GEOGoodsDetailViewController ()
@property (nonatomic) NSMutableArray* protoypeCellHeight;
@property (nonatomic) UITextField* field;
@property (nonatomic) GEOInputAccessoryToolbar* inputAccessoryToolbar;
@end

@implementation GEOGoodsDetailViewController

- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	self.protoypeCellHeight = [@[@(160.0f),@(120.0f)] mutableCopy];
	
	self.field = [[UITextField alloc] initWithFrame:CGRectZero];
	[self.navigationController.toolbar addSubview:self.field];
}

- (void) viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:animated];
	[self.field removeFromSuperview];
	self.field = nil;
}
- (void)viewDidLoad{
	self.goodyLocation = [[CLLocation alloc] initWithLatitude:30.66155 longitude:104.05008];
	
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	
    return 2;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self tableView:tableView cellFactoryForRowAtIndexPath:indexPath];
}

/**
 cell factory
 */
- (UITableViewCell*)tableView:(UITableView *)tableView cellFactoryForRowAtIndexPath:(NSIndexPath *)indexPath{
	if (indexPath.row == 0) {
		NSString *CellIdentifier = @"GoodyMetaCell";
		GoodyMetaCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		
		if (nil == cell) {
			cell = [[GoodyMetaCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		}
		// 获取storyboard中设计原型的label高度.如果比这个高,就需要调整单元格高度了
		float prototypeLabelHeight =  cell.addressLabel.bounds.size.height;
		
	//	cell.priceLabel.text =[NSString stringWithFormat:@"$%@",self.service.price];
	//	cell.nameLabel.text = self.service.name;
		
		cell.addressLabel.text =@"地址:深圳市南山区高新科技园中区一路腾讯大厦\r\n联系电话:12345678\n 欧舒丹男的哦了欧舒丹呢哦对神农你哦都你到哪法 SD发到 的说法的想藕粉大都市SD发奥迪";
		cell.addressLabel.font = [UIFont fontWithName:@"Arial" size:10];
		[cell.addressLabel sizeToFit];
		// 调整单元格高度 该单元格数据重新载入
		if (cell.addressLabel.bounds.size.height > prototypeLabelHeight) {
			[self.protoypeCellHeight replaceObjectAtIndex:indexPath.row
											   withObject:@([self.protoypeCellHeight[indexPath.row] floatValue] + cell.addressLabel.bounds.size.height - prototypeLabelHeight)];
			[tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
			
		}
		
		
		return cell;
	}
	if (indexPath.row == 1) {
		NSString *CellIdentifier = @"GoodyGalleryCell";
		GoodyGalleryCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		
		if (nil == cell) {
			cell = [[GoodyGalleryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		}
		return cell;
	}
	return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BlankCell"];
}

 
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
	static NSString* HeaderCellIdentifier = @"GoodyProviderCell";
	GoodyProviderCell* cell = [tableView dequeueReusableCellWithIdentifier:HeaderCellIdentifier];
	if (nil == cell) {
		cell = [[GoodyProviderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HeaderCellIdentifier];
	}

	return cell;
	
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return [self.protoypeCellHeight[indexPath.row] floatValue];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	return 48.0f;
}

#pragma mark - segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
	if ([segue.destinationViewController respondsToSelector:@selector(setGoodyLocation:)]) {
		[segue.destinationViewController setGoodyLocation:self.goodyLocation];
	}
}
#pragma mark - actions

- (void) hideKeyBoard{
	[self.field resignFirstResponder];
}

- (IBAction)close:(UIButton *)closeButton{
	[self dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)showDate:(UIBarButtonItem *)sender {
	
	// 此处要求登录
	[self checkLoginWithSuccessBlock:^{
		//
		self.field.inputView = [[UIDatePicker alloc] init];
		if (!self.inputAccessoryToolbar) {
			self.inputAccessoryToolbar = [[GEOInputAccessoryToolbar alloc] init];
		}
		self.inputAccessoryToolbar.hideKeyboardButton.target = self;
		self.inputAccessoryToolbar.hideKeyboardButton.action = @selector(hideKeyBoard);
		
		self.field.inputAccessoryView = self.inputAccessoryToolbar;
		
		
		[self.field becomeFirstResponder];
	} failBlock:^{
		//
	}];
}


@end
