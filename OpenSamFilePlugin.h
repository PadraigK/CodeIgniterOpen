#import <Cocoa/Cocoa.h>
#import "CodaPluginsController.h"
#import "CodeIgniterModel.h"
#import "CodeIgniterView.h"
#import "CodeIgniterController.h"

@class CodaPlugInsController;

@interface OpenSamFilePlugin : NSObject <CodaPlugIn>
{
	CodaPlugInsController* controller;
}

-(void)openSam:(id)sender;

-(NSString *)siteLocalPath;


-(BOOL)openCodeIgniterFile:(CodeIgniterFile *)ciFile;
-(void)jumpToFirstOccurranceOfString:(NSString *)searchString inCodeTextView:(CodaTextView *)ctv;

@end
