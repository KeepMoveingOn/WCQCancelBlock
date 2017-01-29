//
//  WCQCancelBlock.m
//  WCQCancelBlock
//
//  Created by wcq on 17/1/26.
//  Copyright © 2017年 Aspire. All rights reserved.
//

#import "WCQCancelBlock.h"

@interface WCQCancelBlock()

@end

@implementation WCQCancelBlock

- (void)main {
    
    if ([self isCancelled]) return;
    for (NSInteger i = 0; i < 5; i++) {
        
        if ([self isCancelled]) return;
        sleep(1);
        NSLog(@"loop == %@",@(i + 1));
    }
}

@end
