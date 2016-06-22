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

@end

@implementation STNBlockTimer
{
    NSTimer *timer;
}

- (id)init
{
    return [super init];
}

- (void)start
{
    NSLog(@"start");
    __weak STNBlockTimer *weakSelf = self;
    
    timer = [STNBlockTimer scheduledTimerWithInterval:5 repeats:YES usingBlock:^{
        STNBlockTimer *strongSelf = weakSelf;
        [strongSelf doSomething];
    }];
}

- (void)stop
{
    NSLog(@"stop");
    [timer invalidate];
    timer = nil;
}

- (void)doSomething
{
    NSLog(@"doSomething");
}

+ (NSTimer *)scheduledTimerWithInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats usingBlock:(void (^)())fireBlock
{
    return [NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(xx_blockInvoke:) userInfo:[fireBlock copy] repeats:repeats];
}

+ (void)xx_blockInvoke:(NSTimer *)timer
{
    NSLog(@"xx_blockInvoke");
    void (^block)() = timer.userInfo;
    if (block) {
        block();
    }
}

@end
