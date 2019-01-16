//
//  SendViewController.m
//  UImageTx
//
//  Created by 胡玲 on 2019/1/2.
//  Copyright © 2019 flybird. All rights reserved.
//

#import "SendViewController.h"

@interface SendViewController ()

@end

@implementation SendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _ImageUserT.text = [defaults objectForKey:@"username"];
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    
}

-(void)viewDidAppear:(BOOL)animated {
    
}

//@Prama view appdelegete
-(void)viewDidDisappear:(BOOL)animated {
    
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


//funcname\imagename\imagehash\imageuser\authoruser
//GET or POST API：localhost：8080/v1/putstate？

- (IBAction)selectImage:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
    
}
//imagepicker delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    [self dismissViewControllerAnimated:YES completion:nil];
    _ImageContentViewShow.image = image;
    
    NSData *imagedata = UIImageJPEGRepresentation(_ImageContentViewShow.image, 1);
    float length =[imagedata length]/1024;
    NSLog(@"image lenth=%f",length);
    
    //image hash
    unsigned char digest[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(imagedata.bytes, (CC_LONG)imagedata.length, digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH*2];
    for(int i=0;i<CC_SHA256_DIGEST_LENGTH;i++) {
        [output appendFormat:@"%02x",digest[i]];
    }
    
    _ImageHashT.text = (NSString *)output;
    
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)sendTx:(id)sender {
    
    NSString *imageuser = _ImageUserT.text;
    NSString *authoruser = _ImageAcceptUserT.text;
    NSString *imagename = _ImageNameT.text;
    NSString *imagehash = _ImageHashT.text;
    
    
    //AFNetworking post
    NSString *urlString = @"http://140.143.239.235:8080/app_v1/createTx";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSDictionary *parameters = @{@"image_user":imageuser,
                                 @"image_sender":imageuser,
                                 @"image_accepter":authoruser,
                                 @"image_name":imagename,
                                 @"image_hash":imagehash
                                 };
    [manager GET:urlString parameters:parameters headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
    
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}
@end
