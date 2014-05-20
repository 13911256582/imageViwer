//
//  Photo+WebPhoto.h
//  imageViwer
//
//  Created by ShaoLing on 5/17/14.
//  Copyright (c) 2014 dastone.cn. All rights reserved.
//

#import "Photo.h"

@interface Photo (WebPhoto)

+ (Photo *)photoWithWebInfo:(NSDictionary *)photoDictionary inManagedObjectContext:(NSManagedObjectContext *)context;

+ (void)loadPhotosFromWeb:(NSArray *)photos inManagedObjectContext:(NSManagedObjectContext *)context;

+ (UIManagedDocument *)createManagedDocument:(NSString*) documentName;

+ (void)documentIsReady;



@end
