//
//  ShareService.h
//  FoodieSocial
//
//  Created by shaoxinjiang on 9/12/12.
//  Copyright (c) 2012 Xinjiang Shao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ShareService <NSObject>
{
    NSString *const version = @"1.0";
    NSString *const author  = @"Xinjiang Shao";
}

+ authorize:(NSString) username andWithPassword:(NSString)userpasswd withType:(int)accounttype{};

- (NSString)getVersion{};

@end
