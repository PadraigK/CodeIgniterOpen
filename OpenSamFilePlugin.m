#import "OpenSamFilePlugin.h"
#import "CodaPlugInsController.h"
#import "NSString+numberOfOccurrances.h"

@interface OpenSamFilePlugin ()

- (id)initWithController:(CodaPlugInsController*)inController;

@end


@implementation OpenSamFilePlugin

//2.0 and lower
- (id)initWithPlugInController:(CodaPlugInsController*)aController bundle:(NSBundle*)aBundle
{

    return [self initWithController:aController];
}


//2.0.1 and higher
- (id)initWithPlugInController:(CodaPlugInsController*)aController plugInBundle:(NSObject <CodaPlugInBundle> *)plugInBundle
{
    return [self initWithController:aController];
}


- (id)initWithController:(CodaPlugInsController*)inController
{
	if ( (self = [super init]) != nil )
	{
		controller = inController;
		[controller registerActionWithTitle:NSLocalizedString(@"Open Code Igniter File", @"Open Code Igniter File") underSubmenuWithTitle:nil target:self selector:@selector(openSam:) representedObject:self keyEquivalent:@"~@o" pluginName:@"Open Code Igniter File"];
	}
    
	return self;
}


- (NSString*)name
{
	return @"Open Code Igniter File";
}

-(NSString *)siteLocalPath
{
    CodaTextView* tv = [controller focusedTextView:self];
    return [tv siteLocalPath];
}

- (BOOL)openCodeIgniterFile:(CodeIgniterFile *)ciFile
{
    NSError *err;
    if (ciFile) {
        CodaTextView *newTextView = [controller openFileAtPath:ciFile.absolutePath error:&err];
        if(newTextView)
        {
            if (ciFile.functionName) {
                [self jumpToFirstOccurranceOfString:[@"function " stringByAppendingString:ciFile.functionName]  inCodeTextView:newTextView];
            }
            return YES;
        } else {

            NSLog(@"Error opening Code Igniter File: %@ - %@", ciFile.absolutePath, err.localizedDescription);
        }
    }
    return NO;
}

- (void)openSam:(id)sender
{
	CodaTextView* tv = [controller focusedTextView:self];

    if ( tv )
	{
		NSString* text = [tv currentLine];
		
		if ( text )
		{
			// Models
            
            CodeIgniterModel *cm = [CodeIgniterModel codeIgniterFileFromLine:text andSiteRoot:self.siteLocalPath];
            if ([self openCodeIgniterFile:cm])
                return;

            
            // Views
            CodeIgniterView *cv = [CodeIgniterView codeIgniterFileFromLine:text andSiteRoot:self.siteLocalPath];
            if ([self openCodeIgniterFile:cv])
                return;

            // Controllers
            CodeIgniterView *cc = [CodeIgniterController codeIgniterFileFromLine:text andSiteRoot:self.siteLocalPath];
            if ([self openCodeIgniterFile:cc])
                return;
            
		}
	}
}


-(NSUInteger)lineForString:(NSString *)searchString inCodeTextView:(CodaTextView *)ctv
{
    NSRange stringRange = [ctv.string rangeOfString:searchString options:NSCaseInsensitiveSearch];
    if (stringRange.location != NSNotFound) {
        NSString *stringUntilFunction = [ctv.string substringToIndex:stringRange.location];
        return [stringUntilFunction numberOfLines];
    }
    return NSNotFound;
}

-(void)jumpToFirstOccurranceOfString:(NSString *)searchString inCodeTextView:(CodaTextView *)ctv
{
    NSUInteger lineNumber = [self lineForString:searchString  inCodeTextView:ctv];
    if (lineNumber!=NSNotFound) {
        [ctv goToLine:lineNumber column:0];
    }
}



@end
