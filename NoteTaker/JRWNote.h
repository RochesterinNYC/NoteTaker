//
//  JRWNote.h
//  NoteTaker
//
//  Created by James Wen on 5/8/14.
//  Copyright (c) 2014 Rochester. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JRWNote : NSObject

//Class methods

//Initializers
- (instancetype)initWithNoteTitle:(NSString *)title
                          Content:(NSString *)content;

//Instance methods
- (void)saveNoteTitle:(NSString *)title
                Content:(NSString *)content;

@end
