//
//  Reachability.h
//  WalinnsAnalytics
//
//  Created by Walinns Innovation on 09/02/18.
//  Copyright © 2018 Walinns Innovation. All rights reserved.
//

#ifndef Reachability_h
#define Reachability_h


#endif /* Reachability_h */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <netinet/in.h>


typedef enum : NSInteger {
    NotReachable = 0,
    ReachableViaWiFi,
    ReachableViaWWAN
} NetworkStatus;

#pragma mark IPv6 Support
//Reachability fully support IPv6.  For full details, see ReadMe.md.


extern NSString *kReachabilityChangedNotification;


@interface Reachability : NSObject
    
    /*!
     * Use to check the reachability of a given host name.
     */
+ (instancetype)reachabilityWithHostName:(NSString *)hostName;
    
    /*!
     * Use to check the reachability of a given IP address.
     */
+ (instancetype)reachabilityWithAddress:(const struct sockaddr *)hostAddress;
    
    /*!
     * Checks whether the default route is available. Should be used by applications that do not connect to a particular host.
     */
+ (instancetype)reachabilityForInternetConnection;
    
    
#pragma mark reachabilityForLocalWiFi
    //reachabilityForLocalWiFi has been removed from the sample.  See ReadMe.md for more information.
    //+ (instancetype)reachabilityForLocalWiFi;
    
    /*!
     * Start listening for reachability notifications on the current run loop.
     */
- (BOOL)startNotifier;
- (void)stopNotifier;
    
- (NetworkStatus)currentReachabilityStatus;
    
    /*!
     * WWAN may be available, but not active until a connection has been established. WiFi may require a connection for VPN on Demand.
     */
- (BOOL)connectionRequired;
    
    @end
