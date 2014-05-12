//
//  ALAPlaylist.h
//  AudioList
//
//  Created by Jonathan Fox on 5/12/14.
//  Copyright (c) 2014 Jon Fox. All rights reserved.
//

#import "ALADictionary.h"

@interface ALAPlaylist : ALADictionary

+(id)newPlaylist;

@property (nonatomic) NSMutableArray * tracks;

@end
