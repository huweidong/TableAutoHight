//
//  MainCell.m
//  TableAutoHight
//
//  Created by echo on 16/9/3.
//  Copyright © 2016年 echo. All rights reserved.
//

#import "MainCell.h"

@interface MainCell()

@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbContent;


@end

@implementation MainCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)loadData{
    self.lbTitle.text=self.titleStr;
    self.lbContent.text=self.contentStr;
}

@end
