//
//  CloudInfoViewController.m
//  EncDrive
//
//  Created by Jeon BooSang on 2014. 12. 12..
//  Copyright (c) 2014년 Jeon BooSang. All rights reserved.
//

#import "CloudInfoViewController.h"

@interface CloudInfoViewController ()

@end

@implementation CloudInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableData = [[NSArray alloc] initWithObjects:@"Aaron", @"Bailey", @"Cadan", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setCloud:(id)newCloud {
    if (_cloud != newCloud) {
        _cloud = newCloud;
    }
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0)
        return 1;
    else if (section == 1)
        return 2;
    else
        return 3;
//    return [self.tableData count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return [self.tableData count];
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    return [self.tableData objectAtIndex:section];
    if (section == 0)
        return @"Passcode";
    else
        return @"License";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    if (cell == nil)
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    
    cell.textLabel.text = [self.tableData objectAtIndex:indexPath.row];
    
    return cell;
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
