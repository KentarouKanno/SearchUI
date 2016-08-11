//
//  APIManager.swift
//  SearchUI
//
//  Created by DIP on 2016/08/10.
//  Copyright © 2016年 Kentarou. All rights reserved.
//

import Foundation


class APIManager {
    
    class func downLoadDataAPI(downLoadTask: (dataModelArray: Array<DataModel>?) -> () ) {
        
        // BundleのJSONからデータを取得する場合
        // return downLoadTask(dataModelArray: readJSONDataFromBundle())
        
        
        let url = NSURL(string: "http://www.kentar0u.sakura.ne.jp/Data.json")
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration(), delegate: nil, delegateQueue: NSOperationQueue.mainQueue())
        let req = NSURLRequest(URL: url!)
        
        let task = session.dataTaskWithRequest(req, completionHandler: { (data, response, error) in
            
            if let data = data {
                // Success
                
                let searchData = (try? NSJSONSerialization.JSONObjectWithData(data, options: [])) as! NSDictionary
                
                let arrayData = searchData["data"] as! [NSDictionary]
                var retArray: Array<DataModel> = []
                
                for value in arrayData {
                    retArray.append(DataModel(dict: value))
                }
                downLoadTask(dataModelArray: retArray)
                
            } else {
                // Error
                print("Error!")
                downLoadTask(dataModelArray: nil)
            }
        })
        task.resume()
    }
    
    class func readJSONDataFromBundle() -> Array<DataModel>? {
        guard
            let url = NSBundle.mainBundle().URLForResource("Data", withExtension: "json"),
            let data = NSData(contentsOfURL: url),
            let searchData = (try? NSJSONSerialization.JSONObjectWithData(data, options: [])) as? NSDictionary
            else {
                return nil
        }
        
        let arrayData = searchData["data"] as! [NSDictionary]
        var retArray: Array<DataModel> = []
        
        for value in arrayData {
            retArray.append(DataModel(dict: value))
        }
        return retArray
    }
}