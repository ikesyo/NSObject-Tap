//
//  NSObject+Tap.h
//
//  Created by Syo Ikeda on 2013/04/05.
//  Copyright (c) 2013年 Syo Ikeda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Tap)

- (instancetype)tap:(void (^)(id me))block;

@end
