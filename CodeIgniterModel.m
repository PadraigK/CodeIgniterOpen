//
//  CodeIgniterModel.m
//  OpenSamFile
//
//  Created by Padraig O Cinneide on 15/07/2012.
//
//

#import "CodeIgniterModel.h"

@implementation CodeIgniterModel


-(NSString *)folderPath
{
    return @"application/models/";
}


-(BOOL)parseLine:(NSString *)line
{
    self.filePath = [[self modelNameFromTextLine:line] lowercaseString];
    self.functionName = [self functionNameForModelOnLine:line];
    
    
    if (self.filePath) {
        return YES;
    }
    return NO;
}


-(NSString *)modelNameFromTextLine:(NSString *)line
{
    // If the line contains a _model suffix, it's a model.
    
    NSRange rangeOfModelName = [self rangeOfModelNameFromLine:line];
    if  (rangeOfModelName.location != NSNotFound)
    {
        return [line substringWithRange:rangeOfModelName];
    }
    else
    {
        return nil;
    }
    
}

-(NSRange)rangeOfModelNameFromLine:(NSString *)line
{
    NSRange rangeOfModelSuffix = [line rangeOfString:@"_model"];
    if  (rangeOfModelSuffix.location != NSNotFound)
    {
        
        NSCharacterSet *chars = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
        NSRange rangeOfLastNonLetterCharacter = [line rangeOfCharacterFromSet:chars
                                                                      options:NSBackwardsSearch
                                                                        range:NSMakeRange(0, rangeOfModelSuffix.location)];
        
        NSUInteger modelNameStartLocation = rangeOfLastNonLetterCharacter.location+1;
        
        return NSMakeRange(modelNameStartLocation, rangeOfModelSuffix.location-modelNameStartLocation+rangeOfModelSuffix.length);
        
    }
    else
    {
        return NSMakeRange(NSNotFound, 0);
    }
}


-(NSString *)functionNameForModelOnLine:(NSString *)line
{
    NSRange rangeOfModelName = [self rangeOfModelNameFromLine:line];
    if  (rangeOfModelName.location != NSNotFound)
    {
        NSUInteger afterModelNameLocation = rangeOfModelName.location+rangeOfModelName.length;
        NSRange arrowLocation = [line rangeOfString:@"->" options:0 range:NSMakeRange(afterModelNameLocation, [line length] - afterModelNameLocation)];
        if (arrowLocation.location==NSNotFound) {
            return nil;
        }
        NSUInteger functionNameStartLocation = arrowLocation.location+arrowLocation.length;
        NSCharacterSet *chars = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
        NSRange rangeOfFirstNonLetterCharacter = [line rangeOfCharacterFromSet:chars
                                                                       options:0
                                                                         range:NSMakeRange(functionNameStartLocation, [line length] - functionNameStartLocation)];
        
        NSRange rangeOfFunctionName = NSMakeRange(functionNameStartLocation, rangeOfFirstNonLetterCharacter.location-functionNameStartLocation);
        
        return [line substringWithRange:rangeOfFunctionName];
    } else
    {
        return nil;
    }
    
}

@end
