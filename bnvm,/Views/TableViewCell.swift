//
//  TableViewCell.swift
//  bnvm,
//
//  Created by MacBook Air on 02.09.2020.
//  Copyright © 2020 VardanMakhsudyan. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var realName: UILabel!
    @IBOutlet weak var realNumber: UILabel!
    @IBOutlet weak var realCountry: UILabel!
    @IBOutlet weak var realImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
