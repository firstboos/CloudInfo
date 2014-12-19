//
//  Cloud.m
//  EncDrive
//
//  Created by Jeon BooSang on 2014. 12. 12..
//  Copyright (c) 2014년 Jeon BooSang. All rights reserved.
//

#import "Cloud.h"

@implementation Cloud

-(id)initWithName:(NSString *)cloudName
{
    self = [super init];
    if (self) {
        _cloudName = cloudName;
        return self;
    }
    return nil;
}
@end
