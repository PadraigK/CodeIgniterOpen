//
//  CodaTextView+Additions.h
//  OpenSamFile
//
//  Created by Padraig O Cinneide on 15/07/2012.
//
//

#import "CodaPluginsController.h"
#import "NSString+numberOfOccurrances.h"

@interface CodaTextView (Additions)

-(NSUInteger)lineForString:(NSString *)searchString;
-(void)jumpToFirstOccurranceOfString:(NSString *)searchString;

@end
