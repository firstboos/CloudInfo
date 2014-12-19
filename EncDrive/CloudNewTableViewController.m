//
//  CloudNewTableViewController.m
//  EncDrive
//
//  Created by Jeon BooSang on 2014. 12. 16..
//  Copyright (c) 2014년 Jeon BooSang. All rights reserved.
//

#import "CloudNewTableViewController.h"
#import "Cloud.h"

@interface CloudNewTableViewController ()
{
    NSString *_cloudName;
}
@end

@implementation CloudNewTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.detailLabel.text = _cloudName;
    self.detailLabel.text = @"None";
    NSLog(@"after send. viewDidLoad: %@", _cloudName);
//    _pickerArray = @[@"Dropbox", @"GoogleDrive", @"SkyDrive"];
//    self.cloudInfoPicker.dataSource = self;
//    self.cloudInfoPicker.delegate = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// PickerView
//- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
//    return 1;
//}
//
//- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
//    return [self.pickerArray count];
//}
//
//- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
//    return _pickerArray[row];
//}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 3;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"cloudInfoCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                    forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    cell.detailTextLabel.text = _cloudName;
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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
    if ([segue.identifier isEqualToString:@"pickSegue"]) {
        CloudPickerViewController *cloudPickerViewController = segue.destinationViewController;
        cloudPickerViewController.delegate = self;
        cloudPickerViewController.cloudName = _cloudName;
    }
}

- (IBAction)cancel:(id)sender {
    [self.delegate cloudNewTableViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender {
    Cloud *cloud = [[Cloud alloc]init];
    cloud.cloudName = _cloudName;
    cloud.userName = self.userNameInputText.text;
    [self.delegate cloudNewTableViewController:self didAddCloud:cloud];
}

- (void)cloudPickerViewController:(CloudPickerViewController *)controller didSelectCloud:(NSString *)cloudName {
    NSLog(@"picker send: %@", cloudName);
    _cloudName = cloudName;
    self.detailLabel.text = _cloudName;
    
    [self.tableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
