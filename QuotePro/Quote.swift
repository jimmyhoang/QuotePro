//
//  Quote.swift
//  QuotePro
//
//  Created by Jimmy Hoang on 2017-07-05.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import Foundation
import UIKit

class Quote {
    var quoteText:String?
    var quoteAuthor:String?
    var photo:UIImage?
    
    func getQuote() {
        let url     = URL(string: "https://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")!
        let request = URLRequest(url: url)
        
        let task    = URLSession.shared.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            
            guard let data = data else {
                print("no data returned from server")
                return
            }
            
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as! Dictionary<String,String> else {
                print("data returned not json")
                return
            }
            
            self.quoteText   = json["quoteText"]
            self.quoteAuthor = json["quoteAuthor"]
            
            if self.quoteAuthor == nil {
                self.quoteAuthor = "Anonymous"
            }
            
        }
        
        task.resume()
        
        
    }
}
