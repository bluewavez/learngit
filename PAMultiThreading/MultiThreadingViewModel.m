//
//  MultiThreadingViewModel.m
//  PAMultiThreading
//
//  Created by 朱永杰 on 2018/11/14.
//  Copyright © 2018年 individual. All rights reserved.
//

#import "MultiThreadingViewModel.h"

@implementation MultiThreadingViewModel
+(void)testThreadByType:(NSInteger )type
{
    switch (type) {
        case 0:
            {
                dispatch_queue_t p = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
                dispatch_sync(p,^{
                    dispatch_async(dispatch_get_global_queue(0, 0), ^{
                        NSLog(@"tongchuan--%@",[NSThread currentThread]);
                    });
                });
                dispatch_sync(p,^{
                    NSLog(@"tongchuan1--%@",[NSThread currentThread]);
                });
            }
            break;
        case 1:
        {
            dispatch_queue_t p = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
            dispatch_sync(p,^{
                dispatch_sync(p,^{
                    
                    NSLog(@"tongbing1--%@",[NSThread currentThread]);
                });
                NSLog(@"tongbing--%@",[NSThread currentThread]);
            });
        }
            break;
        case 2:
        {
            dispatch_queue_t p = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
            dispatch_async(p,^{
                NSLog(@"yibing--%@",[NSThread currentThread]);
            });
        }
            break;
        case 3:
        {
            __block NSInteger a = 0;
            dispatch_queue_t p = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
            dispatch_async(p,^{
                [NSThread sleepForTimeInterval:2];
                a++;
                NSLog(@"yichuan--%@-%d",[NSThread currentThread],a);
            });
            dispatch_async(p,^{
                [NSThread sleepForTimeInterval:2];
                a++;
                NSLog(@"yichuan--%@-%d",[NSThread currentThread],a);
            });
        }
            break;
        case 4:
        {
            NSLog(@"sisuo下面不会打印了--%@",[NSThread currentThread]);
            
            dispatch_sync(dispatch_get_main_queue(),^{
                NSLog(@"yichuan--%@",[NSThread currentThread]);
            });
        }
            break;
            
        default:
            break;
    }
}

@end
