//
//  ALAData.m
//  AudioList
//
//  Created by Jonathan Fox on 5/8/14.
//  Copyright (c) 2014 Jon Fox. All rights reserved.
//

#import "ALAData.h"

@implementation ALAData

+(ALAData *)MainData
{
    static dispatch_once_t create;
    static ALAData * singleton = nil;
    
    dispatch_once(&create, ^{
        singleton = [[ALAData alloc]init];
    });
    return singleton;
}


- (NSMutableArray *)listItems
{
    if(_listItems == nil)
    {
        _listItems = [@[
                        @{
                            @"Album Name" : @"Def Leopard",
                            @"image" :@"image",
                            @"audio file" : @"audio file",
                            @"Times played" :@"6",
                            @"Like" : @"Dislike" },
                        @{
                            @"Album Name" : @"REO Speedwagon",
                            @"image" :@"image",
                            @"audio file" : @"audio file",
                            @"Times played" :@"9",
                            @"Like" : @"Like"}
                    ]mutableCopy];
    }
    return _listItems;
}

- (NSArray *)allListItems
{
    return [self.listItems copy];
}

@end
