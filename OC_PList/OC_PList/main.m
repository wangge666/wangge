//
//  main.m
//  OC_PList
//
//  Created by qianfeng on 15/6/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
//plist文件
//plist文件的根节点只能为数组(NSArray)或者字典(NSDictionary)
//存储的对象:NSArray,NSDictionary,NSDate,NSData,Boolean,NSNumber,NSString
int main(int argc, const char * argv[]) {
    @autoreleasepool
    {
        NSArray *array=[[NSArray alloc] initWithObjects:@"one",@"two",[NSNumber numberWithInt:123],[NSDate date], nil];
        //若找不到plist文件，会自动创建
        BOOL ret=[array writeToFile:@"/Users/qianfeng/Desktop/ww/app.plist" atomically:YES];
        if(ret)
        {
            NSLog(@"文件写入成功");
            
        }
        else
        {
            NSLog(@"文件写入失败");
        }
//        NSString *str=@"123";
//        [str writeToFile:@"/Users/qianfeng/Desktop/ww/str.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
        NSDictionary *dict=[NSDictionary dictionaryWithObjectsAndKeys:@"1",@"one",@"2",@"two",[NSNumber numberWithInt:345],@"num",[@"ios" dataUsingEncoding:NSUTF8StringEncoding],@"ios",[NSDate date],@"date",array,@"array", nil];
        ret=[dict writeToFile:@"/Users/qianfeng/Desktop/ww/dictionary1.txt" atomically:YES];
        if(ret)
        {
            NSLog(@"文件写入成功");
            
        }
        else
        {
            NSLog(@"文件写入失败");
        }
    }
    return 0;
}
