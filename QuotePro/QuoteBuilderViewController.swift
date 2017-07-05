//
//  QuoteBuilderViewController.swift
//  QuotePro
//
//  Created by Jimmy Hoang on 2017-07-05.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

class QuoteBuilderViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var quoteTextView: UITextView!
    @IBOutlet weak var personTextView: UITextView!
    var quote = Quote()
    var photo = Photo()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
            self.imageView.image = self.photo.image?.value
        }
    }
    
    @IBAction func getQuote(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.quote.getQuote()
            self.quoteTextView.text  = self.quote.quoteText
            self.personTextView.text = self.quote.quoteAuthor
        }
    }
    
}
