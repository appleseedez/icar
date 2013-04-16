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
#import "GEOGroupLayout.h"
@interface GEOMyCartViewController ()
@property(nonatomic) CAAnimation* anim;
@property(nonatomic) GEOCartItemThumbLayout* cartItemThumbLayout;
@property(nonatomic) GEOGroupLayout* cartItemGroupLayout;
@end

@implementation GEOMyCartViewController
- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	NSAssert(self.cartItemThumbLayout == nil, @"layout exist");
	self.cartItemThumbLayout = [[GEOCartItemThumbLayout alloc] init];
	self.cartItemGroupLayout = [[GEOGroupLayout alloc] init];
	self.collectionView.collectionViewLayout = self.cartItemThumbLayout;

	
	self.collectionView.allowsMultipleSelection = YES;
	self.anim = [self getShakeAnimation];
	self.editMode = NO;
	self.deleteMode = NO;
	// 把自己定义的手势和系统默认的手势链接
	NSArray* gestures = [self.collectionView gestureRecognizers];
	for (UIGestureRecognizer* gesture in gestures) {
		if ([gesture isKindOfClass:[UILongPressGestureRecognizer class]]) {
			[gesture requireGestureRecognizerToFail:self.longPressGesture];
		}
		if ([gesture isKindOfClass:[UITapGestureRecognizer class]]) {
			[gesture requireGestureRecognizerToFail:self.tapGesture];
		}
		
	}

}

- (CAAnimation*)getShakeAnimation
{
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	
    CGFloat wobbleAngle = 0.06f;
	
    NSValue* valLeft = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(wobbleAngle, 0.0f, 0.0f, 1.0f)];
    NSValue* valRight = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(-wobbleAngle, 0.0f, 0.0f, 1.0f)];
    animation.values = [NSArray arrayWithObjects:valLeft, valRight, nil];
	
    animation.autoreverses = YES;
    animation.duration = 0.35;
    animation.repeatCount = INFINITY;
	
    return animation;
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
	if (self.deleteMode) {
		[cell.layer addAnimation:self.anim forKey:@"wobble"];
	}else{
		[cell.layer removeAnimationForKey:@"wobble"];
	}
	
	
	return cell;
}

- (PSUICollectionReusableView *)collectionView:(PSUICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
	static NSString* CollectionViewHeaderCellIdentifer = @"CartItemHeaderCell";
	PSUICollectionReusableView* headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:CollectionViewHeaderCellIdentifer forIndexPath:indexPath];
	return headerView;
}
#pragma  mark - actions
- (IBAction)closeModal:(UIButton *)sender {
	[self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)longPressed:(UILongPressGestureRecognizer *)sender{
	CGPoint pressedCellPoint = [sender locationInView:self.collectionView];
	NSIndexPath* indexPath = [self.collectionView indexPathForItemAtPoint:pressedCellPoint];
	if (nil != indexPath) {
		if (!self.deleteMode) {
			self.deleteMode = YES;
			[self.collectionView reloadData];
		}
	}
		
	
}

- (IBAction)tapped:(UITapGestureRecognizer *)sender{
	if (self.deleteMode) {
		self.deleteMode = NO;
		[self.collectionView reloadData];
	}else{
		
	}
	
	

}
- (IBAction)toggleEditMode:(id)sender{
//	
//	if (self.editMode) {
//		self.editMode = NO;
//		self.collectionView.collectionViewLayout = self.cartItemThumbLayout;
//	}else{
//		self.editMode = YES;
//		self.collectionView.collectionViewLayout = self.cartItemGroupLayout;
//	}
	if (self.editMode) {
		if (self.deleteMode) {
			self.deleteMode = NO;
			[self.collectionView reloadData];
		}
		
		[self.collectionView removeGestureRecognizer:self.tapGesture];
		[self.collectionView removeGestureRecognizer:self.longPressGesture];
		self.editMode = NO;
		self.collectionView.allowsSelection = YES;
	}else{
		
		[self.collectionView addGestureRecognizer:self.tapGesture];
		[self.collectionView addGestureRecognizer:self.longPressGesture];
		self.collectionView.allowsSelection = NO;
		self.editMode = YES;
	}
	
}

- (void)viewDidUnload {
	[self setLongPressGesture:nil];
	[self setTapGesture:nil];
	[super viewDidUnload];
}
@end
