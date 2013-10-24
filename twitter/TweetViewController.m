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
#import "TwitterClient.h"
#import "ComposeViewController.h"

@implementation TweetViewController

- (id)initWithTweet:(TweetCell *)tweetCell {
    self = [super initWithNibName:@"TweetViewController" bundle:nil];
    if (self) {
        self.tweetCell = tweetCell;
        NSLog(@"init %@", self.usernameLabel.text);

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.name.text = self.tweetCell.nameLabel.text;
    self.usernameLabel.text = self.tweetCell.usernameLabel.text;
    self.timestamp.text = self.tweetCell.timestampLabel.text;
    self.tweetText.text = self.tweetCell.tweetTextLabel.text;
    self.profileImageView.image = self.tweetCell.profileImageView.image;
    NSLog(@"view load %@", self.usernameLabel.text);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onReply:(id)sender{

    NSLog(@"onReply: %@", self.usernameLabel.text);

    ComposeViewController *composeViewController = [[ComposeViewController alloc] initWithNibName:@"ComposeViewController"
 andTweet:self.usernameLabel.text inReplyToTweetId:self.tweetCell.tweetID bundle:nil];

    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:composeViewController];
    [self presentViewController:navigationController animated:YES completion:nil];
}
- (IBAction)onRetweet:(id)sender{
    [[TwitterClient instance] retweet:self.tweetCell.tweetID success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"Retweet Success!");
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
}
- (IBAction)onFavorite:(id)sender{
    [[TwitterClient instance] favorite:self.tweetCell.tweetID success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"Tweet %@ Favorited!", self.tweetCell.textLabel.text);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
}

@end
