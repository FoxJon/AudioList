//
//  ALASoundCloudRequest.m
//  AudioList
//
//  Created by Jonathan Fox on 5/12/14.
//  Copyright (c) 2014 Jon Fox. All rights reserved.
//

#define CLIENT_ID @"client_id=92045db05e684d6d852b5ee513769971"
#define USER_NAME @"jonfox-1"
#define SC_API @"https://api.soundcloud.com"
//@"https://api.soundcloud.com/users/jonfox-1/playlists.json?client_id=92045db05e684d6d852b5ee513769971"

#import "ALASoundCloudRequest.h"

#import "ALAData.h"


@implementation ALASoundCloudRequest

+ (void)updateData
{
    NSURL * requestURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/users/%@/playlists.json?%@", SC_API, USER_NAME, CLIENT_ID]];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:requestURL];
    
    NSOperationQueue * queue = [[NSOperationQueue alloc]init];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
    
        NSArray * scInfo = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        for (NSDictionary * playlistInfo in scInfo)
        {
            ALAPlaylist * playlist = [ALAPlaylist newPlaylist];
            
            playlist[@"playlist"] = playlistInfo [@"title"];
            
            [[ALAData mainData] addNewPlaylist:playlist];

            for (NSDictionary * trackInfo in playlistInfo[@"tracks"])
            {
                if(!trackInfo[@"streamable"])continue;
                
                ALATrack * track = [ALATrack newTrack];
                
                track.playlist = playlist;
                
                track[@"title"] = trackInfo[@"title"];
                track[@"url"] = trackInfo[@"stream_url"];
                
                [playlist.tracks addObject:track];
                
                [[ALAData mainData] addNewTrack:track];

                ALAUser * user = [ALAUser newUser];
                
                user[@"name"] = trackInfo [@"user"][@"username"];

                track.user = user;
                
                [[ALAData mainData] addNewUser:user];
            }
        }
        NSLog(@"%@",[[ALAData mainData] allTracks]);
        NSLog(@"%@",[[ALAData mainData] allUsers]);
        NSLog(@"%@",[[ALAData mainData] allPlaylists]);
        
        NSNotificationCenter * nCenter = [NSNotificationCenter defaultCenter];
        [nCenter postNotificationName:@"dataUpdated" object:nil];
        
    }];
}
    
    
//    //Find Artist
//    for (NSDictionary * playList in soundCloudProfile) {
//        NSLog(@"%@", playList[@"title"]);
//        NSArray * tracks = playList[@"tracks"];
//        
//        for (NSDictionary * key in tracks) {
//            NSDictionary * user = key[@"user"];
//            NSLog(@"Artist: %@", user[@"username"]);
//        }
//    }
//    
//    //Find Song Name
//    for (NSDictionary * playList in soundCloudProfile) {
//        NSArray * tracks = playList[@"tracks"];
//        
//        for (NSDictionary * key in tracks) {
//            NSDictionary * title = key[@"title"];
//            NSLog(@"Title: %@", title);
//        }
//    }
//    
//    //Find Album Artwork
//    for (NSDictionary * playList in soundCloudProfile) {
//        NSArray * tracks = playList[@"tracks"];
//        
//        for (NSDictionary * item in tracks) {
//            NSDictionary * artwork = item[@"artwork_url"];
//            NSLog(@"%@", artwork);
//            if (artwork == nil) {
//                NSLog(@"HELLO");
//                for (NSDictionary * x in tracks)
//                {
//                    NSDictionary * art = x[@"user"];
//                    NSLog(@"Artwork %@", art[@"avatar_url"]);
//                }
//            }
//        }
//    }
//}





@end
