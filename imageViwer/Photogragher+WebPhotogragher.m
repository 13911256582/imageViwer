//
//  Photogragher+WebPhotogragher.m
//  imageViwer
//
//  Created by ShaoLing on 5/17/14.
//  Copyright (c) 2014 dastone.cn. All rights reserved.
//

#import "Photogragher+WebPhotogragher.h"

@implementation Photogragher (WebPhotogragher)

+ (Photogragher *)photographerWithWebInfo:(NSString *)name inManagedObjectContext:(NSManagedObjectContext *)context {
    
    Photogragher *photographer = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"photographer"];

    request.predicate = [NSPredicate predicateWithFormat:@"name = %@", name];
    
    NSError *error;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || error || [matches count] > 1) {
        //error handler
    } else if ([matches count]) {
        //already exist, return the existing one
        photographer = [matches firstObject];
    } else {
        //not exist, create a new one
        photographer = [NSEntityDescription insertNewObjectForEntityForName:@"photographer" inManagedObjectContext:context];
        
        photographer.name = name;
    }
    return photographer;
}

@end
