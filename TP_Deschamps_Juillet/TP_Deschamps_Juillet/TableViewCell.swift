//
//  TableViewCell.swift
//  TP_Deschamps_Juillet
//
//  Created by Antonin Deschamps on 09/12/2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var myName: UILabel!
    
    @IBOutlet weak var myDelete: UIButton!
    @IBOutlet weak var myEtat: UISwitch!
    @IBOutlet weak var myDate: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
