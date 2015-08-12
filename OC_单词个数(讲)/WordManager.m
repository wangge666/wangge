//
//  WordManager.m
//  OC_单词个数(讲)
//
//  Created by qianfeng on 15/6/17.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "WordManager.h"

@implementation WordManager
-(id)initWithFile:(NSString *)path
{
    if(self=[super init])
    {
        _wordList=[NSMutableDictionary dictionary];
        [self parseWordFile:path];
    }
    return self;
}
-(void)parseWordFile:(NSString *)path
{
    //读取单词文件
    NSString *fileContent=[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    if(!fileContent)
    {
        return;
    }
    //分割字符串
    NSArray *words=[fileContent componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@",.\n "]];
    NSMutableArray *mulWord=[NSMutableArray arrayWithArray:words];
    [mulWord removeObject:@""];
    for (NSString *item in words)
    {
        if(![item isEqualToString:@""])
        {
            [mulWord addObject:[item lowercaseString]];
        }
        [item lowercaseString];
    }
    while ([mulWord count]>0)
    {
        NSString *key=[mulWord objectAtIndex:0];
        NSNumber *value=[NSNumber numberWithInteger:[self firstWordCountByArray:key withArray:mulWord]];
        [_wordList setObject:value forKey:key];
        [mulWord removeObject:key];
    }
    NSLog(@"%@",_wordList);
}

-(NSInteger)firstWordCountByArray:(NSString *)key withArray:(NSMutableArray *)mularray
{
    NSInteger cnt=0;
    for(NSString *item in mularray)
    {
        if([item isEqualToString:key])
        {
            cnt++;
        }
    }
   
    return cnt;
}
+(void)userInterface
{
    NSInteger cnt;
    scanf("%li",&cnt);
    WordManager *manager=[[WordManager alloc] initWithFile:@"/Users/qianfeng/Downloads/artical.txt"];
    NSLog(@"keys=%@",[manager->_wordList allKeysForObject:[NSNumber numberWithInteger:cnt]]);
    
}
@end
