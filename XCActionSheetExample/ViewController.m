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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [XCActionSheet showActionSheetWithTitle:@"AAAAAAAAAAAAAAAAABABABABBABABABABABABABABABABBABABABABABABABABABABABBABABABABABABABABABABABABABABAB" contentTitles:@[@"AAAAA", @"BBBBB", @"CCCCC", @"DDDDD", @"EEEEE", @"FFFFF", @"GGGGG", @"HHHHH", @"IIIII", @"JJJJJ", @"KKKKK", @"LLLLLL", @"MMMMM", @"NNNNN", @"OOOOO", @"PPPPP", @"QQQQQ", @"RRRRR", @"SSSSS", @"TTTTT"] didClickHandle:^(NSInteger index, NSString *title) {
//        
//        NSLog(@"点击的第%zi个按钮 ----- 标题： %@", index, title);
//    }];

    
    [XCActionSheet showActionSheetWithTitle:@"AAAAA" cellCount:12 cellConfigure:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        
        static NSString *cellID = @"cellID";

        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = [NSString stringWithFormat:@"-----%zi-----", indexPath.row];
        cell.detailTextLabel.text = @"子标题";
        
        return cell;
        
    } configure:NULL selectedIndex:1 didSelectRowHandle:^(NSInteger index) {
        
         NSLog(@"点击的第%zi个按钮", index);
    } dismissHandle:^{
        
        NSLog(@"消失后的回调");
    }];
}


@end

