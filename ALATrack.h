//
//  ALATrack.h
//  AudioList
//
//  Created by Jonathan Fox on 5/12/14.
//  Copyright (c) 2014 Jon Fox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALADictionary.h"

@class ALAUser;
@class ALAPlaylist;

@interface ALATrack : ALADictionary

+(id)newTrack;

@property (nonatomic) ALAUser * user;
@property (nonatomic) ALAPlaylist * playlist;

@end
