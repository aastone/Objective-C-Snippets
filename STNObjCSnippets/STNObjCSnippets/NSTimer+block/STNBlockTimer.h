//
//  STNBlockTimer.h
//  STNObjCSnippets
//
//  Created by stone on 16/6/3.
//  Copyright © 2016年 Stone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STNBlockTimer : NSObject

+ (NSTimer *)scheduledTimerWithInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats usingBlock:(void (^)())fireBlock;

- (void)start;

- (void)stop;

@end
