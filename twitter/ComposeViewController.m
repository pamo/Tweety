//
//  ComposeViewController.m
//  twitter
//
//  Created by Pamela Ocampo on 10/19/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "ComposeViewController.h"
#import "TwitterClient.h"

@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tweetTextField;
@property (weak, nonatomic) NSString *replyTweetID;
@property (weak, nonatomic) NSString *replyTweetUsername;
@property (weak, nonatomic) NSString *tweetText;
@end

@implementation ComposeViewController
- (id)initWithNibName:(NSString *)nibNameOrNil andTweet:(NSString *)tweetText inReplyToTweetId:(NSString *)tweetId bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Reply...";
        self.replyTweetID = tweetId;
        self.tweetText = tweetText;
        NSLog(@"%@ %@", tweetText, tweetId);
        
    }
    return self;
}
-(id)initWithNibName:(NSString *)nibNameOrNil andTweet:(NSString *)tweetText bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"New Tweet";
        self.tweetText = tweetText;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStylePlain target:self action:@selector(onCloseButton)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Tweet" style:UIBarButtonItemStylePlain target:self action:@selector(onTweetButton)];
    if (self.tweetText.length == 0) {
        self.tweetTextField.placeholder = @"New tweet...";
    }
    else {
        self.tweetTextField.text = self.tweetText;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)onCloseButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)onTweetButton {
    
    NSString *tweetText = self.tweetTextField.text;
    NSLog(@"%@", self.replyTweetID);
    NSLog(@"%@", self.replyTweetUsername);
    if (self.replyTweetID != nil) {
        tweetText = self.tweetTextField.text;
    }
    NSLog(@"%@", tweetText);
    
    [[TwitterClient instance] tweet:self.tweetTextField.text
     inReplyToTweetID:self.replyTweetID success:^(AFHTTPRequestOperation *operation, id response) {
         NSLog(@"Successful tweet!");
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"%@", error);
     }];
    [self dismissViewControllerAnimated:YES completion:nil];

}
@end
