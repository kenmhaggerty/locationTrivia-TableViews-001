//  FISLocation.m

#import "FISLocation.h"

@implementation FISLocation

- (instancetype)init {
    self = [self initWithName:@""
                     latitude:0.0
                    longitude:0.0];
    return self;
}

- (instancetype)initWithName:(NSString *)name
                    latitude:(CGFloat)latitude
                   longitude:(CGFloat)longitude {
    self = [super init];
    if (self) {
        _name = name;
        _latitude = latitude;
        _longitude = longitude;
        _trivia = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSString *)stringByTruncatingNameToLength:(NSUInteger)length {
    if (length > self.name.length) {
        return self.name;
    }
    
    return [self.name substringToIndex:length];
}

- (BOOL)hasValidData {
    if (self.name.length == 0) {
        return NO;
    }
    if (self.latitude < -90.0 || self.latitude > 90.0) {
        return NO;
    }
    if (self.longitude <= -180.0 || self.longitude > 180.0) {
        return NO;
    }
    return YES;
}

- (FISTrivium *)triviumWithMostLikes {
    if (self.trivia.count == 0) {
        return nil;
    }
    
    FISTrivium *triviumWithMostLikes = self.trivia[0];
    for (FISTrivium *currentTrivium in self.trivia) {
        if (triviumWithMostLikes.likes < currentTrivium.likes) {
            triviumWithMostLikes = currentTrivium;
        }
    }
    return triviumWithMostLikes;
    
    /** solution with NSSortDescriptor
     
     NSSortDescriptor *sortByLikesDesc = [NSSortDescriptor sortDescriptorWithKey:@"likes"
     ascending:NO];
     NSArray *triviumByLikes = [self.trivia sortedArrayUsingDescriptors:@[sortByLikesDesc]];
     
     return triviumByLikes[0];
     */
}

+ (NSArray *)testData {
    FISLocation *location1 = [[FISLocation alloc] initWithName:@"The Empire State Building"
                                                      latitude:40.7484
                                                     longitude:-73.9857];
    
    FISTrivium *trivia1A = [[FISTrivium alloc] initWithContent:@"1,454 Feet Tall" likes:4];
    FISTrivium *trivia1B = [[FISTrivium alloc] initWithContent:@"Cost $24,718,000 to build" likes:2];
    
    [location1.trivia addObjectsFromArray:@[trivia1A, trivia1B]];
    
    FISLocation *location2 = [[FISLocation alloc] initWithName:@"Bowling Green"
                                                      latitude:41.3739
                                                     longitude:-83.6508];
    
    FISTrivium *trivia2A = [[FISTrivium alloc] initWithContent:@"NYC's oldest park" likes:8];
    FISTrivium *trivia2B = [[FISTrivium alloc] initWithContent:@"Made a park in 1733" likes:2];
    FISTrivium *trivia2C = [[FISTrivium alloc] initWithContent:@"Charging Bull was created in 1989" likes:0];
    
    
    [location2.trivia addObjectsFromArray:@[trivia2A, trivia2B, trivia2C]];
    
    FISLocation *location3 = [[FISLocation alloc] initWithName:@"Statue Of Liberty"
                                                      latitude:40.6892
                                                     longitude:74.0444];
    FISTrivium *trivia3A = [[FISTrivium alloc] initWithContent:@"Gift from the french" likes:6];
    
    [location3.trivia addObjectsFromArray:@[trivia3A]];
    
    return @[location1,location2,location3];
}

@end
