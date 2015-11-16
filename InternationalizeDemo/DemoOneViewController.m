//
//  DemoOneViewController.m
//  InternationalizeDemo
//
//  Created by Fillinse on 15/11/13.
//  Copyright © 2015年 app. All rights reserved.
//
#define KEYOFSTRING(someKey) [NSString useStringKey:someKey]

#import "DemoOneViewController.h"

@interface DemoOneViewController ()

@end

@implementation DemoOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = KEYOFSTRING(@"second");
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 300, 300, 20);
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitle:KEYOFSTRING(@"hrx") forState:UIControlStateNormal];
    [button addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}
- (void)change:(UIButton *)button
{
    //中英切换 (是中文就切换成英文，反之亦然)
    NSString *lan = [[NSUserDefaults standardUserDefaults] objectForKey:@"lan"];
    if ([lan isEqualToString:@"en"])
    {
        [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:@"lan"];
        
    }
    else
    {
        [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:@"lan"];
        
    }
    [button setTitle:KEYOFSTRING(@"hrx") forState:UIControlStateNormal];
    
    self.navigationItem.title = KEYOFSTRING(@"first");
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeLanguage" object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
