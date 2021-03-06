//
//  Doctor.m
//  Therapeuo
//
//  Created by Brian Shim on 2015-11-21.
//  Copyright © 2015 Dumpling. All rights reserved.
//

#import "Doctor.h"

@interface Doctor ()

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *doctorId;
@property (nonatomic, assign) BOOL assisting;
@property (nonatomic, assign) BOOL available;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *device;

@end

@implementation Doctor

+ (instancetype)doctorWithID:(NSString *)doctorID
                        name:(NSString *)name
                       email:(NSString *)email
                    location:(NSString *)location
                   available:(BOOL)available
                   assisting:(BOOL)assisting
                      device:(NSString *)device {
    
    return [[Doctor alloc] initWithID:doctorID
                                 name:name
                                email:email
                             location:location
                            available:available
                            assisting:assisting
                               device:device];
}

- (instancetype)initWithID:(NSString *)doctorID
                      name:(NSString *)name
                     email:(NSString *)email
                  location:(NSString *)location
                 available:(BOOL)available
                 assisting:(BOOL)assisting
                    device:(NSString *)device {
    self = [super init];
    if (self) {
        _doctorId = doctorID;
        _name = name;
        _email = email;
        _location = location;
        _available = available;
        _assisting = assisting;
        _device = device;
    }
    return self;
}

- (instancetype)copyWithDevice:(NSString *)device {
    return [[Doctor alloc] initWithID:[self.doctorId copy]
                                 name:[self.name copy]
                                email:[self.email copy]
                             location:[self.location copy]
                            available:self.available
                            assisting:self.assisting
                               device:device];
}


#pragma mark - Data Parsing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"name" : @"name",
             @"password" : @"password",
             @"email" : @"email",
             @"doctorId" : @"_id",
             @"assisting" : @"assisting",
             @"available" : @"available",
             @"device" : @"device",
             //location
             };
}

+ (NSValueTransformer *)assistingJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
}

+ (NSValueTransformer *)availableJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
}

@end
