//
//  GEOMyCartViewController.m
//  icar
//
//  Created by Pharaoh on 13-4-10.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "GEOMyCartViewController.h"
#import "GEOCartItemThumbLayout.h"
#import "CartItemCell.h"
@interface GEOMyCartViewController ()

@end

@implementation GEOMyCartViewController
- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	self.collectionView.collectionViewLayout = [[GEOCartItemThumbLayout alloc] init];
	
}

- (NSInteger)numberOfSectionsInCollectionView:(PSUICollectionView *)collectionView{
	return 3;
}


- (NSInteger)collectionView:(PSUICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
	NSInteger itemCountForEachSection = 0;
	switch (section) {
		case 0:
			itemCountForEachSection = 11;
			break;
		case 1:
			itemCountForEachSection = 14;
			break;
		default:
			itemCountForEachSection = 12;
			break;
	}
	return itemCountForEachSection;
}

- (PSUICollectionViewCell *)collectionView:(PSUICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
	static NSString* CollectionViewCellIdentifier = @"CartItemCell";
	CartItemCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewCellIdentifier forIndexPath:indexPath];
//	
//	[cell.oldPriceLabel addBorderAtMid];
	return cell;
}
#pragma  mark - actions
- (IBAction)closeModal:(UIButton *)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
	
}
@end
