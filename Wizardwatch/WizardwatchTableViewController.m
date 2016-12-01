//
//  WizardwatchTableViewController.m
//  Wizardwatch
//
//  Created by HSummy on 11/30/16.
//  Copyright © 2016 HSummy. All rights reserved.
//

#import "WizardwatchTableViewController.h"
#import "Wizard.h"

@interface WizardwatchTableViewController ()

@property (nonatomic) NSMutableArray *wizards;

@end

@implementation WizardwatchTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.wizards = [[NSMutableArray alloc]init];
    
    [self loadWizards];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (void)loadWizards
{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"wizards" ofType:@"json"];
    NSArray *wizardsJSON = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error:nil];
    
    for (NSDictionary *aDictionary in wizardsJSON)
        
    {
        //aDictionary is not related to my name of wizardDictionary since this is in its own 'world' within a method...BUT it could have the same name if i wanted...but both are NOT related.
        Wizard *aWizard = [Wizard wizardWithDictionary:aDictionary];
        //  adding wizards to the wizards array below
        [self.wizards addObject:aWizard];
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.wizards.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WizardCell" forIndexPath:indexPath];
    
    // Configure the cell in the ViewController by bringing in the Dictionary into 'indexPath.row'
    Wizard *aWizard = self.wizards[indexPath.row];
    
    //calling the "name" from JSON into the left side of the label.
    cell.textLabel.text = aWizard.name;
    //calling the "house" from JSON into the right side of the label.
    cell.detailTextLabel.text = aWizard.house;
    
    return cell;
}

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
