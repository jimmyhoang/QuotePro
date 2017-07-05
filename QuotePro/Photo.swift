//
//  Photo.swift
//  QuotePro
//
//  Created by Jimmy Hoang on 2017-07-05.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import Foundation
import UIKit
import Nuke

class Photo {
    var image:Result<UIImage>!
    
    func getImage() {
        Cache.shared.removeAll()
        let url = URL(string: "https://lorempixel.com/300/300/")!
        
        Manager.shared.loadImage(with: url, completion: { (result) in
            self.image = result
        })
        
    }
    
}
