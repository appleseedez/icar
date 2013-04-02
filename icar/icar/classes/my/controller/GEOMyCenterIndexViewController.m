//
//  GEOMyCenterIndexViewController.m
//  icar
//
//  Created by Pharaoh on 13-3-30.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "GEOMyCenterIndexViewController.h"

@interface GEOMyCenterIndexViewController ()

@end

@implementation GEOMyCenterIndexViewController


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	return 100.0f;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return 3;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
	static NSString* HeaderCellIdentifier = @"MyProfileCell";
	UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:HeaderCellIdentifier];
	if (nil == cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HeaderCellIdentifier];
	}
	tableView.separatorColor = [UIColor clearColor];
	return cell;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	//NSString* TopCellIndentifier = @"MyStuffTopCell";
	NSString* CellIdentifier = @"MyStuffCell";
	UITableViewCell* cell;
	
	cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (nil == cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}

//	if (indexPath.row == 0) {
//		cell = [tableView dequeueReusableCellWithIdentifier:TopCellIndentifier];
//		if (nil == cell) {
//			cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TopCellIndentifier];
//		}
//	}else{
//		cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//		if (nil == cell) {
//			cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//		}
//	}
	
	
	return cell;
}
@end
