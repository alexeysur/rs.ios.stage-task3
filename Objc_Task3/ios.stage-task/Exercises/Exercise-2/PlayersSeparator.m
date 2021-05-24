#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    NSInteger count = 0;
    for (int i = 0; i < ratingArray.count; i++)
        for (int j = i + 1; j < ratingArray.count; j++)
            for (int k = j + 1; k < ratingArray.count; k++)
                if (ratingArray[i].intValue < ratingArray[j].intValue && ratingArray[j].intValue < ratingArray[k].intValue) {
                    count++;
                } else {
                    if (ratingArray[i].intValue > ratingArray[j].intValue && ratingArray[j].intValue > ratingArray[k].intValue) { count++; }
                }
    
    return count;
}

@end
