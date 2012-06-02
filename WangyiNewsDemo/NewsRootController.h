//
//  NewsRootController.h
//  WangyiNewsDemo
//
//  Created by 俞 億 on 12-4-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsRootController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    UITableView *DataTable;
    NSDictionary *contentDic;
}
@end
