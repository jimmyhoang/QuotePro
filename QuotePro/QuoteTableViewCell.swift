//
//  QuoteTableViewCell.swift
//  QuotePro
//
//  Created by Jimmy Hoang on 2017-07-05.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

class QuoteTableViewCell: UITableViewCell {
    // MARK: Properties
    @IBOutlet weak var authorLabel: UITextField!
    @IBOutlet weak var quoteLabel: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
