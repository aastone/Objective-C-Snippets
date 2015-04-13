//
//  ViewController.h
//  STNObjCSnippets
//
//  Created by Stone on 4/9/15.
//  Copyright (c) 2015 Stone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) AppDelegate *myAppDelegate;

//Core Data
- (void)addData:(id)sender;
- (void)queryData:(id)sender;
- (void)updateData:(id)sender;
- (void)deleteData:(id)sender;

@end

