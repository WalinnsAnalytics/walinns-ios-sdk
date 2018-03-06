//
//  WalinnsApi.swift
//  WalinnsAPI
//
//  Created by Walinns Innovation on 23/02/18.
//  Copyright © 2018 Walinns Innovation. All rights reserved.
//

import Foundation
import UIKit
import CoreData

public class WalinnsApi : NSObject {
    
    //sharedInstance
    static let sharedInstance = WalinnsApi()
 
    public var start_time = WAUtils.init().getCurrentUtc()
    public var end_time = "na"
    public var pushToken = "na"
    public var profile : NSMutableDictionary? = nil
    public var exception_ : String = "na"
    
    public static func initialize(project_token : String)  {
        WAUtils.init().save_pref(key: "token", value:project_token)
        NSSetUncaughtExceptionHandler { exception in
            print("EXCEPTION CAUGHT HERE....")
            //  CrashStatus(crash_reason: String(describing: exception))
        }
        sharedInstance.start()
        print("WlinnsTrackerClient" + project_token , self)
        NotificationCenter.default.addObserver(WalinnsApi.sharedInstance, selector: #selector(sharedInstance.appMovedToBackground), name: Notification.Name.UIApplicationWillResignActive, object: nil)
        WAApiclient.init(token: project_token)
        
    }
    
    @objc func appMovedToBackground(){
        DispatchQueue.global(qos: .background).async {
            
            DispatchQueue.main.async {
                self.end_time = WAUtils.init().getCurrentUtc()
                print("WalinnsTrackerClient end time!" , self.end_time )
                if(WAUtils.init().read_pref(key: "token") != nil ){
                    WAApiclient.init(token: WAUtils.init().read_pref(key: "token")).sessionTrack(start_timee : self.start_time ,end_time: self.end_time)
                    WAApiclient.init(token: WAUtils.init().read_pref(key: "token")).appUserStatus(app_status: "no")
                    WAApiclient.init(token: WAUtils.init().read_pref(key: "token")).appUninstallCount(pushToken: self.pushToken)
                }
            }
        }
    }
    
    
    public func start()  {
        
        DispatchQueue.global(qos: .background).async {
            print("This is run on the background queue")
            
            DispatchQueue.main.async {
                print("WalinnsTrackerClient start time" , WalinnsApi.sharedInstance.profile)
                let dummy : NSMutableDictionary = NSMutableDictionary()
                dummy.setValue(nil, forKey: "email")
                if(WAUtils.init().read_pref(key: "token") != nil ){
                    if(WalinnsApi.sharedInstance.profile != nil ){
                        WAApiclient.init(token: WAUtils.init().read_pref(key: "token")).DeviceReq(jsonobject: WalinnsApi.sharedInstance.profile!)
                    }else{
                        WAApiclient.init(token: WAUtils.init().read_pref(key: "token")).DeviceReq(jsonobject: dummy)
                    }
                }
                
            }
        }
        
        
    }
    public static func track(event_type : String,event_name : String){
        print("event_data_token:" , WAUtils.init().read_pref(key: "token"))
        if (WAUtils.init().read_pref(key: "device_status") != nil){
            WAApiclient.init(token: WAUtils.init().read_pref(key: "token")).eventTrack(event_type : event_type ,event_name: event_name )
        }
        
    }
    
    public static func track(screen_name : String){
        
        if (WAUtils.init().read_pref(key: "device_status") != nil){
            WAApiclient.init(token: WAUtils.init().read_pref(key: "token")).screenTrack(screen_name : screen_name)
        }
        
    }
    public static func sendPushToken(push_token : String){
        if(push_token != nil){
            print("send push token :" , push_token , ".......", WAUtils.init().read_pref(key: "token"))
            WalinnsApi.sharedInstance.pushToken = push_token
        }
    }
    public static func sendProfile(user_profile : NSDictionary){
        print("Json object for userprofile ", user_profile)
        WalinnsApi.sharedInstance.profile = user_profile as! NSMutableDictionary
        sharedInstance.start()
    }
    
    public static func CrashStatus(crash_reason : String){
        
        WAApiclient.init(token: WAUtils.init().read_pref(key: "token")).crashStatus(crash_reason: crash_reason)
    }
    
}

