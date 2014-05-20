//
//  Photo+WebPhoto.m
//  imageViwer
//
//  Created by ShaoLing on 5/17/14.
//  Copyright (c) 2014 dastone.cn. All rights reserved.
//

#import "Photo+WebPhoto.h"
#import "Photogragher+WebPhotogragher.h"


@implementation Photo (WebPhoto)

+ (Photo *)photoWithWebInfo:(NSDictionary *)photoDictionary inManagedObjectContext:(NSManagedObjectContext *)context {
    
    Photo *photo = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"photo"];
    NSString *title = photoDictionary[@"title"];
    request.predicate = [NSPredicate predicateWithFormat:@"title = %@", title];
    
    NSError *error;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || error || [matches count] > 1) {
        //error handler
    } else if ([matches count]) {
        photo = [matches firstObject];
    } else {
        photo = [NSEntityDescription insertNewObjectForEntityForName:@"photo" inManagedObjectContext:context];
        
        photo.title = photoDictionary[@"title"];
        photo.photoURL = photoDictionary[@"photoURL"];
        photo.date = photoDictionary[@"date"];
        photo.whoTake = [Photogragher photographerWithWebInfo:photoDictionary[@"photographer"]
                                       inManagedObjectContext:context];
        
        
    }
    
    return photo;
}

+ (void)loadPhotosFromWeb:(NSArray *)photos inManagedObjectContext:(NSManagedObjectContext *)context
{
    
}

+ (UIManagedDocument *)createManagedDocument:(NSString*) documentName {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentDirectory = [[fileManager URLsForDirectory:NSDocumentationDirectory inDomains:NSUserDomainMask] firstObject];
    
    //NSString *documentName = @"MyDocument";
    NSURL *url = [documentDirectory URLByAppendingPathComponent:documentName];
    
    UIManagedDocument *document = [[UIManagedDocument alloc] initWithFileURL:url];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:url.path]) {
        //file already exist
        [document openWithCompletionHandler:^(BOOL success) {
            if (success) {
                [self documentIsReady];
            }
            if (!success) {
                NSLog(@"couldn't open document at %@", url);
            }
        }];
    } else {
        [document saveToURL:url forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success) {
            if (success) {
                [self documentIsReady];
            }
            if (!success) {
                NSLog(@"couldn't open document at %@", url);
            }
        }];
    }
    
    return document;
}

+ (void)documentIsReady {
    
    return;
    /*if (self.document.documentState == UIDocumentStateNormal) {
        _context = self.document.managedObjectContext;
    }*/
    
    //start doing things around core data
}


- (void)deletePhoto:(Photo *)photo {
    
}

- (void)insertPhoto {
    
}



@end
