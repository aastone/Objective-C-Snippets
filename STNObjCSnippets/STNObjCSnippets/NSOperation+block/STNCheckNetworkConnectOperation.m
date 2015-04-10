//
//  STNCheckNetworkConnectOperation.m
//  STNObjCSnippets
//
//  Created by Stone on 4/10/15.
//  Copyright (c) 2015 Stone. All rights reserved.
//

#import "STNCheckNetworkConnectOperation.h"

@interface STNCheckNetworkConnectOperation()

@property (nonatomic, strong) STNCheckNetworkConnectedCompletionBlock completionHandler;

@end

@implementation STNCheckNetworkConnectOperation

- (void)main
{
    if (self.isCancelled) {
        return;
    }
    // do some time-consuming opertions
    NSString *result = nil;
    if (_networkType == STNCheckNetworkConnectValueWifi) {
        result = @"via wifi functions you want to execute";
    }else if (_networkType == STNCheckNetworkConnectValueCellular) {
        result = @"via cellular functions you want to execute";
    }else {
        result = @"via none functions you want to execute";
    }
    // after executing time-consuming operations
    // check whether this operation is cancelled
    if (self.isCancelled) {
        return;
    }

    if (_completionHandler) {
        
        _completionHandler(result); // using block to pass return results or params
        
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            _completionHandler(result);
//        });
    }
    
    // once the completion handler has been run, it no longer needs to hold onto the block.
    self.completionHandler = nil;
}

- (void)finishNetworkCheckHandler:(STNCheckNetworkConnectedCompletionBlock)completion
{
    self.completionHandler = completion;
}

@end
