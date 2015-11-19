//
//  LCModelCreater.m
//
//  Created by feibo.cn on 15/10/12.
//  Copyright © 2014年 feibo.cn All rights reserved.
//

#import "LCModelCreater.h"

@implementation LCModelCreater


+ (void)createModelWithDictionary:(NSDictionary *)dict withModelName:(NSString *)name
{
    printf("\n@interface %s :NSObject\n\n",name.UTF8String);
    for (NSString *key in dict) {
        
        
        NSString *type = nil;
        if ([dict[key] isKindOfClass:[NSNumber class]]) {
            type = @"NSNumber";
        }else if([dict[key] isKindOfClass:[NSArray class]]){
            type = @"NSArray";
        }else{
            type = @"NSString";
            printf("@property (nonatomic,copy) %s *%s;\n\n",type.UTF8String,key.UTF8String);
            continue;
        }
        
        printf("@property (nonatomic,strong) %s *%s;\n\n",type.UTF8String,key.UTF8String);
    }
    printf("@end\n\n");

}

@end
