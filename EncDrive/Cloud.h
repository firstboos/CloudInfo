//
//  Cloud.h
//  EncDrive
//
//  Created by Jeon BooSang on 2014. 12. 12..
//  Copyright (c) 2014년 Jeon BooSang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cloud : NSObject
@property (nonatomic, copy) NSString *cloudName;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *password;

-(id)initWithName:(NSString *)cloudName;
@end