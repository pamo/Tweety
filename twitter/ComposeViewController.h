//
//  ComposeViewController.h
//  twitter
//
//  Created by Pamela Ocampo on 10/19/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComposeViewController : UIViewController
- (id)initWithNibName:(NSString *)nibNameOrNil andTweet:(NSString *)tweetText inReplyToTweetId:(NSString *)tweetId bundle:(NSBundle *)nibBundleOrNil;
- (id)initWithNibName:(NSString *)nibNameOrNil andTweet:(NSString *)tweetText bundle:(NSBundle *)nibBundleOrNil;

@end
