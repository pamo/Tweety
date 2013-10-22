//
//  TweetViewController.m
//  twitter
//
//  Created by Pamela Ocampo on 10/19/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "TweetViewController.h"
#import "Tweet.h"
@implementation TweetViewController

- (id)initWithTweet:(Tweet *)tweet {
    self = [super initWithNibName:@"TweetViewController" bundle:nil];
    if (self) {
        self.tweet = tweet;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.userName.text = self.tweet.username;
    self.timestamp.text = self.tweet.timestamp;
    //        self.profilePic = tweet.profilePic;
    self.tweetText.text = self.tweet.text;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
