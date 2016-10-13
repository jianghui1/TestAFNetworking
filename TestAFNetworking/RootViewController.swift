//
//  RootViewController.swift
//  TestAFNetworking
//
//  Created by ys on 15/12/22.
//  Copyright © 2015年 ys. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.redColor()
        // 开始网络请求
        let manager = AFHTTPRequestOperationManager()
        manager.responseSerializer = AFHTTPResponseSerializer()
        manager.GET("http://m2.qiushibaike.com/article/list/text?count=30&page=1" as String, parameters: nil, success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            let dic: NSDictionary = try! NSJSONSerialization.JSONObjectWithData(response as! NSData, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
            print("\(dic)")
            }) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                print("error == \(error)\n")
        }
    }

}
