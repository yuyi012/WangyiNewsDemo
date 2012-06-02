//
//  NewsSliderCell.m
//  WangyiNewsDemo
//
//  Created by 俞 億 on 12-4-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NewsSliderCell.h"

#define kSliderImageTag 100
#define kSliderLabelTag 101

@implementation NewsSliderCell
@synthesize sliderArray = _sliderArray;
@synthesize newsSliderScroll;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        // Initialization code
        newsSliderScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 150)];
        newsSliderScroll.pagingEnabled = YES;
        newsSliderScroll.bounces = NO;
        newsSliderScroll.delegate = self;
        newsSliderScroll.showsHorizontalScrollIndicator = NO;
        [self.contentView addSubview:newsSliderScroll];
        
        titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 130, 320, 20)];
        titleLabel.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.6];
        titleLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:titleLabel];
        
        pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(240, 130, 80, 20)];
        [self.contentView addSubview:pageControl];
    }
    return self;
}

- (void)dealloc
{
    [newsSliderScroll release];
    [_sliderArray release];
    [titleLabel release];
    [pageControl release];
    [super dealloc];
}

-(void)setSliderArray:(NSArray *)theArray{
    [_sliderArray release];
    _sliderArray = [theArray retain];
    CGFloat xOffset = 0;
    for (NSInteger i=0; i<_sliderArray.count; i++) {
        NSDictionary *sliderDic = [_sliderArray objectAtIndex:i];
        UIImageView *sliderImageView = (UIImageView*)[self.contentView viewWithTag:kSliderImageTag+i];
        if (sliderImageView==nil) {
            sliderImageView = [[UIImageView alloc]initWithFrame:CGRectMake(xOffset, 0, 320, 150)];
            sliderImageView.tag = kSliderImageTag+i;
            [newsSliderScroll addSubview:sliderImageView];
            [sliderImageView release];
        }
        sliderImageView.image = [UIImage imageNamed:[sliderDic objectForKey:@"image"]];
        if (i==0) {
            titleLabel.text = [sliderDic objectForKey:@"title"];
        }
        xOffset += 320;
    }
    newsSliderScroll.contentSize = CGSizeMake(320*_sliderArray.count, 150);
    [pageControl setNumberOfPages:_sliderArray.count];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger pageIndex = floor(scrollView.contentOffset.x/320);
    NSDictionary *sliderDic = [_sliderArray objectAtIndex:pageIndex];
    titleLabel.text = [sliderDic objectForKey:@"title"];
    [pageControl setCurrentPage:pageIndex];
}
@end
