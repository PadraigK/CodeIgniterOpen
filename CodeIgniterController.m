//
//  CodeIgniterController.m
//  OpenSamFile
//
//  Created by Padraig O Cinneide on 15/07/2012.
//
//

#import "CodeIgniterController.h"

@implementation CodeIgniterController

-(NSString *)folderPath
{
    return @"application/controllers/";
}


-(BOOL)parseLine:(NSString *)line
{
    self.functionName = nil;
    
    self.filePath = [self findControllerPathInString:[self pathFromLine:line withPrefix:@"action="]];
    
    if (!self.filePath)
        self.filePath = [self findControllerPathInString:[self pathFromLine:line withPrefix:@"redirect("]];

    if (!self.filePath)
        self.filePath = [self findControllerPathInString:[self pathFromLine:line withPrefix:@"href="]];

    if (!self.filePath)
        self.filePath = [self findControllerPathInString:[self pathFromLine:line withPrefix:@"wasLoggedOut("]];

    
    if (self.filePath) {
        return YES;
    }
    return NO;
}


-(NSString *)findControllerPathInString:(NSString *)path
{
    if(!path) return nil;
    
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL isDirectory = NO;
    
    do {
        self.filePath = path;
        
        if([fm fileExistsAtPath:self.absolutePath isDirectory:&isDirectory])
        {
            // we have our path
            return self.filePath;
        } else
        {
            self.functionName = [[path pathComponents] lastObject];
            path = [path stringByDeletingLastPathComponent];
            
        }
    } while ([path rangeOfString:@"/"].location!=NSNotFound && ![path isEqualToString:@"/"]);
    
    self.filePath = nil;
    self.functionName = nil;
    return nil;
}




@end
