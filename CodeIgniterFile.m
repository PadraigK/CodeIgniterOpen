//
//  CodeIgniterFile.m
//  OpenSamFile
//
//  Created by Padraig O Cinneide on 15/07/2012.
//
//

#import "CodeIgniterFile.h"

@implementation CodeIgniterFile

@synthesize functionName, siteRoot,  filePath;

+(id)codeIgniterFileFromLine:(NSString *)line andSiteRoot:sr
{
    return [[[self class] alloc] initWithLine:line andSiteRoot:sr];
}

-(id)initWithLine:(NSString *)line andSiteRoot:(NSString *)sr
{
    if ([super init])
    {
        self.siteRoot = sr;
        if([self parseLine:line])
        {    
            return self;
        }
    }
    return nil;
    
}

-(NSString *)folderPath
{
    NSLog(@"This should be overridden by subclasses");
    return @"";
}

-(BOOL)parseLine:(NSString *)line
{
    NSLog(@"This should be overridden by subclasses");
    return NO;
}

-(NSString *)absolutePath
{
    NSString *pathToFile = [[self.siteRoot stringByAppendingPathComponent:self.folderPath] stringByAppendingPathComponent:self.filePath];
    if ([pathToFile hasSuffix:@"php"]) {
        return pathToFile;
    } else {
        return [pathToFile stringByAppendingPathExtension:@"php"];
    }
    

}

-(NSString *)pathFromLine:(NSString *)line withPrefix:(NSString *)prefix
{
    NSRange rangeOfPrefix = [line rangeOfString:prefix];
    
    if(rangeOfPrefix.location != NSNotFound)
    {
        NSCharacterSet *chars = [NSCharacterSet characterSetWithCharactersInString:@"'\""];
        
        NSUInteger pathStartLocation = rangeOfPrefix.location + rangeOfPrefix.length + 1;
        NSRange rangeOfFirstNonLetterCharacter = [line rangeOfCharacterFromSet:chars
                                                                       options:0
                                                                         range:NSMakeRange(pathStartLocation, [line length]-pathStartLocation)];
        
        NSRange rangeOfTarget = NSMakeRange(pathStartLocation, rangeOfFirstNonLetterCharacter.location-pathStartLocation);
        
        return [line substringWithRange:rangeOfTarget];
    } else
    {
        return nil;
    }
    
}


@end
