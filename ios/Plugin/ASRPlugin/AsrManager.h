//
//  NSObject+AsrManager.h
//  Runner
//
//  Created by jph on 2019/3/17.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AsrManager:NSObject
typedef void(^AsrCallback)(NSString* message);
+(instancetype)initWith:(AsrCallback)success failure:(AsrCallback)failure;
- (void)start;
- (void)stop;
- (void)cancel;
@end


