//
//  CloudTableViewController.m
//  EncDrive
//
//  Created by Jeon BooSang on 2014. 12. 12..
//  Copyright (c) 2014년 Jeon BooSang. All rights reserved.
//

#import "CloudTableViewController.h"
#import "CloudInfoViewController.h"
#import "Cloud.h"

@interface CloudTableViewController ()

@end

@implementation CloudTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // init
    //_cloudList = [NSMutableArray arrayWithCapacity:20];
    _cloudList = [[NSMutableArray alloc]init];
    Cloud *c1 = [[Cloud alloc]initWithName:@"DropBox"];
    Cloud *c2 = [[Cloud alloc]initWithName:@"OneDrive"];
    [self.cloudList addObject:c1];
    [self.cloudList addObject:c2];
    
    NSLog(@"Count : %ld", [self.cloudList count]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cloudList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CloudCell" forIndexPath:indexPath];
    
    Cloud *cloud = (Cloud *)[self.cloudList objectAtIndex:indexPath.row];
    if (cell == nil)
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CloudCell"];
    cell.textLabel.text = cloud.cloudName;
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.cloudList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
//  UIViewController *destination = segue.destinationViewController;
//    if ([segue.identifier isEqualToString:@"ShowCloudInfo"])
//        [destination setValue:sender forKeyPath:@"task"];
//    else
//        destination = [segue.destinationViewController topViewController];
//    [destination setValue:self forKeyPath:@"delegate"];
    if ([segue.identifier isEqualToString:@"addCloudSegue"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        CloudNewTableViewController *cloudNewViewController = [navigationController viewControllers][0];
        cloudNewViewController.delegate = self;
    }
    if ([segue.identifier isEqualToString:@"ShowCloudInfo"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Cloud *cloud = (Cloud *)[self.cloudList objectAtIndex:indexPath.row];
        [[segue destinationViewController] setCloud:cloud];
    }
}

#pragma mark - CloudNewTableViewControllerDelegate
- (void)cloudNewTableViewControllerDidCancel:(CloudNewTableViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)cloudNewTableViewController:(CloudNewTableViewController *)controller didAddCloud:(id)cloud {
    [self.cloudList addObject:cloud];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([self.cloudList count] - 1) inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
    
//    [self.tableView reloadData];
//    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
