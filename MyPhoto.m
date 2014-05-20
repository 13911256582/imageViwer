//
//  MyPhoto.m
//  imageViwer
//
//  Created by ShaoLing on 4/27/14.
//  Copyright (c) 2014 dastone.cn. All rights reserved.
//

#import "MyPhoto.h"

@implementation MyPhoto



- (UIManagedDocument *)createManagedDocument:(NSString*) documentName {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentDirectory = [[fileManager URLsForDirectory:NSDocumentationDirectory inDomains:NSUserDomainMask] firstObject];
    
    //NSString *documentName = @"MyDocument";
    NSURL *url = [documentDirectory URLByAppendingPathComponent:documentName];
    
   _document = [[UIManagedDocument alloc] initWithFileURL:url];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:url.path]) {
        //file already exist
        [self.document openWithCompletionHandler:^(BOOL success) {
            if (success) {
                [self documentIsReady];
            }
            if (!success) {
                NSLog(@"couldn't open document at %@", url);
            }
        }];
    } else {
        [self.document saveToURL:url forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success) {
            if (success) {
                [self documentIsReady];
            }
            if (!success) {
                NSLog(@"couldn't open document at %@", url);
            }
        }];
    }
    
    return self.document;
}

- (void)documentIsReady {
    
    if (self.document.documentState == UIDocumentStateNormal) {
        _context = self.document.managedObjectContext;
    }
    
    //start doing things around core data
}
        


@end
