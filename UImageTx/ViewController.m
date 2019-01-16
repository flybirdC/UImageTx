//
//  ViewController.m
//  UImageTx
//
//  Created by 胡玲 on 2019/1/2.
//  Copyright © 2019 flybird. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)login:(id)sender {
    
    NSString *name = _loginname.text;
    NSString *pass = _loginpass.text;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *defaultName = [defaults objectForKey:@"username"];
    NSString *defaultPass = [defaults objectForKey:@"userpass"];
    if (defaultName == nil) {
        NSLog(@"no name, to regist");
        _loginname.text = nil;
        _loginpass.text = nil;
    }
    
    if (defaultName != name) {
        NSLog(@"name error!");
    } else if (defaultPass != pass) {
        NSLog(@"pass error!");
    } else {
        
        //go to next cntroller
        SendViewController *sendview = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SendViewController"];
        [self.navigationController pushViewController:sendview animated:YES];
        
    }
    
}

- (IBAction)regist:(id)sender {
    
    NSString *name = _loginname.text;
    NSString *pass = _loginpass.text;
    
    //set userdefault
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:name forKey:@"username"];
    [defaults setObject:pass forKey:@"userpass"];
    [defaults synchronize];
    
    //go to next controller
    SendViewController *sendview = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SendViewController"];
    [self.navigationController pushViewController:sendview animated:YES];
    //create user
    
    
    //    NSLog(name);
    //    NSLog(pass);
    
//    GethAddress *address = [[GethAddress alloc] initFromHex:@"wangchong"];
//    [address getBytes];
}
@end


