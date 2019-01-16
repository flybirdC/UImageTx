//
//  SendViewController.h
//  UImageTx
//
//  Created by 胡玲 on 2019/1/2.
//  Copyright © 2019 flybird. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Security/Security.h>
#import "NavigateViewController.h"
#import "AFNetworking.h"

#include <CommonCrypto/CommonDigest.h>
#include <CoreFoundation/CoreFoundation.h>
#include <stdint.h>
#include <stdio.h>


@interface SendViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *ImageUserT;
@property (weak, nonatomic) IBOutlet UITextField *ImageAcceptUserT;
@property (weak, nonatomic) IBOutlet UITextField *ImageNameT;
@property (weak, nonatomic) IBOutlet UITextField *ImageHashT;
@property (weak, nonatomic) IBOutlet UIImageView *ImageContentViewShow;
- (IBAction)selectImage:(id)sender;
- (IBAction)sendTx:(id)sender;


@end

