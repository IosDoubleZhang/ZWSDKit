//
//  UtilityForTime.m
//  lifangti
//
//  Created by xthink4 on 16/6/20.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "UtilityForTime.h"

@implementation UtilityForTime
+(NSString *)getXingzuo:(NSDate *)inDate{
    //计算星座
    
    NSString *retStr=@"";
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM"];
    int monthInt=0;
    NSString *theMonth = [dateFormat stringFromDate:inDate];
    if([[theMonth substringToIndex:0] isEqualToString:@"0"]){
        monthInt = [[theMonth substringFromIndex:1] intValue];
    }else{
        monthInt = [theMonth intValue];
    }
    
    [dateFormat setDateFormat:@"dd"];
    int dayInt=0;
    NSString *theDay = [dateFormat stringFromDate:inDate];
    if([[theDay substringToIndex:0] isEqualToString:@"0"]){
        dayInt = [[theDay substringFromIndex:1] intValue];
    }else{
        dayInt = [theDay intValue];
    }
    /*
     摩羯座 12月22日------1月19日
     水瓶座 1月20日-------2月18日
     双鱼座 2月19日-------3月20日
     白羊座 3月21日-------4月19日
     金牛座 4月20日-------5月20日
     双子座 5月21日-------6月21日
     巨蟹座 6月22日-------7月22日
     狮子座 7月23日-------8月22日
     处女座 8月23日-------9月22日
     天秤座 9月23日------10月23日
     天蝎座 10月24日-----11月21日
     射手座 11月22日-----12月21日
     */
    if (monthInt == 1) {
        if (dayInt > 0 && dayInt < 20) {
            retStr=@"摩羯座";
        }
        if (dayInt > 21 &&dayInt < 31) {
            retStr=@"水瓶座";
        }
        return retStr;
    }
    if (monthInt == 2) {
        if (dayInt > 0 && dayInt < 19) {
            retStr=@"水瓶座";
        }
        if (dayInt > 20 && dayInt < 30) {
            retStr=@"双鱼座";
        }
        return retStr;
    }
    if (monthInt == 3) {
        if (dayInt > 0 && dayInt < 21) {
            retStr=@"双鱼座";
        }
        if (dayInt > 20 && dayInt < 32) {
            retStr=@"白羊座";
        }
        return retStr;
    }
    if (monthInt == 4) {
        if (dayInt > 0 && dayInt < 20) {
            retStr=@"白羊座";
        }
        if (dayInt > 19 && dayInt < 31) {
            retStr=@"金牛座";
        }
        return retStr;
    }
    if (monthInt == 5) {
        if (dayInt > 0 && dayInt <= 20) {
            retStr=@"金牛座";
        }
        if (dayInt >= 21 && dayInt < 32) {
            retStr=@"双子座";
        }
        return retStr;
    }
    if (monthInt == 6) {
        if (dayInt > 0 && dayInt < 22) {
            retStr=@"双子座";
        }
        if (dayInt > 21 && dayInt < 31) {
            retStr=@"巨蟹座";
        }
        return retStr;
    }
    if (monthInt == 7) {
        if (dayInt > 0 && dayInt < 23) {
            retStr=@"巨蟹座";
        }
        if (dayInt > 22 && dayInt < 32) {
            retStr=@"狮子座";
        }
        return retStr;
    }
    if (monthInt == 8) {
        if (dayInt > 0 && dayInt < 23) {
            retStr=@"狮子座";
        }
        if (dayInt > 22 && dayInt < 32) {
            retStr=@"处女座";
        }
        return retStr;
    }
    if (monthInt == 9) {
        if (dayInt > 1 && dayInt < 23) {
            retStr=@"处女座";
        }
        if (dayInt > 22 && dayInt < 31) {
            retStr=@"天平座";
        }
        return retStr;
    }
    if (monthInt == 10) {
        if (dayInt > 0 && dayInt < 24) {
            retStr=@"天平座";
        }
        if (dayInt > 23 && dayInt < 32) {
            retStr=@"天蝎座";
        }
        return retStr;
    }
    if (monthInt == 11) {
        if (dayInt > 0 && dayInt < 22) {
            retStr=@"天蝎座";
        }
        if (dayInt > 21 && dayInt < 31) {
            retStr=@"摩羯座";
        }
        return retStr;
    }
    if (monthInt == 12) {
        if (dayInt > 1 && dayInt < 22) {
            retStr=@"水瓶座";
        }
        if (dayInt > 21 && dayInt < 32) {
            retStr=@"摩羯座";
        }
        return retStr;
    }
    return  retStr;
}
+(NSString*)nowdatewithStr:(NSDate *)date
{
    //    NSDateFormatter *datefm=[[NSDateFormatter alloc]init];
    
    [date timeIntervalSinceNow];
    NSTimeInterval atime=[date timeIntervalSince1970];
    NSDate *newdate=[NSDate new];
    NSTimeInterval newtime=[newdate timeIntervalSince1970];
    

    
    //    NSLog(@"%ld",newtime-atime);
    NSTimeInterval  time=newtime - atime;
    NSString *timeString;
    if (time/3600<1) {
        timeString = [NSString stringWithFormat:@"%d",(int) time/60];
        
        timeString=[NSString stringWithFormat:@"%@分前", timeString];
        
    }
    if (time/3600>1&&time/86400<1) {
        timeString = [NSString stringWithFormat:@"%d",(int) time/3600];
        timeString=[NSString stringWithFormat:@"%@小时前", timeString];
    }
    if (time/86400>1)
    {
        timeString = [NSString stringWithFormat:@"%d",(int) time/86400];
        //        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@天前", timeString];
        
    }
    
    return timeString;
}

@end
