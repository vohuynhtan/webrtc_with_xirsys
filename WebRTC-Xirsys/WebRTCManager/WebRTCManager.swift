//
//  WebRTCManager.swift
//  WebRTC-Xirsys
//
//  Created by Tan Vo on 8/2/16.
//  Copyright © 2016 Tan Vo. All rights reserved.
//

import UIKit
import XirSys

class WebRTCManager: NSObject, RTCPeerConnectionDelegate {

    var iceServerArray = Array<RTCICEServer>()
    var peerConnection:RTCPeerConnection?
    var peerConnectionFactory:RTCPeerConnectionFactory
    

    override init() {
        
        peerConnectionFactory = RTCPeerConnectionFactory()
        
    }
    
    func createPeerConnectionWithIceServers(iceServers:Array<RTCICEServer>){
        self.peerConnection = peerConnectionFactory.peerConnectionWithICEServers(iceServers, constraints: self.streamSDPConstraints(), delegate: self)
        
        let lms = peerConnectionFactory
        
        let audioTrack = peerConnectionFactory.audioTrackWithID("ARDAMSa0")
    }
    
    func streamSDPConstraints() -> RTCMediaConstraints{
        let mandatory = [RTCPair(key: "OfferToReceiveAudio", value: "true"), RTCPair(key: "OfferToReceiveVideo", value: "true")]
        let optional = [RTCPair(key: "internalSctpDataChannels", value: "true"), RTCPair(key: "DtlsSrtpKeyAgreement", value: "true")]
        
        return RTCMediaConstraints(mandatoryConstraints: mandatory, optionalConstraints: optional)
    }
    
    // MARK:
    // MARK: RTCPeerConnectionDelegate
    func peerConnection(peerConnection: RTCPeerConnection!, signalingStateChanged stateChanged: RTCSignalingState) {
        print("PC0 signalingStateChanged: %d", stateChanged)
    }
    
    func peerConnectionOnRenegotiationNeeded(peerConnection: RTCPeerConnection!) {
        
    }
    
    func peerConnection(peerConnection: RTCPeerConnection!, iceGatheringChanged newState: RTCICEGatheringState) {
        
    }
    
    func peerConnection(peerConnection: RTCPeerConnection!, iceConnectionChanged newState: RTCICEConnectionState) {
        
    }

}
