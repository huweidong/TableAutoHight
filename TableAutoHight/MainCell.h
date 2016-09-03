//
//  MainCell.h
//  TableAutoHight
//
//  Created by echo on 16/9/3.
//  Copyright © 2016年 echo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainCell : UITableViewCell

@property (copy, nonatomic) NSString *titleStr;
@property (copy, nonatomic) NSString *contentStr;

-(void)loadData;

@end
