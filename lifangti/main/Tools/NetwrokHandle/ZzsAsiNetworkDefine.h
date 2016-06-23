//
//  ZzsAsiNetworkDefine.h
//  ZzsProject
//
//  Created by MengHuan on 15/4/23.
//  Copyright (c) 2015年 MengHuan. All rights reserved.
//

#ifndef ZzsProject_ZzsAsiNetworkDefine_h
#define ZzsProject_ZzsAsiNetworkDefine_h

/**
 *  请求类型
 */
typedef enum {
    ZzsAsiNetWorkGET = 1,   /**< GET请求 */
    ZzsAsiNetWorkPOST       /**< POST请求 */
} ZzsAsiNetWorkType;

/**
 *  网络请求超时的时间
 */
#define ZzsAsi_API_TIME_OUT 20


#if NS_BLOCKS_AVAILABLE
/**
 *  请求开始的回调（下载时用到）
 */
typedef void (^ZzsAsiStartBlock)(void);

/**
 *  请求成功回调
 *
 *  @param returnData 回调block
 */
typedef void (^ZzsAsiSuccessBlock)(NSDictionary *returnData);

/**
 *  请求失败回调
 *
 *  @param error 回调block
 */
typedef void (^ZzsAsiFailureBlock)(NSError *error);

#endif

#endif
