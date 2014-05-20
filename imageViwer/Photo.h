//
//  Photo.h
//  imageViwer
//
//  Created by ShaoLing on 5/10/14.
//  Copyright (c) 2014 dastone.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Photogragher;

@interface Photo : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * photoURL;
@property (nonatomic, retain) NSString * thumbURL;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) Photogragher *whoTake;

@end
