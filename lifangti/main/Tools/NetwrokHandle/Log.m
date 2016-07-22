//
//  Log.m
//
//  Created by 大将军  on 16/7/21
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Log.h"


NSString *const kLogStatus = @"status";
NSString *const kLogToken = @"token";


@interface Log ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Log

@synthesize status = _status;
@synthesize token = _token;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.status = [[self objectOrNilForKey:kLogStatus fromDictionary:dict] doubleValue];
            self.token = [self objectOrNilForKey:kLogToken fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kLogStatus];
    [mutableDict setValue:self.token forKey:kLogToken];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.status = [aDecoder decodeDoubleForKey:kLogStatus];
    self.token = [aDecoder decodeObjectForKey:kLogToken];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_status forKey:kLogStatus];
    [aCoder encodeObject:_token forKey:kLogToken];
}

- (id)copyWithZone:(NSZone *)zone
{
    Log *copy = [[Log alloc] init];
    
    if (copy) {

        copy.status = self.status;
        copy.token = [self.token copyWithZone:zone];
    }
    
    return copy;
}


@end
