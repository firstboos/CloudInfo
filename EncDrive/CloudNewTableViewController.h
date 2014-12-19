//
//  CloudNewTableViewController.h
//  EncDrive
//
//  Created by Jeon BooSang on 2014. 12. 16..
//  Copyright (c) 2014년 Jeon BooSang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cloud.h"
#import "CloudPickerViewController.h"

@class CloudNewTableViewController;

@protocol CloudNewTableViewControllerDelegate <NSObject>
- (void)cloudNewTableViewControllerDidCancel:(CloudNewTableViewController *)controller;
- (void)cloudNewTableViewController:(CloudNewTableViewController *)controller didAddCloud:(Cloud *)cloud;
@end

@interface CloudNewTableViewController : UITableViewController <CloudPickerViewControllerDelegate>
//@property (weak, nonatomic) IBOutlet UIPickerView *cloudInfoPicker;
@property (weak, nonatomic) IBOutlet UITextField *userNameInputText;
@property (weak, nonatomic) IBOutlet UITextField *userPassInputText;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@property NSArray* pickerArray;
@property (weak, nonatomic) id<CloudNewTableViewControllerDelegate> delegate;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;
@end
