//
//  ViewController.swift
//  QuotePro
//
//  Created by Jimmy Hoang on 2017-07-05.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, QuoteBuilderDelegate {
    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    var quotes:[Quote] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: UITableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell") as! QuoteTableViewCell
        let item = quotes[indexPath.row]
        
        cell.authorLabel.text = item.quoteAuthor
        cell.quoteLabel.text  = item.quoteText
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var quoteView: QuoteView!
        
        if let objects = Bundle.main.loadNibNamed("QuoteXib", owner: nil, options: [:]) {
            quoteView = objects.first as! QuoteView
            quoteView.setupWithQuote(quote: quotes[indexPath.row])
        }

        UIGraphicsBeginImageContextWithOptions(quoteView.bounds.size, true, 0)
        quoteView.drawHierarchy(in: quoteView.bounds, afterScreenUpdates: true)
        guard let screenShot = UIGraphicsGetImageFromCurrentImageContext() else {
            return
        }
        UIGraphicsEndImageContext()
        
        let activityVC = UIActivityViewController(activityItems: [screenShot], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
    
    // MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addQuote" {
            let destinationNVC      = segue.destination as! UINavigationController
            let destinationVC       = destinationNVC.topViewController as! QuoteBuilderViewController
            destinationVC.delegate  = self
        }
    }
    
    // MARK: QuoteBuilderVC
    func userDidSaveQuote(quote: Quote) {
        self.quotes.append(quote)
        self.tableView.reloadData()
        
    }


}

