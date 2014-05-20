//
//  Photogragher+WebPhotogragher.h
//  imageViwer
//
//  Created by ShaoLing on 5/17/14.
//  Copyright (c) 2014 dastone.cn. All rights reserved.
//

#import "Photogragher.h"

@interface Photogragher (WebPhotogragher)

+ (Photogragher *)photographerWithWebInfo:(NSString *)name inManagedObjectContext:(NSManagedObjectContext *)context;

@end
