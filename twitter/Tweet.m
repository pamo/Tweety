//
//  Tweet.m
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

- (NSString *)text {
    return [self.data valueOrNilForKeyPath:@"text"];
}
- (NSString *)username {
    return [self.data valueOrNilForKeyPath:@"name"];
}
- (NSString *)profilePic {
    return [self.data valueOrNilForKeyPath:@"profile_image_url"];
}
- (NSString *)timestamp {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSDate *date = [dateFormatter dateFromString:[self.data valueOrNilForKeyPath:@"created_at"]];
    [dateFormatter setDateFormat:@"MM-dd-yy"];
    return [dateFormatter stringFromDate:date];
}


+ (NSMutableArray *)tweetsWithArray:(NSArray *)array {
    NSMutableArray *tweets = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:params]];
    }
    return tweets;
}

@end
