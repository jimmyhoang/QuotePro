//
//  QuoteBuilderViewController.swift
//  QuotePro
//
//  Created by Jimmy Hoang on 2017-07-05.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit
protocol QuoteBuilderDelegate:class {
    func userDidSaveQuote(quote:Quote)
}

class QuoteBuilderViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var quoteTextView: UITextView!
    @IBOutlet weak var personTextView: UITextView!
    @IBOutlet weak var baseView: UIView!
    weak var delegate:QuoteBuilderDelegate?
    var quote = Quote()
    var photo = Photo()
    var quoteView = QuoteView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let objects = Bundle.main.loadNibNamed("QuoteXib", owner: nil, options: [:]) {
            quoteView               = objects.first as! QuoteView
            quoteView.bounds        = baseView.bounds
            quoteView.clipsToBounds = true
            baseView.addSubview(quoteView)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: Button Actions
    @IBAction func getImage(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.photo.getImage()
            self.quoteView.imageView.image = self.photo.image?.value
        }
    }
    
    @IBAction func getQuote(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.quote.getQuote()
            self.quoteView.quoteTextView.text  = self.quote.quoteText
            self.quoteView.authorTextView.text = self.quote.quoteAuthor
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
        quote.photo = quoteView.imageView.image
        delegate?.userDidSaveQuote(quote: quote)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
