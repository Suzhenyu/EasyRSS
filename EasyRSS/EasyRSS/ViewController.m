//
//  ViewController.m
//  EasyRSS
//
//  Created by Suzhenyu on 2019/1/30.
//  Copyright © 2019 Suzhenyu. All rights reserved.
//

#import "ViewController.h"
#import <MWFeedParser/MWFeedParser.h>

@interface ViewController ()<MWFeedParserDelegate>

@property (nonatomic, strong) MWFeedParser *feedParser;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"https://onevcat.com/feed.xml"];
    _feedParser = [[MWFeedParser alloc] initWithFeedURL:url];
    _feedParser.delegate = self;
    if (![_feedParser parse]) {
        NSLog(@"启动解析失败");
    };
}

#pragma mark- MWFeedParserDelegate
- (void)feedParserDidStart:(MWFeedParser *)parser {
    NSLog(@"开始解析");
}
- (void)feedParser:(MWFeedParser *)parser didParseFeedInfo:(MWFeedInfo *)info {
    NSLog(@"解析 FeedInfo 完毕，具体信息如下：%@", info);
}
- (void)feedParser:(MWFeedParser *)parser didParseFeedItem:(MWFeedItem *)item {
    NSLog(@"解析 FeedItem 完毕，具体信息如下：%@", item);
}
- (void)feedParserDidFinish:(MWFeedParser *)parser {
    NSLog(@"解析完毕");
}
- (void)feedParser:(MWFeedParser *)parser didFailWithError:(NSError *)error {
    NSLog(@"解析出错，Error：%@", error);
}


@end
