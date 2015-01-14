//
//  MagicalCreature.m
//  MCMS
//
//  Created by Gabriel Borri de Azevedo on 1/13/15.
//  Copyright (c) 2015 Gabriel Enterprises. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature

-(instancetype)initWithName:(NSString *)name :(NSString *)detail
{
    self = [super init];
    if (self)
    {
        self.name = name;
        self.detail = detail;
    }
    return self;
}

@end
