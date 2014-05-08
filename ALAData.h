//
//  ALAData.h
//  AudioList
//
//  Created by Jonathan Fox on 5/8/14.
//  Copyright (c) 2014 Jon Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALAData : NSObject

+(ALAData *)MainData;

@property (nonatomic) NSMutableArray * listItems;

- (NSArray *)allListItems;

@end
