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

- (NSString *)text {
    return [self.data valueOrNilForKeyPath:@"text"];
}
- (NSString *)username {
    return [self.data valueOrNilForKeyPath:@"user.name"];
}
- (NSString *)profilePic {
    return [self.data valueOrNilForKeyPath:@"user.profile_image_url"];
}
- (NSString *)timestamp {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE MMM dd HH:mm:ss Z yyyy"];
    NSString *rawTimestamp = [self.data valueOrNilForKeyPath:@"created_at"];
    
//    NSDate *date = [dateFormatter dateFromString:rawTimestamp];
    NSDate *date = [dateFormatter dateFromString:rawTimestamp];
    NSString *timeAgo = [date timeAgo];
    
//    NSString *formattedDate = [dateFormatter stringFromDate:date];
    return timeAgo;
}


+ (NSMutableArray *)tweetsWithArray:(NSArray *)array {
    NSMutableArray *tweets = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:params]];
    }
    return tweets;
}

@end
