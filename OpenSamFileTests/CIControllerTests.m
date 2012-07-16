//
//  CIControllerTests.m
//  OpenSamFile
//
//  Created by Padraig O Cinneide on 15/07/2012.
//
//

#import "CIControllerTests.h"

@implementation CIControllerTests

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


-(void)testActionPathFinder1
{
    NSString *testLine = @" $	<form action=\"/academic/documents/print_certificates\" method=\"post\" class=\"letter\">";
    
    CodeIgniterController *cm = [CodeIgniterController codeIgniterFileFromLine:testLine andSiteRoot:siteRoot];
    
    STAssertEqualObjects(@"/academic/documents", cm.filePath, @"ControllerName: %@ retrieved from %@", cm.filePath, testLine);
}

-(void)testControllerFunctionPathFinder
{
    NSString *testLine = @" $	<form action=\"/academic/documents/print_certificates\" method=\"post\" class=\"letter\">";
    
    CodeIgniterController *cm = [CodeIgniterController codeIgniterFileFromLine:testLine andSiteRoot:siteRoot];
    
    STAssertEqualObjects(@"print_certificates", cm.functionName, @"ControllerName: %@ retrieved from %@", cm.functionName, testLine);
}

-(void)testControllerFunctionPathFinder1
{
    NSString *testLine = @" $	<form action=\"/academic/documents/\" method=\"post\" class=\"letter\">";
    
    CodeIgniterController *cm = [CodeIgniterController codeIgniterFileFromLine:testLine andSiteRoot:siteRoot];
    STAssertEqualObjects(@"/academic/documents/", cm.filePath, @"ControllerName: %@ retrieved from %@", cm.filePath, testLine);
    STAssertEqualObjects(nil, cm.functionName, @"ControllerName: %@ retrieved from %@", cm.functionName, testLine);
}


-(void)testControllerFunctionPathFinder2
{
    NSString *testLine = @"  redirect('/academic/reports/starting/for_week/').$date->format()";
    
    CodeIgniterController *cm = [CodeIgniterController codeIgniterFileFromLine:testLine andSiteRoot:siteRoot];
    STAssertEqualObjects(@"/academic/reports", cm.filePath, @"ControllerName: %@ retrieved from %@", cm.filePath, testLine);
    STAssertEqualObjects(@"starting", cm.functionName, @"ControllerName: %@ retrieved from %@", cm.functionName, testLine);
}



@end
