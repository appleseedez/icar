//
//  CommentCell.h
//  icar
//
//  Created by Pharaoh on 13-3-29.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AutoDetectHeightUILabel.h"
@interface CommentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet AutoDetectHeightUILabel *comentLabel;

@end
