//
//  CloudPickerViewController.h
//  EncDrive
//
//  Created by Jeon BooSang on 2014. 12. 17..
//  Copyright (c) 2014년 Jeon BooSang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CloudPickerViewController;

@protocol CloudPickerViewControllerDelegate <NSObject>
- (void) cloudPickerViewController:(CloudPickerViewController *)controller didSelectCloud:(NSString *)cloudName;
@end

@interface CloudPickerViewController : UITableViewController

@property (nonatomic, weak) id<CloudPickerViewControllerDelegate> delegate;
@property (nonatomic, weak) NSString *cloudName;
@end
