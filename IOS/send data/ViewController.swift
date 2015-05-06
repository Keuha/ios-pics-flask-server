//
//  ViewController.swift
//  send data
//
//  Created by Franck PETRIZ on 29/04/2015.
//  Copyright (c) 2015 Keuha. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AFNetworking

let URL_PATH : String = "http://localhost:5000"

class ViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    
    @IBOutlet var requestButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction
    func sendRequest(sender: AnyObject) {
    
    let manager = AFHTTPRequestOperationManager()
    var fileURL = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("deal_with_it", ofType: "jpg")!)
    var tmp = NSBundle.mainBundle().pathForResource("deal_with_it", ofType: "jpg")!
    var pics = NSData(contentsOfFile: tmp)
        
    manager.POST( "\(URL_PATH)/picture", parameters: nil,
        constructingBodyWithBlock: { (data: AFMultipartFormData!) in
                data.appendPartWithFileData(pics, name: "file",fileName: "deal_with_it.jpg", mimeType: "image/jpeg")
            },
        success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
            
            var json = JSON(responseObject)
            
            println("JSON: \(responseObject)")
            
            var id : String = json["name"].string!
            
            Alamofire.request(.GET, "\(URL_PATH)/get/picture/\(id)").response{(rep, req, data, err) in
            if (err == nil) {
                self.image.image = UIImage(data: data as! NSData)
            }
        }
        
    },
    failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
        println("Error: \(error.localizedDescription)")
    })
        
        
    }

}
