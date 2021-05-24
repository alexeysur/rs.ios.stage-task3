#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if (monthNumber < 1 || monthNumber > 12) {
        return nil;
    }
    
    NSDateComponents *components = [NSDateComponents new];
    [components setMonth: monthNumber];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier: @"en_US"];
    [dateFormatter setDateFormat: @"MMMM"];
    
    NSDate *date = [[NSCalendar currentCalendar] dateFromComponents: components];
    
    return [dateFormatter stringFromDate: date];
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier: @"en_US_POSIX"]];
    [dateFormatter setDateFormat: @"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
    
    NSDate *dateFromString = [dateFormatter dateFromString: date];
    if (!dateFromString) {
        return 0;
    }
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [calendar component: NSCalendarUnitDay fromDate:dateFromString];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSArray *weekDays = @[@"Вс", @"Пн", @"Вт", @"Ср", @"Чт", @"Пт", @"Сб"];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *сomponents = [calendar components: NSCalendarUnitDay | NSCalendarUnitWeekday fromDate: date];
    if (сomponents != nil) {
        return weekDays[сomponents.weekday - 1];
    }
    return nil;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
     NSCalendar *calendar = [NSCalendar currentCalendar];
      
      NSInteger todaysWeek = [calendar component: NSCalendarUnitWeekOfYear fromDate: date];
      NSInteger dateWeek = [calendar component:NSCalendarUnitWeekOfYear fromDate: [NSDate now]];
      
      return dateWeek == todaysWeek ? YES : NO;
}

@end
