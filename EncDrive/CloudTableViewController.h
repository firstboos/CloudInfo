//
//  CloudTableViewController.h
//  EncDrive
//
//  Created by Jeon BooSang on 2014. 12. 12..
//  Copyright (c) 2014년 Jeon BooSang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CloudNewTableViewController.h"

@interface CloudTableViewController : UITableViewController<CloudNewTableViewControllerDelegate>
@property (nonatomic, readonly) NSMutableArray *cloudList;

@end
