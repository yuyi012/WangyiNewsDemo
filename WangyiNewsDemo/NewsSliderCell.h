//
//  NewsSliderCell.h
//  WangyiNewsDemo
//
//  Created by 俞 億 on 12-4-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsSliderCell : UITableViewCell<UIScrollViewDelegate>{
    UIScrollView *newsSliderScroll;
    UILabel *titleLabel;
    UIPageControl *pageControl;
}
@property(nonatomic,retain) NSArray *sliderArray;
@property(nonatomic,readonly) UIScrollView *newsSliderScroll;
@end
