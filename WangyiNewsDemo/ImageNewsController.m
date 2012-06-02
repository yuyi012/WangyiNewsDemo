//
//  ImageNewsController.m
//  WangyiNewsDemo
//
//  Created by 俞 億 on 12-4-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ImageNewsController.h"

#define kImageNewsButtonTag 100

@interface ImageNewsController ()

@end

@implementation ImageNewsController
- (void)dealloc
{
    [DataTable release];
    [contentArray release];
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
    NSString *contentPath = [[NSBundle mainBundle]pathForResource:@"ImageNews" ofType:@"plist"];
    contentArray = [[NSArray alloc]initWithContentsOfFile:contentPath];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger rowCount = contentArray.count/2;
    if (contentArray.count%2!=0) {
        rowCount++;
    }
    return rowCount;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat rowHeight = 80;
    return rowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [DataTable dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"cell"]autorelease];
        UIButton *imageButton1 = [[UIButton alloc]initWithFrame:CGRectMake(50, 5, 85, 70)];
        [imageButton1 setBackgroundImage:[UIImage imageNamed:@"kuang.png"] forState:UIControlStateNormal];
        imageButton1.tag = kImageNewsButtonTag;
        [imageButton1 setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 15, 0)];
        [imageButton1 setTitleEdgeInsets:UIEdgeInsetsMake(50, -85, 0, 0)];
        [imageButton1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        imageButton1.titleLabel.font = [UIFont systemFontOfSize:14];
        imageButton1.titleLabel.adjustsFontSizeToFitWidth = YES;
        [cell.contentView addSubview:imageButton1];
        [imageButton1 release];
        
        UIButton *imageButton2 = [[UIButton alloc]initWithFrame:CGRectMake(185, 5, 85, 70)];
        [imageButton2 setBackgroundImage:[UIImage imageNamed:@"kuang.png"] forState:UIControlStateNormal];
        imageButton2.tag = kImageNewsButtonTag+1;
        [imageButton2 setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 15, 0)];
        [imageButton2 setTitleEdgeInsets:UIEdgeInsetsMake(50, -85, 0, 0)];
        [imageButton2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        imageButton2.titleLabel.font = [UIFont systemFontOfSize:14];
        imageButton2.titleLabel.adjustsFontSizeToFitWidth = YES;
        [cell.contentView addSubview:imageButton2];
        [imageButton2 release];
    }
    //0 1
    //2 3
    NSDictionary *imageDic = [contentArray objectAtIndex:indexPath.row*2];
    UIButton *imageButton1 = (UIButton*)[cell.contentView viewWithTag:kImageNewsButtonTag];
    [imageButton1 setImage:[UIImage imageNamed:[imageDic objectForKey:@"image"]] forState:UIControlStateNormal];
    [imageButton1 setTitle:[imageDic objectForKey:@"title"] forState:UIControlStateNormal];
    NSInteger index2 = indexPath.row*2+1;
    UIButton *imageButton2 = (UIButton*)[cell.contentView viewWithTag:kImageNewsButtonTag+1];
    if (index2<contentArray.count-1) {
        imageButton2.hidden = NO;
        NSDictionary *imageDic2 = [contentArray objectAtIndex:index2];
        [imageButton2 setImage:[UIImage imageNamed:[imageDic2 objectForKey:@"image"]] forState:UIControlStateNormal];
        [imageButton2 setTitle:[imageDic2 objectForKey:@"title"] forState:UIControlStateNormal];
    }else {
        imageButton2.hidden = YES;
    }
    return cell;
}
@end
