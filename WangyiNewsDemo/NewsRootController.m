//
//  NewsRootController.m
//  WangyiNewsDemo
//
//  Created by 俞 億 on 12-4-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NewsRootController.h"
#import "NewsSliderCell.h"
#import "NewsListCell.h"
#import "FullImageController.h"

@interface NewsRootController ()

@end

@implementation NewsRootController

- (void)dealloc
{
    [DataTable release];
    [contentDic release];
    [super dealloc];
}

-(void)loadView{
    
    UIView *container = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 367)];
    self.view = container;
    [container release];
    
    DataTable = [[UITableView alloc]initWithFrame:self.view.bounds];
    DataTable.delegate = self;
    DataTable.dataSource = self;
    [self.view addSubview:DataTable];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSString *contentPath = [[NSBundle mainBundle]pathForResource:@"NewsRoot" ofType:@"plist"];
    contentDic = [[NSDictionary alloc]initWithContentsOfFile:contentPath];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return contentDic.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger numberOfRows;
    if (section==0) {
        numberOfRows = 1;
    }else if (section==1) {
        NSArray *newsList = [contentDic objectForKey:@"NewsList"];
        numberOfRows = newsList.count;
    }
    return numberOfRows;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat rowHeight;
    if (indexPath.section==0) {
        rowHeight = 150;
    }else if (indexPath.section==1) {
        rowHeight = 70;
    }
    return rowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    if (indexPath.section==0) {
        NewsSliderCell *sliderCell = [DataTable dequeueReusableCellWithIdentifier:@"sliderCell"];
        if (sliderCell==nil) {
            sliderCell = [[[NewsSliderCell alloc]initWithStyle:UITableViewCellStyleDefault
                                               reuseIdentifier:@"sliderCell"]autorelease];
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]
                                                  initWithTarget:self
                                                  action:@selector(scrollViewTap:)];
            [sliderCell.newsSliderScroll addGestureRecognizer:tapGesture];
            [tapGesture release];
        }
        sliderCell.sliderArray = [contentDic objectForKey:@"Slider"];
        cell = sliderCell;
    }else if (indexPath.section==1) {
        NewsListCell *newsCell = [DataTable dequeueReusableCellWithIdentifier:@"newsCell"];
        if (newsCell==nil) {
            newsCell = [[[NewsListCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                              reuseIdentifier:@"newsCell"]autorelease];

            
        }
        NSArray *newsList = [contentDic objectForKey:@"NewsList"];
        NSDictionary *newsDic = [newsList objectAtIndex:indexPath.row];
        newsCell.newsDic = newsDic;
        cell = newsCell;
    }
    return cell;
}
 
-(void)scrollViewTap:(UITapGestureRecognizer*)theTap{
    CGPoint touchPoint = [theTap locationInView:theTap.view];
    NSInteger index = floor(touchPoint.x/320);
    NSArray *sliderArray = [contentDic objectForKey:@"Slider"];
    NSDictionary *sliderDic = [sliderArray objectAtIndex:index];
    UIImage *image = [UIImage imageNamed:[sliderDic objectForKey:@"image"]];
    NSLog(@"image:%@",[sliderDic objectForKey:@"image"]);
    FullImageController *fullController = [[FullImageController alloc]init];
    fullController.image = image;
    fullController.hidesBottomBarWhenPushed = YES;
    fullController.navigationItem.title = [sliderDic objectForKey:@"title"];
    [self.navigationController pushViewController:fullController animated:YES];
    [fullController release];
}
@end
