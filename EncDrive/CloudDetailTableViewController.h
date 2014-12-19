//
//  CloudDetailTableViewController.h
//  EncDrive
//
//  Created by Jeon BooSang on 2014. 12. 15..
//  Copyright (c) 2014년 Jeon BooSang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CloudDetailTableViewController : UITableViewController<UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *cloudInfoPicker;
@property (weak, nonatomic) IBOutlet UITextField *userNameInputText;
@property (weak, nonatomic) IBOutlet UITextField *userPassInputText;

@property NSArray* pickerArray;
@end
