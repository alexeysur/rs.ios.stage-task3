#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableString *resultString = [NSMutableString new];
    
    while (string1.length > 0 || string2.length > 0) {
        if (string1.length == 0) {
            [resultString appendString: string2];
            break;
        }
        else if (string2.length == 0) {
            [resultString appendString: string1];
            break;
        }
        
        NSString *firstCharString1 = [string1 substringWithRange: NSMakeRange(0, 1)];
        NSString *firstCharString2 = [string2 substringWithRange: NSMakeRange(0, 1)];
        NSComparisonResult compareChars = [firstCharString1 compare: firstCharString2];
        if (compareChars == NSOrderedAscending || compareChars == NSOrderedSame) {
            [resultString appendString:firstCharString1];
            string1 = [string1 substringFromIndex: 1];
        }
        else {
            [resultString appendString:firstCharString2];
            string2 = [string2 substringFromIndex: 1];
        }
    }
    return resultString;
}

@end
