//
//  WordManager.h
//  OC_单词个数(讲)
//
//  Created by qianfeng on 15/6/17.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WordManager : NSObject
{
    NSMutableDictionary *_wordList;
}
-(id)initWithFile:(NSString *)path;
-(void)parseWordFile:(NSString *)path;
-(NSInteger)firstWordCountByArray:(NSString *)key withArray:(NSMutableArray *)mularray;
+(void)userInterface;
@end
