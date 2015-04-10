//
//  ViewController.m
//  STNObjCSnippets
//
//  Created by Stone on 4/9/15.
//  Copyright (c) 2015 Stone. All rights reserved.
//

#import "ViewController.h"
#import "STNCheckNetworkConnectOperation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // NSOperation+block
    [self checkNetworkConnectOperation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)checkNetworkConnectOperation
{
    NSOperationQueue *networkQueue = [[NSOperationQueue alloc] init];
    STNCheckNetworkConnectOperation *networkOperation = [[STNCheckNetworkConnectOperation alloc] init];
    networkOperation.networkType = STNCheckNetworkConnectValueWifi;
    [networkOperation finishNetworkCheckHandler:^(NSString *param) {
        NSLog(@"finishNetworkCheckHandler:%@", param);
    }];
    [networkQueue addOperation:networkOperation];
}

@end
