//
//  ViewController.swift
//  WebRTC-Xirsys
//
//  Created by Tan Vo on 8/1/16.
//  Copyright © 2016 Tan Vo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        APIManager.sharedInstance.getIceServers(onSuccess: { (serverArray) in
            print(serverArray[0].URL.absoluteString)
            }) { (error) in
                print("Error!!")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

