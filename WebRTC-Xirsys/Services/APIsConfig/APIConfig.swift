//
//  APIConfig.swift
//  Vaster
//
//  Created by Toan on 7/1/16.
//  Copyright © 2016 Elisoft. All rights reserved.
//

import UIKit

class APIConfig: NSObject {

    static func ServerAPIsURL() -> String{
        return "https://ec2-52-90-97-61.compute-1.amazonaws.com:8443/vps-api/api/"
    }
    
    static func ServerXirSysURL() -> String{
        return "https://service.xirsys.com/"
    }
    
    static let XIRSYS_IDENT = "yuriy"
    static let XIRSYS_SECRET = "9ab90c63-e137-4f76-921a-841d22c5856c"
    static let XIRSYS_DOMAIN = "www.vastertest.com"
    static let XIRSYS_APPLICATION = "default"
    static let XIRSYS_ROOM = "default"
    
}
