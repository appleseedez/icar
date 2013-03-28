//
//  GoodyMetaCell.h
//  geoy
//
//  Created by Pharaoh on 13-3-18.
//  Copyright (c) 2013年 geoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AutoDetectHeightUILabel.h"
@interface GoodyMetaCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalScoreLabel;

@property (weak, nonatomic) IBOutlet UILabel *pvCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *updateTimeLabel;
@property (weak, nonatomic) IBOutlet AutoDetectHeightUILabel *addressLabel;

@property (weak, nonatomic) IBOutlet UILabel *envScoreLabel; // 环境分
@property (weak, nonatomic) IBOutlet UILabel *attitudeScoreLabel; // 态度分
@property (weak, nonatomic) IBOutlet UILabel *accordScoreLabel; // 描述相符度分
@property (weak, nonatomic) IBOutlet UILabel *qualityScoreLabel;



@end
