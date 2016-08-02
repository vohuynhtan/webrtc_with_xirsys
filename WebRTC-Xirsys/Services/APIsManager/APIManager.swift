//
//  APIManager.swift
//  Vaster
//
//  Created by Toan on 7/1/16.
//  Copyright © 2016 Elisoft. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper
import XirSys

class APIManager: GenericAPI {
    
    // MARK: - Singleton
    //
    // Access the singleton instance
    //
    class var sharedInstance: APIManager {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: APIManager? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = APIManager()
        }
        return Static.instance!
    }
    
    let deviceType = UIDevice.currentDevice().userInterfaceIdiom == .Pad ? "iPad" : "iPhone"
    let deviceId = UIDevice.currentDevice().identifierForVendor!.UUIDString
    
    // MARK: - Verify Account
    /**
     Classic verify account
     @param country code and phone number
     @return VResponse
     */
//    func verifyAccount(countryCode contryCodeStr: String, phoneNumber phoneNumStr: String,
//                                   onSuccess success: ((responseObject: VResponse) -> Void)?,
//                                   onFailure failure: (HandlerOnFailure)?) -> Void {
//        let dic = [
//            "deviceId" : deviceId,
//            "deviceType" : deviceType,
//            "userType" : "Number",
//            "userId" : "\(contryCodeStr)\(phoneNumStr)"
//        ]
//        
//        manager.request(.POST, "\(APIConfig.ServerAPIsURL())user/verify", parameters: dic, encoding: .JSON, headers: headers).responseJSON { (response) -> Void in
//            
//            if response.result.isFailure{
//                failure?(error: response.result.error)
//            }else{
//                if let vResponse = Mapper<VResponse>().map(response.result.value){
//                    success?(responseObject: vResponse)
//                }
//            }
//        }
//    }
    
    // MARK: - Signup
    /**
     Classic SignUp
     @param userName and password
     @return VResponse
     */
//    func signupWith(userName userNameStr: String, activationCode code: String,
//                             userId idStr: String,
//                             onSuccess success: ((responseObject: VResponse) -> Void)?,
//                             onFailure failure: (HandlerOnFailure)?) -> Void {
//        let dic = [
//            "activationCode" : code,
//            "deviceId" : deviceId,
//            "deviceType" : deviceType,
//            "userId" : idStr,
//            "userName" : userNameStr,
//            "userType" : "Number"
//        ]
//        
//        manager.request(.POST, "\(APIConfig.ServerAPIsURL())user/signup", parameters: dic, encoding: .JSON, headers: headers).responseJSON { (response) -> Void in
//            
//            if response.result.isFailure{
//                failure?(error: response.result.error)
//            }else{
//                if let vResponse = Mapper<VResponse>().map(response.result.value){
//                    vResponse.data = NSString(string: "\(response.result.value!.objectForKey(result)!.objectForKey(resultData)!)") as String
//                    success?(responseObject: vResponse)
//                }
//            }
//        }
//    }
    
    func getIceServers(onSuccess success: ((serverArray: [XSServer]) -> Void)?,
                                 onFailure failure: (HandlerOnFailure)?) -> Void {
        
        let dic : [String : AnyObject] = [
            "ident" : APIConfig.XIRSYS_IDENT,
            "secret" : APIConfig.XIRSYS_SECRET,
            "domain" : APIConfig.XIRSYS_DOMAIN,
            "application" : APIConfig.XIRSYS_APPLICATION,
            "room" : APIConfig.XIRSYS_ROOM,
            "secure" : 0
        ]
        
        manager.request(.POST, "\(APIConfig.ServerXirSysURL())ice", parameters: dic, encoding: .JSON, headers: nil).responseJSON { (response) in
            if response.result.isFailure{
                failure?(error: response.result.error)
            }else{
                if let servers = response.result.value?.objectForKey("d")!.objectForKey("iceServers"){
                    var tempArray = [XSServer]()
                    for serverJSON in servers as! NSArray{
                        let server = XSServer(JSON: serverJSON as! [NSObject : AnyObject])
                        tempArray.append(server)
                    }
                    
                    success?(serverArray: tempArray)
                }
            }
        }
    }

    
}
