//
//  FullImageController.m
//  WangyiNewsDemo
//
//  Created by 俞 億 on 12-4-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FullImageController.h"

@interface FullImageController ()

@end

@implementation FullImageController
@synthesize image = _image;
- (void)dealloc
{
    [scrollView release];
    [imageView release];
    [_image release];
    [super dealloc];
}

-(void)loadView{
    UIView *container = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 416)];
    self.view = container;
    [container release];
    
    scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.delegate = self;
    scrollView.maximumZoomScale = 1.5;
    [self.view addSubview:scrollView];
    scrollView.contentSize = self.view.bounds.size;
    
    imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [scrollView addSubview:imageView];
}

//-(void)setImage:(UIImage *)theImage{
//    [_image release];
//    _image = [theImage retain];
//}

-(void)viewDidLoad{
    [super viewDidLoad];
    imageView.image = _image;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return imageView;
}
@end
