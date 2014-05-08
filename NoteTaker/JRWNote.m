//
//  JRWNote.m
//  NoteTaker
//
//  Created by James Wen on 5/8/14.
//  Copyright (c) 2014 Rochester. All rights reserved.
//

#import "JRWNote.h"

@interface JRWNote ()

@property (nonatomic) NSDate *timeCreated;
@property (nonatomic) NSDate *timeUpdated;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *content;

@end

@implementation JRWNote

//Initializers

//Designated Initializer
- (instancetype)initWithNoteTitle:(NSString *)title
                          Content:(NSString *)content{
    self = [super init];
    if(self) {
        NSDate *date = [[NSDate alloc] init];
        self.timeCreated = date;
        self.timeUpdated = date;
        self.title = title;
        self.content = content;
    }
    return self;
}


//Instance Methods

- (void)saveNoteTitle:(NSString *)title
              Content:(NSString *)content{
    self.title = title;
    self.content = content;
    self.timeUpdated = [[NSDate alloc] init];
}




@end
