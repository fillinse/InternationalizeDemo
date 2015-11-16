//
//  ViewController.m
//  InternationalizeDemo
//
//  Created by Fillinse on 15/11/13.
//  Copyright © 2015年 app. All rights reserved.
//
#define KEYOFSTRING(someKey) [NSString useStringKey:someKey]

#import "ViewController.h"
#import "DemoOneViewController.h"
@interface ViewController ()
{
    UIButton *btn;
    UIButton *button;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = KEYOFSTRING(@"first");
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 300, 300, 20);
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitle:KEYOFSTRING(@"rx") forState:UIControlStateNormal];
    [button addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 400, 300, 20);
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitle:KEYOFSTRING(@"push") forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnchange) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(languageChange) name:@"changeLanguage" object:nil];

}

- (void)change
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
    
    [button setTitle:KEYOFSTRING(@"rx") forState:UIControlStateNormal];
    [btn setTitle:KEYOFSTRING(@"push") forState:UIControlStateNormal];

    self.navigationItem.title = KEYOFSTRING(@"first");
}
- (void)btnchange
{
    DemoOneViewController *demo = [[DemoOneViewController alloc] init];
    [self.navigationController pushViewController:demo animated:YES];
}

- (void)languageChange
{
    [button setTitle:KEYOFSTRING(@"rx") forState:UIControlStateNormal];
    [btn setTitle:KEYOFSTRING(@"push") forState:UIControlStateNormal];
    
    self.navigationItem.title = KEYOFSTRING(@"first");

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
