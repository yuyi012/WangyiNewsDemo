//
//  AppDelegate.m
//  WangyiNewsDemo
//
//  Created by 俞 億 on 12-4-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "NewsRootController.h"
#import "ImageNewsController.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    NewsRootController *newsRootController =[[NewsRootController alloc]init];
    UINavigationController *newsRootNav = [[UINavigationController alloc]initWithRootViewController:newsRootController];
    
    ImageNewsController *imageNewsController = [[ImageNewsController alloc]init];
    UINavigationController *imageNewsNav = [[UINavigationController alloc]initWithRootViewController:imageNewsController];
    
    UITabBarController *tabController = [[UITabBarController alloc]init];
    [tabController setViewControllers:[NSArray arrayWithObjects:newsRootNav,imageNewsNav, nil]];
    
    self.window.rootViewController = tabController;
    [tabController release];
    [imageNewsNav release];
    [imageNewsController release];
    [newsRootNav release];
    [newsRootController release];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
@end
