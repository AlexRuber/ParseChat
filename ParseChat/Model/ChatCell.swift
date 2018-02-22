//
//  ChatCell.swift
//  ParseChat
//
//  Created by Mihai Ruber on 2/21/18.
//  Copyright © 2018 Mihai Ruber. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {
    
    // Variables
    
    
    // Outlets
    @IBOutlet weak var textLbl: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
