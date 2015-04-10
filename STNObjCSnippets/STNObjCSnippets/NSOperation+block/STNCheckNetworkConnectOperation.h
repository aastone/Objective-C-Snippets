//
//  STNCheckNetworkConnectOperation.h
//  STNObjCSnippets
//
//  Created by Stone on 4/10/15.
//  Copyright (c) 2015 Stone. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSInteger {
    STNCheckNetworkConnectValueWifi,
    STNCheckNetworkConnectValueCellular,
    STNCheckNetworkConnectValueNone,
} STNCheckNetworkConnectValue;

typedef void(^STNCheckNetworkConnectedCompletionBlock) (NSString *param);

@interface STNCheckNetworkConnectOperation : NSOperation

@property (nonatomic, assign) NSInteger networkType;

- (void)finishNetworkCheckHandler:(STNCheckNetworkConnectedCompletionBlock)completion;

@end
