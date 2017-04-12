//
//  ViewController.h
//  ContactForm
//
//  Created by Balasubramanian on 4/11/17.
//  Copyright © 2017 Balasubramanian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SegmentTableViewCell.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
}

@property (nonatomic,weak) IBOutlet UITableView *tableview;
@property (nonatomic, retain) NSString *returnValueString_updated;




@end

