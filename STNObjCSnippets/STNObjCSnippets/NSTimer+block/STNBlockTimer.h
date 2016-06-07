//
//  STNBlockTimer.h
//  STNObjCSnippets
//
//  Created by stone on 16/6/3.
//  Copyright © 2016年 Stone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STNBlockTimer : NSTimer

+ (NSTimer *)scheduledTimerWithInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats usingBlock:(void (^)())fireBlock;

//+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL *)repeats usingBlock:(void (^)(NSTimer *timer))fireBlock;

@end
