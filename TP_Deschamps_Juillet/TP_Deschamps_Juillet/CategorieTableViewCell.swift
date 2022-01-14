//
//  CategorieTableViewCell.swift
//  TP_Deschamps_Juillet
//
//  Created by Antonin Deschamps on 17/12/2021.
//

import UIKit

class CategorieTableViewCell: UITableViewCell {

    @IBOutlet weak var myCategorie: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
