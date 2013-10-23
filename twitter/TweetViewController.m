//
//  TweetViewController.m
//  twitter
//
//  Created by Pamela Ocampo on 10/19/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "TweetViewController.h"
#import "Tweet.h"
#import "TweetCell.h"
@implementation TweetViewController

- (id)initWithTweet:(TweetCell *)tweetCell {
    self = [super initWithNibName:@"TweetViewController" bundle:nil];
    if (self) {
        self.tweetCell = tweetCell;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.name.text = self.tweetCell.nameLabel.text;
    self.timestamp.text = self.tweetCell.timestampLabel.text;
    self.tweetText.text = self.tweetCell.tweetTextLabel.text;
    self.profileImage = self.tweetCell.profileImageView;
    NSLog(@"%@", self.name);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
