//
//  JRWNote.m
//  NoteTaker
//
//  Created by James Wen on 5/8/14.
//  Copyright (c) 2014 Rochester. All rights reserved.
//

#import "JRWNote.h"

#define timeCreatedKey @"timeCreated"
#define timeUpdatedKey @"timeUpdated"
#define titleKey @"title"
#define contentKey @"content"

@interface JRWNote ()
@end

@implementation JRWNote

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

//Used to sort and present notes in descending order of last update (last update first)
- (NSComparisonResult)compare:(JRWNote *)otherObject{
    return -[self.timeUpdated compare:otherObject.timeUpdated];
}

//NSCoding

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.timeCreated forKey:timeCreatedKey];
    [encoder encodeObject:self.timeUpdated forKey:timeUpdatedKey];
    [encoder encodeObject:self.title forKey:titleKey];
    [encoder encodeObject:self.content forKey:contentKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if(!self){
        return nil;
    }
    
    self.timeCreated = [decoder decodeObjectForKey:timeCreatedKey];
    self.timeUpdated = [decoder decodeObjectForKey:timeUpdatedKey];
    self.title = [decoder decodeObjectForKey:titleKey];
    self.content = [decoder decodeObjectForKey:contentKey];
    
    return self;
}

@end
