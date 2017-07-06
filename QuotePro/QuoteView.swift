//
//  QuoteView.swift
//  QuotePro
//
//  Created by Jimmy Hoang on 2017-07-05.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

class QuoteView: UIView {
    
    // MARK: Properties
    @IBOutlet weak var quoteTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var authorTextView: UITextView!
    
    func setupWithQuote(quote:Quote) {
        quoteTextView.text  = quote.quoteText
        authorTextView.text = quote.quoteAuthor
        imageView.image     = quote.photo
    }

}
