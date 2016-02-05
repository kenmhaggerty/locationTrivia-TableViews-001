//
//  FISLocationsTableViewController.m
//  locationTrivia-tableviews
//
//  Created by Ken M. Haggerty on 2/4/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocationsTableViewController.h"
#import "FISLocation.h"
#import "FISTriviaTableViewController.h"

@interface FISLocationsTableViewController ()

@end

@implementation FISLocationsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView setAccessibilityLabel:@"Locations Table"];
    [self.tableView setAccessibilityIdentifier:@"Locations Table"];
    
    [self setLocations:[FISLocation testData]];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
//    return self.locations.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.locations.count;
    
//    if (section >= self.locations.count) return 0;
//    
//    return ((FISLocation *)[self.locations objectAtIndex:section]).trivia.count;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    
//    if (section >= self.locations.count) return nil;
//    
//    return ((FISLocation *)[self.locations objectAtIndex:section]).name;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"locationCell" forIndexPath:indexPath];
    
    FISLocation *location = [self.locations objectAtIndex:indexPath.row];
    [cell.textLabel setText:location.name];
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"%lu", location.trivia.count]];
    
//    FISLocation *location = [self.locations objectAtIndex:indexPath.section];
//    FISTrivium *trivium = [location.trivia objectAtIndex:indexPath.row];
//    [cell.textLabel setText:trivium.content];
    
    return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewCellEditingStyleNone;
}

- (BOOL)tableView:(UITableView *)tableview shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return NO;
}

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

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
    NSMutableArray *mutableCopy = [self.locations mutableCopy];
    FISLocation *location = [mutableCopy objectAtIndex:fromIndexPath.row];
    [mutableCopy removeObject:location];
    [mutableCopy insertObject:location atIndex:toIndexPath.row];
    [self setLocations:mutableCopy];
}

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
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    FISLocation *location = [self.locations objectAtIndex:indexPath.row];
    [((FISTriviaTableViewController *)segue.destinationViewController) setTrivia:location.trivia];
}

@end
