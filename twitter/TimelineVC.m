//
//  TimelineVC.m
//  twitter
//
//  Created by Timothy Lee on 8/4/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "TimelineVC.h"
#import "TweetCell.h"
#import "ComposeViewController.h"
#import "TweetViewController.h"
#import <UIImageView+AFNetworking.h>

@interface TimelineVC ()

@property (nonatomic, strong) NSMutableArray *tweets;

- (void)onSignOutButton;
- (void)reload;

@end

@implementation TimelineVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"Twitter";
        
        [self reload];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Sign Out" style:UIBarButtonItemStylePlain target:self action:@selector(onSignOutButton)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Compose" style:UIBarButtonItemStylePlain target:self action:@selector(onComposeButton)];
    
    UINib *customNib = [UINib nibWithNibName:@"TweetCell" bundle:nil];
    [self.tableView registerNib: customNib forCellReuseIdentifier:@"TweetCell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.tweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TweetCell";
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    Tweet *tweet = self.tweets[indexPath.row];

    cell.usernameLabel.text = tweet.username;
    cell.tweetContent.text = tweet.text;
    cell.tweetTimeStamp.text = tweet.timestamp;
    [cell.profilePic setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:tweet.profilePic]] placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        cell.profilePic.image = image;
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        NSLog(@"%@", error);
    }];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0f;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Tweet *tweet = self.tweets[indexPath.row];
    TweetViewController *vc = [[TweetViewController alloc] initWithTweet:tweet];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - Private methods

- (void)onSignOutButton {
    [User setCurrentUser:nil];
}

- (void)onComposeButton {
        ComposeViewController *composeViewController = [[ComposeViewController alloc] init];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:composeViewController];
        [self presentViewController:navigationController animated:YES completion:nil];
}

- (void)reload {
    [[TwitterClient instance] homeTimelineWithCount:20 sinceId:0 maxId:0 success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"%@", response);
        self.tweets = [Tweet tweetsWithArray:response];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // Do nothing
    }];
}

@end
