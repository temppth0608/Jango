//
//  JangoSayTableViewCell.swift
//  jango
//
//  Created by 장섭 심 on 2015. 12. 25..
//  Copyright © 2015년 hyunjeong,sanghyun. All rights reserved.
//

import UIKit

class JangoSayTableViewCell: UITableViewCell {
    
    @IBOutlet weak var jangoImageView: UIImageView!
    @IBOutlet weak var ballonImageView: UIImageView!
    @IBOutlet weak var jangoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
