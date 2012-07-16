//
//  CIViewTests.m
//  OpenSamFile
//
//  Created by Padraig O Cinneide on 15/07/2012.
//
//

#import "CIViewTests.h"
#import "CodeIgniterView.h"

@implementation CIViewTests

- (void)setUp
{
    siteRoot = @"/Volumes/Macintosh HD/padraig/Web/sam/trunk";
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}


-(void)testViewFinder1
{
    // Examples of Model usage
    NSString *testLine = @" $this->load->view(\"students/profile/course/edit_holidays\",$course_data);";
    CodeIgniterView *cm = [CodeIgniterView codeIgniterFileFromLine:testLine andSiteRoot:siteRoot];

    STAssertEqualObjects(@"students/profile/course/edit_holidays", cm.filePath, @"Name: %@ retrieved from %@", cm.filePath, testLine);
}

-(void)testViewFinder2
{
    // Examples of Model usage
    
    NSString *testLine = @" $this->load->view(\"foot\",$this->headfoot);";
    CodeIgniterView *cm = [CodeIgniterView codeIgniterFileFromLine:testLine andSiteRoot:siteRoot];
    
    STAssertEqualObjects(@"foot", cm.filePath, @"modelName: %@ retrieved from %@", cm.filePath, testLine);
    
}


-(void)testViewFinder3
{
    // Examples of Model usage
    
    NSString *testLine = @" $this->load->view('foot',$this->headfoot);";
    CodeIgniterView *cm = [CodeIgniterView codeIgniterFileFromLine:testLine andSiteRoot:siteRoot];
    
    STAssertEqualObjects(@"foot", cm.filePath, @"modelName: %@ retrieved from %@", cm.filePath, testLine);
    
}


-(void)testViewFinder4
{
    // Examples of Model usage
    
    NSString *testLine = @" $this->load->view(\"students/profile/course/edit_holidays\");";
    CodeIgniterView *cm = [CodeIgniterView codeIgniterFileFromLine:testLine andSiteRoot:siteRoot];
    
    STAssertEqualObjects(@"students/profile/course/edit_holidays", cm.filePath, @"modelName: %@ retrieved from %@", cm.filePath, testLine);
    
}


@end
