//
//  LCViewController.m
//  LCKit
//
//  Created by linhua on 11/16/2015.
//  Copyright (c) 2015 linhua. All rights reserved.
//

#import "LCViewController.h"

@interface LCViewController ()

@end

@implementation LCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delaysContentTouches = NO;
    
    NSString *url1 = @"http://china.huanqiu.com/article/2015-12/8268412.html?from=bdwz";
    
    NSString *url2 = @"http://baijia.baidu.com/?tn=topic&topicid=x68ce1OS";
    
    NSString *url3 = @"http://www.cankaoxiaoxi.com/roll/roll10/2015/1227/1038511.shtml";
    
    LCNetworkEngine *engine = [LCNetworkEngine sharedEngine];
    AFHTTPRequestOperation *operation1 =
    [engine requestWithMethod:HttpMethodGet
                                            URLString:url1
                                           parameters:nil
                                         successBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
                                             NSLog(@"url1 : %@",responseObject);
                                         } failedBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
                                             NSLog(@"%@",[error localizedDescription]);
                                         } autoRetry:1];
    ((NSMutableURLRequest *)operation1.request).timeoutInterval = 20;
    
    AFHTTPRequestOperation *operation2 =
    [engine requestWithMethod:HttpMethodGet
                                            URLString:url2
                                           parameters:nil
                                         successBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
                                             NSLog(@"url2 : %@",responseObject);
                                         } failedBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
                                             NSLog(@"%@",[error localizedDescription]);
                                         } autoRetry:1];
    
    AFHTTPRequestOperation *operation3 =
    [engine requestWithMethod:HttpMethodGet
                                            URLString:url3
                                           parameters:nil
                                         successBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
                                             NSLog(@"url3 : %@",responseObject);
                                         } failedBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
                                             NSLog(@"%@",[error localizedDescription]);
                                         } autoRetry:1];
    
    [engine.operationQueue addOperations:@[operation1,operation2,operation3] waitUntilFinished:NO];
    [engine.operationQueue setCompletion:^{
        // handle operation queue's completion here (launched in main thread!)
        NSLog(@"completed");
    }];}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
//    cell.textLabel.text = [NSString stringWithFormat:@"%ld,%ld",(long)indexPath.section,(long)indexPath.row];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, cell.bounds.size.width, cell.bounds.size.height);
    [btn setTitle:@"button" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    [cell.contentView addSubview:btn];
    
    [cell delayContentTouches:NO];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc inViewController:self animated:YES backButtonTitle:@""];
}

@end
