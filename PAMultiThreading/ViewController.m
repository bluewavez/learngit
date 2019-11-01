//
//  ViewController.m
//  PAMultiThreading
//
//  Created by 朱永杰 on 2018/11/14.
//  Copyright © 2018年 individual. All rights reserved.
//
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#import "ViewController.h"
#import "MultiThreadingViewModel.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
/**
 *修改文件
 */

/**
*第二次修改文件
*/
@property(nonatomic, strong)UITableView *MainTable;
@end

@implementation ViewController

-(void)loadView{
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    {
        NSLog(@"{}的作用");
    }
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    NSLog(@"viewWillLayoutSubviews");
    [self.view addSubview:self.MainTable];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    NSLog(@"viewDidAppear");
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    NSLog(@"viewWillAppear");
}

-(NSArray *)typeList{
    NSArray *typeArr;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"type" ofType:@"plist"];
    typeArr = [NSArray arrayWithContentsOfFile:path];
    return typeArr;
}

-(UITableView *)MainTable{
    if (!_MainTable) {
        _MainTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT) style:UITableViewStylePlain];
        _MainTable.dataSource = self;
        _MainTable.delegate = self;
    }
    return _MainTable;
}

#pragma mark tableViewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *identyfier = @"threadingCell";
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:identyfier];
    if (!tableViewCell) {
        tableViewCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identyfier];
        tableViewCell.textLabel.text = [self typeList][indexPath.row];
    }
    return tableViewCell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self typeList].count;
}

#pragma mark tableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [MultiThreadingViewModel testThreadByType:indexPath.row];
}

@end
