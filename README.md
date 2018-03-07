[![Walinns Logo](https://walinns.com/wp-content/uploads/2018/02/walinns.png)](https:walinns.com)


Walinns Android SDK  

Real-time Mobile Analytics Platform. Walinns helps the app marketers to analyze and measure how users are using your mobile apps. 

## Features of Walinns Analytics 

1. User Enagement 
2. Conversion Funnels
3. User Behavioral Segments
4. Customer Retention
5. Push Notifications


For more information check out our [website](https://walinns.com "Walinns") and [documentation](http://walinns.com/docs.html "Walinns Technical Documentation").

## Getting Started

1. Sign Up

    [Sign up](https://walinns.com/signup) for a free account.  
    
2.  Install the SDK using CocoPods
    
    add the following to your podfile. 
    
    ## Objective C    

        target 'YOUR_TARGET_NAME' do  
           pod 'WalinnsAPI'  
        end     
        
    ## Swift

        target 'YOUR_TARGET_NAME' do  
           pod 'WalinnsAPI-Swift'
        end 
        
    Then run pod install
  
  3. Adding the following to your Info.plist
 
     * Open the info.plist file
     * Add the Key called App Transport Security Settings as Dictionary (Dictionary should be the default type)
     * Add the Subkey called Allow Arbitrary Loads as Boolean (Boolean should be the default type). Set it to YES
     
        ==add the plist image
 
      
    
    
  4. Initialize the Walinns SDK 
  
In the viewDidLoad() of your main ViewController, add the below code snippet and replace your "PROJECT_TOKEN" with your token created in step 1.
  
   ## Objective C 
   
    #import <WalinnsAPI/WalinnsAPI.h>
    
    [[WalinnsApi instance]initializeToken:@"PROJECT_TOKEN"];
    
  ## Swift
  
    import "WalinnsAPI_Swift"
    
    WalinnsApi.initialize(project_token:"PROJECT_TOKEN")
    
   Build and run the Project.
          
  5. Documentation 
   
   Please see our [full documentation here](https://walinns.com/docs.html) for more information how to track sessions, screen name and events. 
   
   ## Example Usage
Checkout the example StarterProject.
