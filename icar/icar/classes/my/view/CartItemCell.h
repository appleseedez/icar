//
//  CartItemCell.h
//  icar
//
//  Created by Pharaoh on 13-4-10.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AutoDetectHeightUILabel.h"
@interface CartItemCell : PSUICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbView;
@property (weak, nonatomic) IBOutlet  UILabel*titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *oldPriceLabel;
- (void)enabledSelectEffect;
- (void) disableSelectEffect;
@end
