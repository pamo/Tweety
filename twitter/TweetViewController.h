//
//  TweetViewController.h
//  twitter
//
//  Created by Pamela Ocampo on 10/19/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetViewController : UIViewController
- (id)initWithTweet:(Tweet *)tweet;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tweetControls;
@property (weak, nonatomic) IBOutlet UILabel *tweetText;
@property (weak, nonatomic) IBOutlet UILabel *timestamp;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UIImageView *profilePic;
@property (weak, nonatomic) Tweet *tweet;
@end
