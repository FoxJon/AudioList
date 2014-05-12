//
//  ALAPlaylist.m
//  AudioList
//
//  Created by Jonathan Fox on 5/12/14.
//  Copyright (c) 2014 Jon Fox. All rights reserved.
//

#import "ALAPlaylist.h"

@implementation ALAPlaylist

+(id)newPlaylist;
{
    return [[ALAPlaylist alloc]init];
}

-(NSMutableArray *)tracks
{
    if(_tracks == nil) _tracks = [@[]mutableCopy];
    return _tracks;
}

@end
