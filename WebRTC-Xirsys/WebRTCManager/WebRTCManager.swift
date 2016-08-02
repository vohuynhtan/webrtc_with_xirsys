//
//  WebRTCManager.swift
//  WebRTC-Xirsys
//
//  Created by Tan Vo on 8/2/16.
//  Copyright © 2016 Tan Vo. All rights reserved.
//

import UIKit

class WebRTCManager: NSObject {

    var iceServerArray = Array<RTCICEServer>()
    

    override init() {
        super.init()
        IceServerManager.getXirsysIceServer(sendIceServer: { (iceServers) in
            self.iceServerArray = iceServers
            
            
            }) { 
                print("Completed")
                
        }
    }
}
