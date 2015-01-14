//
//  MagicalCreature.h
//  MCMS
//
//  Created by Gabriel Borri de Azevedo on 1/13/15.
//  Copyright (c) 2015 Gabriel Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MagicalCreature : NSObject

@property NSString *name;
@property NSString *detail;

-(instancetype)initWithName:(NSString *)name :(NSString *)detail;

@end
