//
//  ViewController.m
//  ContactForm
//
//  Created by Balasubramanian on 4/11/17.
//  Copyright © 2017 Balasubramanian. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBarHidden = NO;
    [self.navigationItem setTitle:@"Contact Form"];

    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
    //Remove the old value's
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:[[NSBundle mainBundle] bundleIdentifier]];

    
    //Segment tablecell registering
    [self.tableview registerNib:[UINib nibWithNibName:@"SegmentTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"SegmentTableViewCell"];

    
    
}

- (void)viewWillAppear:(BOOL)animated {

    [self.tableview reloadData];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 9 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
        return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    //Setting the header title
    if (section==0) {
        return  @"First Name";
    }
    if (section==1) {
        return @"Last Name";
    }
    if (section==2) {
       return @"Age";
    }
    if (section==3) {
        return @"Gender";
    }
    if (section==4) {
        return @"Address 1";
    }
    if (section==5) {
        return@"Address 2";
    }
    if (section==6) {
        return @"Zip Code";
    }
    if (section==7) {
        return @"State";
    }
    
    else {
        return @"Country";
    }

}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SegmentTableViewCell *cell1;

    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }

    //Fetching the value's after the keyvalue

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ( (indexPath.section == 0 && indexPath.row == 0) ){
        cell.textLabel.text = [defaults objectForKey:@"FirstName"];
        
    }
    if ( (indexPath.section == 1 && indexPath.row == 0) ){
        cell.textLabel.text = [defaults objectForKey:@"LastName"];
        
    }
    
    if ( (indexPath.section == 2 && indexPath.row == 0)){
        cell.textLabel.text = [defaults objectForKey:@"age"];
        
    }

    if ( (indexPath.section == 3 && indexPath.row == 0) ){
        cell.textLabel.text = [defaults objectForKey:@"gender"];
        //setting gender segment controll
        cell1 = [tableView dequeueReusableCellWithIdentifier:@"SegmentTableViewCell"];
        
    }
    if ( (indexPath.section == 4 && indexPath.row == 0) ){
        cell.textLabel.text = [defaults objectForKey:@"address1"];
        
    }
    if ( (indexPath.section == 5 && indexPath.row == 0) ){
        cell.textLabel.text = [defaults objectForKey:@"address2"];
        
    }
    if ( (indexPath.section == 6 && indexPath.row == 0) ){
        cell.textLabel.text = [defaults objectForKey:@"zipcode"];
        
    }
    if ( (indexPath.section == 7 && indexPath.row == 0)){
        cell.textLabel.text = [defaults objectForKey:@"state"];
        
    }
    if ( (indexPath.section == 8 && indexPath.row == 0) ){
        cell.textLabel.text = [defaults objectForKey:@"country"];
        
    }
    
    //returning segmented control cell

    if ( (indexPath.section == 3 && indexPath.row == 0)){
        return  cell1;
    }
    
    else{
        //returning other cell's
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    }

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    NextViewController *detailView_controller = [self.storyboard instantiateViewControllerWithIdentifier:@"NextViewController"]; // set your storyboard identifier
    
    
    //Passing the  Values to next viewcontroller to set the textfield placeholder and title
    if(indexPath.section == 0 && indexPath.row == 0)
    {
        detailView_controller.contextString = @"First Name";

    }
    if(indexPath.section == 1 && indexPath.row == 0)
    {
        detailView_controller.contextString = @"Last Name";
        
    }
    if(indexPath.section == 2 && indexPath.row == 0)
    {
        detailView_controller.contextString = @"Age";
        
    }
    
    if(indexPath.section == 4 && indexPath.row == 0)
    {
        detailView_controller.contextString = @"Address 1";
        
    }
    if(indexPath.section == 5 && indexPath.row == 0)
    {
        detailView_controller.contextString = @"Address 2";
        
    }

    if(indexPath.section == 6 && indexPath.row == 0)
    {
        detailView_controller.contextString = @"Zip Code";
        
    }
    if(indexPath.section == 7 && indexPath.row == 0)
    {
        detailView_controller.contextString = @"State";
        
    }
    if(indexPath.section == 8 && indexPath.row == 0)    {
        detailView_controller.contextString = @"Country";
        
    }
    if(indexPath.section == 3 && indexPath.row == 0){
    //No didselect for gender segmentcontroll
    }
    else
    [self.navigationController pushViewController:detailView_controller animated:YES];

}


//Done Btn action
-(IBAction)doneBTNClicked:(id)sender{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert"
                                                                   message:@"Form Submitted successfully."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *closeAction = [UIAlertAction actionWithTitle:@"Ok"
                                                          style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                              NSLog(@"Form Submitted successfully.");
                                                              
                                                               [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:[[NSBundle mainBundle] bundleIdentifier]];
                                                              [self.tableview reloadData];

                                                          }];
    
    [alert addAction:closeAction];
    [self presentViewController:alert animated:YES completion:nil];
    

    
}

-(IBAction)cacelBTNClicked:(id)sender{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert"
                                                                   message:@"Are you sure to cancel the form ? "
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *closeAction = [UIAlertAction actionWithTitle:@"Yes"
                                                          style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                              NSLog(@"Form Cancelled successfully.");
                                                              
                                                              [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:[[NSBundle mainBundle] bundleIdentifier]];
                                                              [self.tableview reloadData];
                                                          }];
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"No"
                                                          style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                              NSLog(@"Form has not cancelled .");
                                                              
                                                              
                                                          }];
    
    [alert addAction:closeAction];
    [alert addAction:noAction];
    [self presentViewController:alert animated:YES completion:nil];
    
   
    
}

@end
