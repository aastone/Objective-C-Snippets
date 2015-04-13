//
//  STNMsgEntity.h
//  STNObjCSnippets
//
//  Created by Stone on 4/13/15.
//  Copyright (c) 2015 Stone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface STNMsgEntity : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * context;
@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * param;

@end
