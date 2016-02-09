//
//  NetworkController.swift
//  Tio
//
//  Created by Pedro Mancheno on 08/02/16.
//  Copyright © 2016 Tio. All rights reserved.
//

import Foundation

struct NetworkController {
    
    func httpGet(request: NSURLRequest!, callback: (success: Bool, jsonData: Dictionary<String, AnyObject>?, error: NSError?) -> Void) {
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request){
            (data, response, error) -> Void in
            if error != nil {
                callback(success: false, jsonData: nil, error: error)
            } else {
                do {
                    let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers ) as! Dictionary<String, AnyObject>
                    callback(success: true, jsonData: jsonData, error: nil)
                } catch {
                    callback(success: false, jsonData: nil, error: nil)
                }
            }
        }
        task.resume()
    }
    
    
    func topMovie(callback: (success: Bool, jsonData: Dictionary<String, AnyObject>?, error: NSError?) -> Void) {
        let url: NSURL = NSURL(string: "https://api.themoviedb.org/3/movie/550?api_key=01dd8815c3b2f00ec64400e77e5b47b5")!
        let request: NSURLRequest = NSURLRequest(URL: url)
        httpGet(request) { (success, jsonData, error) -> Void in
            callback(success: success, jsonData: jsonData, error: error)
        }
    }
}