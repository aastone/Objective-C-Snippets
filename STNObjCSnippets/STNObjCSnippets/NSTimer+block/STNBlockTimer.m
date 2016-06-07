//
//  STNBlockTimer.m
//  STNObjCSnippets
//
//  Created by stone on 16/6/3.
//  Copyright © 2016年 Stone. All rights reserved.
//

#import "STNBlockTimer.h"

typedef void (^STNTimerBlock)(NSTimer *timer);

#define SELF_EXECUTING 1

@interface STNBlockTimer ()

- (void)start;

- (void)stop;

@end

@implementation STNBlockTimer
{
    NSTimer *timer;
}

- (void)start
{
//    timer = [NSTimer scheduledTimerWithTimeInterval:SELF_EXECUTING target:self selector:@selector(doSomething) userInfo:nil repeats:YES];
    
    __weak STNBlockTimer *weakSelf = self;
    
    timer = [STNBlockTimer scheduledTimerWithInterval:5 repeats:YES usingBlock:^{
        [weakSelf doSomething];
    }];
}

- (void)doSomething
{
    
}

+ (NSTimer *)scheduledTimerWithInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats usingBlock:(void (^)())fireBlock
{
    return [self scheduledTimerWithTimeInterval:seconds target:self selector:@selector(xx_blockInvoke:) userInfo:[fireBlock copy] repeats:repeats];
}

+ (void)xx_blockInvoke:(NSTimer *)timer
{
    void (^block)() = timer.userInfo;
    if (block) {
        block();
    }
}

@end
