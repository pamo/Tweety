//
//  Tweet.m
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "Tweet.h"
#import <NSDate+TimeAgo.h>

@implementation Tweet


- (NSString *)tweetID {
    return [self.data valueOrNilForKeyPath:@"id"];
}
- (NSString *)text {
    return [self.data valueOrNilForKeyPath:@"text"];
}
- (NSString *)name {
    return [self.data valueOrNilForKeyPath:@"user.name"];
}
- (NSString *)username {
    return [NSString stringWithFormat:@"@%@", [self.data valueOrNilForKeyPath:@"user.screen_name"]];
}
- (NSString *)profileImage {
    return [self.data valueOrNilForKeyPath:@"user.profile_image_url"];
}
- (NSString *)timestamp {
   return [self.data valueOrNilForKeyPath:@"created_at"];
}

- (NSString *)timeAgo{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE MMM dd HH:mm:ss Z yyyy"];
    NSDate *date = [dateFormatter dateFromString:self.timestamp];
    return [date timeAgo];
}


+ (NSMutableArray *)tweetsWithArray:(NSArray *)array {
    NSMutableArray *tweets = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:params]];
    }
    return tweets;
}

@end
