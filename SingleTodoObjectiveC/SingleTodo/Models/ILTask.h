//
//  ILTask.h
//  SingleTodo
//
//  Created by Abraham Kuri on 6/3/14.
//  Copyright (c) 2014 icalialabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ILTask : NSObject

@property (strong, nonatomic) NSString *taskDescription;
@property (assign, nonatomic, getter = isDone) BOOL done;

@end
