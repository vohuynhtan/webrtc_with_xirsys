//
//  IceServerManager.swift
//  WebRTC-Xirsys
//
//  Created by Tan Vo on 8/1/16.
//  Copyright © 2016 Tan Vo. All rights reserved.
//

import UIKit
import Alamofire

let STUN_ICE_SERVICES = ["stun:stun.l.google.com:19302", "stun:23.21.150.121", "stun:stun.l.google.com:19302", "stun:stun1.l.google.com:19302", "stun:stun2.l.google.com:19302", "stun:stun3.l.google.com:19302", "stun:stun4.l.google.com:19302", "stun:stun.ekiga.net", "stun:stun.ideasip.com", "stun:stun.rixtelecom.se", "stun:stun.schlund.de", "stun:stun.stunprotocol.org:3478", "stun:stun.voiparound.com",
    "stun:stun.voipbuster.com", "stun:stun.voipstunt.com", "stun:stun.voxgratia.org"]

class IceServerManager: NSObject {
    
    class func getXirsysIceServer(sendIceServer callback:(iceServers:Array<RTCICEServer>)->(),completed complection:()->()){
        
        let parameter = ["ident":"yuriy", "secret":"9ab90c63-e137-4f76-921a-841d22c5856c", "domain":"www.vastertest.com", "application":"default", "room":"default"]
        Alamofire.request(.POST, "https://api.xirsys.com/getIceServers", parameters: parameter).responseJSON { (response) in
            let array = response.result.value!["d"]!!["iceServers"] as! Array<AnyObject>
            
            var iceServers = Array<RTCICEServer>()
            for item in array{
                if let url = item["url"] as? String{
                    guard let username = item["username"] as? String else{
                        iceServers.append(RTCICEServer(URI: NSURL(string: url), username: "", password: ""))
                        continue
                    }
                    guard let credential = item["credential"] as? String else{ continue }
                    iceServers.append(RTCICEServer(URI: NSURL(string: url), username: username, password: credential))
                }
            }
            callback(iceServers: iceServers)
            complection()
        }
    }

}
