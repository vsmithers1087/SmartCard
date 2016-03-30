//
//  CreateViewController.m
//  SmartCard
//
//  Created by Lauren Spatz on 3/22/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "CreateViewController.h"
#import "TemplateViewController.h"
#import "InfoViewController.h"
#import "TemplateAView.h"
#import "TemplateBView.h"
#import "TemplateCView.h"
#import "TemplateDView.h"
#import "TemplateEView.h"
#import "TemplateFView.h"
#import "TemplateGView.h"

@interface CreateViewController ()
- (IBAction)dismissButton:(id)sender;

- (IBAction)enterInfo:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *dismiss;
@end

@implementation CreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupButton];
    _isInfo = NO;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if (_isInfo == NO) {
        
        [self selectView:self.selectedIndex];
        _isInfo = YES;
    }
    InfoViewController *ivc = [[InfoViewController alloc]init];
   
    NSLog(@"completion::%@", ivc.completion);
    
//    NSLog(@"index %ld", (long)_selectedIndex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(void)setupButton
{
    self.dismiss.layer.cornerRadius = 20;
    self.dismiss.layer.borderColor = [UIColor whiteColor].CGColor;
    
}
-(void)selectView:(NSInteger)index{
    
    switch (index) {
        case 0:
            
           [TemplateAView setUpViewWithView:self.view website:@"www.yourName.com"];
            break;
        case 1:
            [TemplateBView setUpViewWithView:self.view name:@"Full Name" firstAddress:@"123 Street" secondaryAddress:@"City, State, 10292" email:@"yourName@email.com" phone:@"123 666-1234" website:@"www.company.com" jobTitle:@"Job Title" company:@"Company Name" logo:nil];
            break;
        case 2:
            [TemplateCView setUpViewWithView:self.view name:@"Full Name" firstAddress:@"123 Street" secondaryAddress:@"City, State 10292" email:@"fullName@email.com" phone:@"123 666-1234" website:@"www.company.com" jobTitle:@"Job Title" company:@"Company"];
            break;
        case 3:
            [TemplateDView setUpViewWithView:self.view name:@"Full Name" phone:@"123 666-1234" website:@"www.company.com" jobTitle:@"Job Title" company:@"Company" logo:nil];
            break;
        case 4:
            [TemplateEView setUpViewWithView:self.view name:@"Full Name" phone:@"123 666-1234" logo:nil];
            break;
        case 5:
            [TemplateFView setUpViewWithView:self.view name:@"Full Name" email:@"fullName@email.com" phone:@"123 666-1234" logo:nil];
            break;
        case 6:
            [TemplateGView setUpViewWithView:self.view name:@"Full Name" firstAddress:nil secondaryAddress:nil email:@"yourName@email.com" phone:@"123 666-1234"website:@"www.company.com" jobTitle:@"Job Title" company:@"Company" logo:nil];
            break;
            
        default:
            break;
    }
    
    _isInfo = NO;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"infoViewController"]) {
        
        InfoViewController *destinationViewController = segue.destinationViewController;
        
         __weak typeof(self)weak = self;
        
        destinationViewController.completion = ^(NSString *firstName, NSString* lastName, NSString* email, NSString*phone, NSString* website, NSString* firstAddress, NSString* secondaryAddress, UIImage* logoImage, NSString* companyName, NSString* postion){
            
            
            switch (weak.selectedIndex) {
                    
                case 0:
                    
                    [TemplateAView setUpViewWithView:weak.view website:website];
                    break;
                case 1:
                    [TemplateBView setUpViewWithView:weak.view name:[NSString stringWithFormat:@"%@ %@", firstName, lastName] firstAddress: firstAddress secondaryAddress:secondaryAddress email:email phone:phone website:website jobTitle:postion company:companyName logo:logoImage];
                    break;
                case 2:
                    [TemplateCView setUpViewWithView:self.view name:[NSString stringWithFormat:@"%@ %@", firstName, lastName] firstAddress:firstAddress secondaryAddress:secondaryAddress email:email phone:phone website:website jobTitle:postion company:companyName];
                    break;
                case 3:
                    [TemplateDView setUpViewWithView:self.view name:[NSString stringWithFormat:@"%@ %@", firstName, lastName] phone:phone website:website jobTitle:postion company:companyName logo:logoImage];
                    break;
                case 4:
                    [TemplateEView setUpViewWithView:self.view name:[NSString stringWithFormat:@"%@ %@", firstName, lastName] phone:phone logo:logoImage];
                    break;
                case 5:
                    [TemplateFView setUpViewWithView:self.view name:[NSString stringWithFormat:@"%@ %@", firstName, lastName] email:email phone:phone logo:logoImage];
                    break;
                case 6:
                    [TemplateGView setUpViewWithView:self.view name:[NSString stringWithFormat:@"%@ %@", firstName, lastName] firstAddress:firstAddress secondaryAddress:secondaryAddress email:email phone: phone website:website jobTitle:postion company:companyName logo:logoImage];
                    break;
                    
                default:
                    break;
            }

            
        };
        
    }
    
    
    
    
}

//-(UIImage*)takeScreenShot {
//    
//    _imageView.backgroundColor = [self random];
//    
//    UIGraphicsBeginImageContext(self.imageView.frame.size);
//    
//    [self.imageView.layer renderInContext:UIGraphicsGetCurrentContext()];
//    
//    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    
//    
//    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
//    //really at this point we can give the option to save to photos!
//    
//    [self saveToDesktopFolder:image];
//    
//    return image;
//}


- (IBAction)dismissButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)enterInfo:(UIButton *)sender {
}
@end
