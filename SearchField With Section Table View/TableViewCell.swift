//
//  TableViewCell.swift
//  Search Field With Section Table View
//
//  Created by Nadia on 23/02/2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var studentName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
