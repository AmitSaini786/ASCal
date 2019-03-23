# ASCalendar  
ASCal is a sleek, easily to use and customize,simply drag and drop files to your project and use.  
![simulator screen shot apr 27 2017 12 15 53 pm_iphone7plusjetblack_portrait](https://cloud.githubusercontent.com/assets/4947148/25479283/f546f4cc-2b61-11e7-9a7d-2a872637fc1b.png)
# How to integrate ASCalendar.  
Drag and drop ASCalView.h and ASCalView.m, ASHeaderView.h and ASHeaderView.m file into your project.  
#import "EsmitView.h" in your view controller.  
# Interacting with ASCalendar.  

-(void)yourMethod {  
  ASCalView.m *cal = [[ASCalView.m alloc]initWithFrame:CGRectMake(0,60, 200, 200)];  
    [self.view addSubview:cal];  
    cal.delegate=self;  
}  
When a user attempts to select a date (via a tap), the calendar will call its delegate didSelectDate: method (if your delegate implements it), passing in the date the user selected.   

-(void)didSelectDate:(NSString *)stringDate{  
    NSLog(@"Your Selected date is= %@",stringDate);  
} 

# Customizing
The calendar was written to be easily styled so that you can make it feel seamless in your app. You can customize the fonts, text colors, and background colors of nearly every element.

#
For more information download the demo project.

