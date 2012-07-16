//
//  CodeIgniterView.m
//  OpenSamFile
//
//  Created by Padraig O Cinneide on 15/07/2012.
//
//

#import "CodeIgniterView.h"

@implementation CodeIgniterView


-(NSString *)folderPath
{
    return @"application/views/";
}


-(BOOL)parseLine:(NSString *)line
{
    self.filePath = [self pathFromLine:line withPrefix:@"this->load->view("];
    self.functionName = nil;
    
    if (self.filePath) {
        return YES;
    }
    return NO;
}



@end
