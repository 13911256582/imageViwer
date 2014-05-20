//
//  CoreDataTableViewController.h
//  imageViwer
//
//  Created by ShaoLing on 5/17/14.
//  Copyright (c) 2014 dastone.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface CoreDataTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultController;



- (void)performFetch;

@end
