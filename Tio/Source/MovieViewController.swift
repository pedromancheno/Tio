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
        
        networkControler.topMovie { (success, jsonData, error) -> Void in
            if (success) {
                let movie = Movie(jsonData: jsonData!)
            } else {
                // report error
            }
        }
    }
    
    
}
