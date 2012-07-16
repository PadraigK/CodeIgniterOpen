//
//  NSString+numberOfOccurrances.m
//  OpenSamFile
//
//  Created by Padraig O Cinneide on 15/07/2012.
//
//

#import "NSString+numberOfOccurrances.h"

@implementation NSString (numberOfOccurrances)

-(NSUInteger)numberOfLines
{
    NSUInteger numberOfLines, index, stringLength = [self length];
    
    for (index = 0, numberOfLines = 0; index < stringLength; numberOfLines++)
        index = NSMaxRange([self lineRangeForRange:NSMakeRange(index, 0)]);
    
    return numberOfLines;
}

@end
