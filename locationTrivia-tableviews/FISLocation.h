//  FISLocation.h

#import <Foundation/Foundation.h>
#import "FISTrivium.h"

@interface FISLocation : NSObject

@property (strong, nonatomic) NSString *name;
@property (nonatomic) CGFloat latitude;
@property (nonatomic) CGFloat longitude;
@property (strong, nonatomic) NSMutableArray *trivia;

- (instancetype)init;
- (instancetype)initWithName:(NSString *)name
                    latitude:(CGFloat)latitude
                   longitude:(CGFloat)longitude;

- (NSString *)stringByTruncatingNameToLength:(NSUInteger)length;

- (BOOL)hasValidData;

- (FISTrivium *)triviumWithMostLikes;

+ (NSArray *)testData;

@end
