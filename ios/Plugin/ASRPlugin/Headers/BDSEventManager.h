//
//  BDSEventManager.h
//  BDSpeechClient
//
//  Created by baidu on 16/6/6.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString* BDS_ASR_NAME;
extern NSString* BDS_WAKEUP_NAME;
extern NSString* BDS_UPLOADER_NAME;

@interface BDSEventManager : NSObject

+ (BDSEventManager *)createEventManagerWithName:(NSString *)name;
- (BOOL)setParameter:(id)param forKey:(NSString *)key;
- (void)sendCommand:(NSString *)command;
- (BOOL)setDelegate:(id)delegate;
- (NSString *)libver;

@end
