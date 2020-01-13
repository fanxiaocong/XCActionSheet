//
//  ViewController.m
//  XCActionSheetExample
//
//  Created by 樊小聪 on 2017/3/13.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "ViewController.h"

#import "XCActionSheet.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - 🎬 👀 Action Method 👀

/**
 *  点击 默认样式 按钮的回调
 */
- (IBAction)didClickDefaultStyleButtonAction:(id)sender
{
    [XCActionSheet showActionSheetWithTitle:@"默认样式" contentTitles:@[@"AAAAA", @"BBBBB", @"CCCCC", @"DDDDD", @"EEEEE", @"FFFFF", @"GGGGG", @"HHHHH", @"IIIII", @"JJJJJ", @"KKKKK", @"LLLLLL", @"MMMMM", @"NNNNN", @"OOOOO", @"PPPPP", @"QQQQQ", @"RRRRR", @"SSSSS", @"TTTTT"] configure:NULL selectedIndex:2 didClickHandle:^(NSInteger index, NSString *title) {
        NSLog(@"点击的第%zi个按钮 ----- 标题： %@", index, title);
    } dismissHandle:nil];
}

/**
 *  点击 自定义样式 按钮的回调
 */
- (IBAction)didClickCustomStyleButtonAction:(id)sender
{
    [XCActionSheet showActionSheetWithTitle:@"自定义样式" cellCount:12 cellConfigure:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        static NSString *cellID = @"cellID";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = [NSString stringWithFormat:@"-----%zi-----", indexPath.row];
        cell.detailTextLabel.text = @"子标题";
        return cell;
    } configure:NULL didSelectRowHandle:^(NSInteger index) {
        NSLog(@"点击的第%zi个按钮", index);
    } dismissHandle:^{
        NSLog(@"消失后的回调");
    }];
}

@end

