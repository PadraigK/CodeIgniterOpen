//
//  OpenSamFileTests.m
//  OpenSamFileTests
//
//  Created by Padraig O Cinneide on 15/07/2012.
//
//

#import "OpenSamFileTests.h"

@implementation OpenSamFileTests

- (void)setUp
{
   [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}
/*

-(void)testLineDetection
{
    NSString *file = @"dude\nhi\n\n\n\nfunction dude() \n\n";
    NSUInteger line = [plugin lineForFunctionNamed:@"dude" inString:file];
    
    STAssertTrue(line==5,@"incorrect line number %d returned", line);
}

-(void)testViewFinder1
{
    // Examples of Model usage
    
    NSString *test = @" $this->load->view(\"students/profile/course/edit_holidays\",$course_data);";
    
    NSString *viewName = [plugin viewPathFromTextLine:test];
    
    STAssertEqualObjects(@"students/profile/course/edit_holidays", viewName, @"modelName: %@ retrieved from %@", viewName, test);
    
}

-(void)testViewFinder2
{
    // Examples of Model usage
    
    NSString *test = @" $this->load->view(\"foot\",$this->headfoot);";
    
    NSString *viewName = [plugin viewPathFromTextLine:test];
    
    STAssertEqualObjects(@"foot", viewName, @"modelName: %@ retrieved from %@", viewName, test);
    
}


-(void)testViewFinder3
{
    // Examples of Model usage
    
    NSString *test = @" $this->load->view('foot',$this->headfoot);";
    
    NSString *viewName = [plugin viewPathFromTextLine:test];
    
    STAssertEqualObjects(@"foot", viewName, @"modelName: %@ retrieved from %@", viewName, test);
    
}


-(void)testViewFinder4
{
    // Examples of Model usage
    
    
    NSString *test = @" $this->load->view(\"students/profile/course/edit_holidays\");";
    
    NSString *viewName = [plugin viewPathFromTextLine:test];
    
    STAssertEqualObjects(@"students/profile/course/edit_holidays", viewName, @"modelName: %@ retrieved from %@", viewName, test);
    
}

-(void)testActionPathFinder1
{
    NSString *test = @" $	<form action=\"/academic/documents/print_certificates\" method=\"post\" class=\"letter\">";
    
    NSString *viewName = [plugin actionPathFromTextLine:test];
    
    STAssertEqualObjects(@"/academic/documents/print_certificates", viewName, @"ControllerName: %@ retrieved from %@", viewName, test);
}

-(void)testControllerPathFinder
{
    NSString *test = @" $	<form action=\"/academic/documents/print_certificates\" method=\"post\" class=\"letter\">";
    
    NSString *viewName = [plugin filePathForControllerPath:[plugin actionPathFromTextLine:test]];
    
    STAssertEqualObjects([[plugin pathToSamControllers] stringByAppendingPathComponent:@"/academic/documents.php"], viewName, @"ControllerName: %@ retrieved from %@", viewName, test);
}


*/

@end
