//
//  TableViewCellMenu.swift
//  CoMS
//
//  Created by iMac1 on 9/6/17.
//  Copyright © 2017 ComeForChange. All rights reserved.
//

import UIKit

class TableViewCellMenu: UITableViewCell {

    @IBOutlet weak var lblIcon: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
