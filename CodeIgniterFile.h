//
//  CodeIgniterFile.h
//  OpenSamFile
//
//  Created by Padraig O Cinneide on 15/07/2012.
//
//

#import <Foundation/Foundation.h>

@interface CodeIgniterFile : NSObject
{
    NSString * siteRoot;
    NSString * filePath;
    NSString * functionName;
}

@property (strong) NSString * siteRoot;
@property (strong) NSString * filePath;
@property (strong) NSString * functionName;


-(NSString *)absolutePath;

+(id)codeIgniterFileFromLine:(NSString *)line andSiteRoot:sr;
-(id)initWithLine:(NSString *)line andSiteRoot:(NSString *)sr;

-(NSString *)pathFromLine:(NSString *)line withPrefix:(NSString *)prefix;

@end
