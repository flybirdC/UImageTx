//
//  ViewController.h
//  UImageTx
//
//  Created by 胡玲 on 2019/1/2.
//  Copyright © 2019 flybird. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigateViewController.h"
#import "SendViewController.h"

@interface ViewController : UIViewController
- (IBAction)login:(id)sender;
- (IBAction)regist:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *loginname;
@property (weak, nonatomic) IBOutlet UITextField *loginpass;


@end

