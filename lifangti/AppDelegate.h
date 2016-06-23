//
//  AppDelegate.h
//  lifangti
//
//  Created by xthink4 on 16/6/11.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "someFountionTabbar.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property(strong,nonatomic)someFountionTabbar *Bar;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

