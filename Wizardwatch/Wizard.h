//
//  Wizard.h
//  Wizardwatch
//
//  Created by HSummy on 11/30/16.
//  Copyright © 2016 HSummy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Wizard : NSObject


@property (nonatomic) NSString *name;
@property (nonatomic) NSString *house;

+ (Wizard *)wizardWithDictionary:(NSDictionary *)wizardDictionary;

@end
