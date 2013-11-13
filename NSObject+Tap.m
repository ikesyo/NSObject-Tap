//
//  NSObject+Tap.m
//
//  Created by Syo Ikeda on 2013/04/05.
//  Copyright (c) 2013 Syo Ikeda. All rights reserved.
//

#import "NSObject+Tap.h"

@implementation NSObject (Tap)

- (instancetype)tap:(void (^)(id))block
{
    NSParameterAssert(block != nil);
    block(self);
    return self;
}

// It is inspired by the `tapp` RubyGem at http://rubygems.org/gems/tapp.
- (instancetype)tapp
{
    NSLog(@"%@", self);
    return self;
}

@end
