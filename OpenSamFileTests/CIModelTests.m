//
//  CIModelTests.m
//  OpenSamFile
//
//  Created by Padraig O Cinneide on 15/07/2012.
//
//

#import "CIModelTests.h"

@implementation CIModelTests

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


-(void)testModelName1
{
    
    NSString *testLine = @"  $this->load->model(\"Student_model\")";

    CodeIgniterModel *cm = [CodeIgniterModel codeIgniterFileFromLine:testLine andSiteRoot:siteRoot];
    
    STAssertEqualObjects(@"student_model", cm.filePath, @"modelName: %@ retrieved from %@", cm.filePath, testLine);
}

-(void)testModelName2
{
    
    NSString *testLine =  @"  $this->load->model('Student_model')";
    
    CodeIgniterModel *cm = [CodeIgniterModel codeIgniterFileFromLine:testLine andSiteRoot:siteRoot];
    
    STAssertEqualObjects(@"student_model", cm.filePath, @"modelName: %@ retrieved from %@", cm.filePath, testLine);
}

-(void)testModelName3
{
    
    NSString *testLine =  @"  $this->load->model('Student_model')->douchebag();";
    
    CodeIgniterModel *cm = [CodeIgniterModel codeIgniterFileFromLine:testLine andSiteRoot:siteRoot];
    
    STAssertEqualObjects(@"student_model", cm.filePath, @"modelName: %@ retrieved from %@", cm.filePath, testLine);
}


    
-(void)testModelFunctionName1
{
    NSString *testLine =  @"  $this->load->model('Student_model')->douchebag();";
    
    CodeIgniterModel *cm = [CodeIgniterModel codeIgniterFileFromLine:testLine andSiteRoot:siteRoot];
    
    STAssertEqualObjects(@"douchebag", cm.functionName, @"functionName: %@ retrieved from %@", cm.functionName, testLine);
}

-(void)testModelFunctionNameIsNil
{
    NSString *testLine =  @"  $this->load->model('Student_model')";
    
    CodeIgniterModel *cm = [CodeIgniterModel codeIgniterFileFromLine:testLine andSiteRoot:siteRoot];
    
    STAssertEqualObjects(nil, cm.functionName, @"functionName: %@ retrieved from %@", cm.functionName, testLine);
}

@end
