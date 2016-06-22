//
//  ViewController.m
//  STNObjCSnippets
//
//  Created by Stone on 4/9/15.
//  Copyright (c) 2015 Stone. All rights reserved.
//

#import "ViewController.h"
#import "STNCheckNetworkConnectOperation.h"
#import "STNMsgEntity.h"
#import "STNBlockTimer.h"

@interface ViewController ()

@property (nonatomic, strong) STNBlockTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addStopBtn];
    // NSOperation+block
//    [self checkNetworkConnectOperation];
    
    //CoreData
//    _myAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [self blockTimer];
}

#pragma mark - NSTimer + block

- (void)blockTimer
{
    _timer = [[STNBlockTimer alloc] init];
    [_timer start];
}

- (void)addStopBtn
{
    UIButton *btnA = [UIButton buttonWithType:UIButtonTypeCustom];
    btnA.frame = CGRectMake(80, 200, 80, 40);
    [btnA setTitle:@"Stop" forState:UIControlStateNormal];
    [btnA setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnA addTarget:self action:@selector(stopTimer) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnA];
}

- (void)stopTimer
{
    [_timer stop];
}

#pragma mark - 

- (void)addButton
{
    UIButton *btnA = [UIButton buttonWithType:UIButtonTypeCustom];
    btnA.frame = CGRectMake(80, 200, 80, 40);
    [btnA setTitle:@"Add" forState:UIControlStateNormal];
    [btnA setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnA addTarget:self action:@selector(addData:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnA];
    
    UIButton *btnQuery = [UIButton buttonWithType:UIButtonTypeCustom];
    btnQuery.frame = CGRectMake(160, 200, 80, 40);
    [btnQuery setTitle:@"Query" forState:UIControlStateNormal];
    [btnQuery setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnQuery addTarget:self action:@selector(queryData:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnQuery];
    
    UIButton *btnDelete = [UIButton buttonWithType:UIButtonTypeCustom];
    btnDelete.frame = CGRectMake(160, 240, 80, 40);
    [btnDelete setTitle:@"Delete" forState:UIControlStateNormal];
    [btnDelete setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btnDelete.titleLabel.textColor = [UIColor blackColor];
    [btnDelete addTarget:self action:@selector(deleteData:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnDelete];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NSOperation+block
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

#pragma mark - Core Data
- (void)addData:(id)sender
{
    STNMsgEntity *msg = (STNMsgEntity *)[NSEntityDescription insertNewObjectForEntityForName:@"STNMsgEntity" inManagedObjectContext:self.myAppDelegate.managedObjectContext];
    [msg setTitle:@"titleB"];
    [msg setValue:@"contextB" forKey:@"context"];
    [msg setDate:[NSDate date]];
    [msg setType:[NSNumber numberWithInteger:4]];
    NSError *error = nil;
    BOOL isSaveSuccess = [_myAppDelegate.managedObjectContext save:&error];
    if (!isSaveSuccess) {
        NSLog(@"error:%@", error);
    }else {
        NSLog(@"Save Success!");
    }
}

- (void)queryData:(id)sender
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *msg = [NSEntityDescription entityForName:@"STNMsgEntity" inManagedObjectContext:_myAppDelegate.managedObjectContext];
    [request setEntity:msg];
    
    NSError *error = nil;
    NSMutableArray *mutableFetchResult = [[_myAppDelegate.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResult == nil) {
        NSLog(@"Error:%@", error);
    }else {
        NSLog(@"mutableFetchResult:\n%lu", (unsigned long)mutableFetchResult.count);
    }
    
    for (STNMsgEntity *msg in mutableFetchResult) {
        NSLog(@"date:%@---TYPE:%@", msg.date, msg.type);
    }
    
}

- (void)deleteData:(id)sender
{
    NSLog(@"---DELETE ALL---");
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *msg = [NSEntityDescription entityForName:@"STNMsgEntity" inManagedObjectContext:_myAppDelegate.managedObjectContext];
    [request setEntity:msg];
    
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"type==%@", [NSNumber numberWithInteger:2]];
//    [request setPredicate:predicate];
    
    NSError *error = nil;
    NSMutableArray *mutableFetchResult = [[_myAppDelegate.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResult == nil) {
        NSLog(@"Error:%@", error);
    }else {
        for (STNMsgEntity *msg in mutableFetchResult) {
            [_myAppDelegate.managedObjectContext deleteObject:msg];
        }
    }
    
}

- (void)updateData:(id)sender
{
    
}
































@end
