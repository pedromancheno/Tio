//
//  MovieViewController.swift
//  Tio
//
//  Created by Pedro Mancheno on 08/02/16.
//  Copyright © 2016 Tio. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    let networkControler = NetworkController()
    
    override func viewWillAppear(animated: Bool) {
    
        super.viewWillAppear(animated)
        
        networkControler.topMovie { (callback: Dictionary<String, String>?) -> Void in
            
        }
    }
    
    
}
