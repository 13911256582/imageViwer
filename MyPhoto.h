//
//  MyPhoto.h
//  imageViwer
//
//  Created by ShaoLing on 4/27/14.
//  Copyright (c) 2014 dastone.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyPhoto : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *imageURL;
@property (strong, nonatomic) UIManagedDocument *document;
@property (strong, nonatomic) NSManagedObjectContext *context;

@end
