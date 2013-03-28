//
//  ServiceIndexCell.h
//  geoy
//
//  Created by Pharaoh on 13-3-16.
//  Copyright (c) 2013年 geoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsIndexCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbView;
@property (weak, nonatomic) IBOutlet UILabel *serviceTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end
