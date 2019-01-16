//
//  TableViewController.m
//  UImageTx
//
//  Created by 胡玲 on 2019/1/12.
//  Copyright © 2019 flybird. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@property (strong, nonatomic) NSMutableArray *array;

@end

@implementation TableViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSString *urlString = @"http://140.143.239.235:8080/app_v1/queryLTx";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *defaultName = [defaults objectForKey:@"username"];
    
    NSDictionary *parameters = @{@"image_user":defaultName};
    [manager GET:urlString parameters:parameters headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    //test
    NSArray *testArray = [[NSArray alloc] initWithObjects:@"a",@"b",@"c",@"d", nil];
    self.array = [NSMutableArray arrayWithArray:testArray];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [self.array count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    NSString *identifier = [NSString stringWithFormat:@"Cell%lu",indexPath.row];
    
    UITableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (Cell == nil)
    {
        Cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    Cell.textLabel.text = [self.array objectAtIndex:indexPath.row];
    
    return Cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //go to image detail contracts viewcontroller
    
    NSObject *ob = (NSObject *)[self.array objectAtIndex:indexPath.row];
    
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
