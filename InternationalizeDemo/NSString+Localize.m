//
//  NSString+Localize.m
//  InternationalizeDemo
//
//  Created by Fillinse on 15/11/13.
//  Copyright © 2015年 app. All rights reserved.
//

#import "NSString+Localize.h"

@implementation NSString (Localize)

+ (NSString *)useStringKey:(NSString *)stringKey
{
    //en
    //zh-Hans
    
    //获取当前语言（从系统取）
    NSString *current = [[NSLocale preferredLanguages] objectAtIndex:0];
    //根据存在本地的标签判断当前语言，如果本地标签存在，将其赋值给当前语言
    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"lan"])
    {
        current = [[NSUserDefaults standardUserDefaults]objectForKey:@"lan"];
    }
    //找到语言包
    NSString *path = [[NSBundle mainBundle]pathForResource:current ofType:@"lproj"];
    
    NSBundle * languageBundle = [NSBundle bundleWithPath:path];
    
    
    //////强烈要求注意这个方法，我当初弄错了，多搞了几个小时！！！！最后一个参数的名称必须和.string文件一致
    //根据键找到对应的值
    NSString * s = [languageBundle localizedStringForKey:stringKey value:@"" table:@"localize"];
    
    return s;
}
//获取当前语言
+ (NSString *)currentLanguage
{
    NSString *current = [[NSLocale preferredLanguages] objectAtIndex:0];
    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"lan"]) {
        current = [[NSUserDefaults standardUserDefaults]objectForKey:@"lan"];
    }
    
    return current;
}

@end
