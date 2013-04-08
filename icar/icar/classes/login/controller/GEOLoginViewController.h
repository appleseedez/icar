//
//  GEOLoginViewController.h
//  icar
//
//  Created by Pharaoh on 13-4-7.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GEOLoginViewController : UITableViewController

- (IBAction)closeLoginView:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (nonatomic,copy) void (^successBlock)(void); // 由于block是在栈内存中.必须copy
@property (nonatomic,copy) void (^failureBlock)(void);
- (IBAction)doLogin:(UIButton *)sender;


@end
