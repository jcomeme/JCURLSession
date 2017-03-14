//
//  SampleViewController.swift
//
//  Created by JCOmeme on 2017/03/09.
//  Copyright © 2017 JCOmeme. All rights reserved.
//

import Foundation
import UIKit

class SampleViewController: UIViewController, JCURLSessionDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jcsession = JCURLSession(delegate: self)
        jcsession.cURL("https://example.com/index.html")
        //jcsession.wget("https://example.com/example.jpg")

    }
    
    
    
    func didReceiveDataAsString(_ string: String) {
        print(string)
    }
    
    func didReceiveError(_ error: String){
        print(error)
    }
    
    func didReceiveData(_ data: Data) {
        /*
        if let img = UIImage(data:data){
            imageView.image = img
        }else{
            print("This is not picture")
        }
        */
    }
    
    func downloadProgress(_ progress: (Int64, Int64)) {
        print("Download progress is \(progress.0)/\(progress.1)")
    }
    
}
