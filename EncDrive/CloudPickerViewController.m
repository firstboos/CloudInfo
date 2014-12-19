//
//  CloudPickerViewController.m
//  EncDrive
//
//  Created by Jeon BooSang on 2014. 12. 17..
//  Copyright (c) 2014년 Jeon BooSang. All rights reserved.
//

#import "CloudPickerViewController.h"

@interface CloudPickerViewController ()
{
    NSArray *clouds;
    NSUInteger selectedIndex;
}
@end

@implementation CloudPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    clouds = @[@"Dropbox", @"Google Drive", @"One Drive"];
    selectedIndex = [clouds indexOfObject:self.cloudName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return clouds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cloudsCell" forIndexPath:indexPath];
    cell.textLabel.text = clouds[indexPath.row];
    
    if (indexPath.row == selectedIndex)
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    else
        cell.accessoryType = UITableViewCellAccessoryNone;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (selectedIndex != NSNotFound) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:selectedIndex inSection:0]];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    selectedIndex = indexPath.row;
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    NSString *cloudName = clouds[indexPath.row];
    [self.delegate cloudPickerViewController:self didSelectCloud:cloudName];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
