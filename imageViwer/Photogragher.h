//
//  Photogragher.h
//  imageViwer
//
//  Created by ShaoLing on 5/10/14.
//  Copyright (c) 2014 dastone.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Photo;

@interface Photogragher : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *photo;
@end

@interface Photogragher (CoreDataGeneratedAccessors)

- (void)addPhotoObject:(Photo *)value;
- (void)removePhotoObject:(Photo *)value;
- (void)addPhoto:(NSSet *)values;
- (void)removePhoto:(NSSet *)values;

@end
