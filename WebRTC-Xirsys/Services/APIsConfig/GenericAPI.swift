//
//  GenericAPI.swift
//  Vaster
//
//  Created by Toan on 7/1/16.
//  Copyright © 2016 Elisoft. All rights reserved.
//

import UIKit
import Alamofire

typealias HandlerOnSuccess = (responseObject: AnyObject?) -> Void
typealias HandlerOnFailure = (error: NSError?) -> Void

class GenericAPI: NSObject {

    let headers = [
        "Content-Type": "application/json; charset=utf-8",
        "Authorization" : "Basic \(("vclient:VastV1").toBase64())"
    ]
    
    let manager : Alamofire.Manager = {
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            "ec2-52-90-97-61.compute-1.amazonaws.com": .DisableEvaluation,
            "ec2-52-90-97-61.compute-1.amazonaws.com:8443": .DisableEvaluation
        ]
        
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.HTTPAdditionalHeaders = Alamofire.Manager.defaultHTTPHeaders
        
        return Alamofire.Manager(
            configuration: configuration,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
    }()
}
