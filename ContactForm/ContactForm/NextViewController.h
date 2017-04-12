//
//  NextViewController.h
//  ContactForm
//
//  Created by Balasubramanian on 4/11/17.
//  Copyright © 2017 Balasubramanian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface NextViewController : UIViewController{
    
    
}
@property (nonatomic) NSInteger *previousRowSelected;
@property (nonatomic, retain) NSString *contextString;
@property (nonatomic, retain) NSString *returnValueString;

@property (nonatomic, retain) IBOutlet UILabel *lblText;
@property (nonatomic, retain) IBOutlet UITextField *textField;



@end
