//
//  GEOMyCartViewController.h
//  icar
//
//  Created by Pharaoh on 13-4-10.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GEOMyCartViewController : PSUICollectionViewController <UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;
@property (weak, nonatomic) IBOutlet UILongPressGestureRecognizer *longPressGesture;
- (IBAction)closeModal:(UIButton *)sender;
- (IBAction)longPressed:(UILongPressGestureRecognizer *)sender;
- (IBAction)tapped:(UITapGestureRecognizer* )sender;
- (IBAction)toggleEditMode:(id)sender;
@property(nonatomic)BOOL editMode;
@property(nonatomic)BOOL deleteMode;
@end
