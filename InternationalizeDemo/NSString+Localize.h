//
//  NSString+Localize.h
//  InternationalizeDemo
//
//  Created by Fillinse on 15/11/13.
//  Copyright © 2015年 app. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Localize)
+ (NSString *)useStringKey:(NSString *)stringKey;
+ (NSString *)currentLanguage;

@end
