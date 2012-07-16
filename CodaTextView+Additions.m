//
//  CodaTextView+Additions.m
//  OpenSamFile
//
//  Created by Padraig O Cinneide on 15/07/2012.
//
//

#import "CodaTextView+Additions.h"


@implementation CodaTextView (Additions)

-(NSUInteger)lineForString:(NSString *)searchString
{
    NSRange stringRange = [self.string rangeOfString:searchString options:NSCaseInsensitiveSearch];
    if (stringRange.location != NSNotFound) {
        NSString *stringUntilFunction = [self.string substringToIndex:stringRange.location];
        return [stringUntilFunction numberOfLines];
    }
    return NSNotFound;
}

-(void)jumpToFirstOccurranceOfString:(NSString *)searchString
{
    NSUInteger lineNumber = [self lineForString:searchString];
    if (lineNumber!=NSNotFound) {
        [self goToLine:[self lineForString:searchString] column:0];
    }
}



@end
