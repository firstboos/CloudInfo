//
//  CloudInfoViewController.h
//  EncDrive
//
//  Created by Jeon BooSang on 2014. 12. 12..
//  Copyright (c) 2014년 Jeon BooSang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cloud.h"
//@class Cloud;

@interface CloudInfoViewController : UITableViewController

@property (strong, nonatomic) Cloud *cloud;

@property (nonatomic, strong) NSArray *tableData;

@end
