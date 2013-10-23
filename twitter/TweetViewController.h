//
//  TweetViewController.h
//  twitter
//
//  Created by Pamela Ocampo on 10/19/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TweetCell.h"

@interface TweetViewController : UIViewController
- (id)initWithTweet:(TweetCell *)tweetCell;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tweetControls;
@property (weak, nonatomic) IBOutlet UILabel *tweetText;
@property (weak, nonatomic) IBOutlet UILabel *timestamp;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
//@property (weak, nonatomic) Tweet *tweet;
@property (weak, nonatomic) TweetCell *tweetCell;
@end
