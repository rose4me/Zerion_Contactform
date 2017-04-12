//
//  NextViewController.m
//  ContactForm
//
//  Created by Balasubramanian on 4/11/17.
//  Copyright © 2017 Balasubramanian. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = NO;
    
    
    //Setting Placeholder string
    [self.textField setPlaceholder:self.contextString];
    [self.navigationItem setTitle:self.contextString];
    UIBarButtonItem *sendButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Done"
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(doneBTNClicked:)];
    
    self.navigationItem.rightBarButtonItem = sendButton;



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)doneBTNClicked:(id)sender{
    
    ViewController *detailView_controller;
    
    detailView_controller.returnValueString_updated = self.textField.text;
    
    //Setting the value's in to NSUserdefaults by keyvalue
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if([self.contextString  isEqual: @"First Name"]){
        [defaults setObject:self.textField.text  forKey:@"FirstName"];
    }
    if([self.contextString  isEqual: @"Last Name"]){
        [defaults setObject:self.textField.text  forKey:@"LastName"];
    }
    if([self.contextString  isEqual: @"Age"]){
        [defaults setObject:self.textField.text  forKey:@"age"];
    }
    if([self.contextString  isEqual: @"Gender"]){
        [defaults setObject:self.textField.text  forKey:@"gender"];
    }
    if([self.contextString  isEqual: @"Address 1"]){
        [defaults setObject:self.textField.text  forKey:@"address1"];
    }
    if([self.contextString  isEqual: @"Address 2"]){
        [defaults setObject:self.textField.text  forKey:@"address2"];
    }
    if([self.contextString  isEqual: @"Zip Code"]){
        [defaults setObject:self.textField.text  forKey:@"zipcode"];
    }
    if([self.contextString  isEqual: @"State"]){
        [defaults setObject:self.textField.text  forKey:@"state"];
    }
    if([self.contextString  isEqual: @"Country"]){
        [defaults setObject:self.textField.text  forKey:@"country"];
    }
    [defaults synchronize];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

-(void)alertViewShow{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert"
                                                                   message:@"New Value Added."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *closeAction = [UIAlertAction actionWithTitle:@"Ok"
                                                          style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                              NSLog(@"New Value Added.");
                                                          }];
    
    [alert addAction:closeAction];
    [self presentViewController:alert animated:YES completion:nil];

}
@end
