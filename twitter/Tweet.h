//
//  Tweet.h
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tweet : RestObject
@property (nonatomic, strong) NSString *tweetID;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *profileImage;
@property (nonatomic, strong) NSString *timestamp;
@property (nonatomic, strong) NSString *timeAgo;
+ (NSMutableArray *)tweetsWithArray:(NSArray *)array;

@end
