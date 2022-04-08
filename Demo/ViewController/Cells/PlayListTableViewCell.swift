//
//  PlayListTableViewCell.swift
//  Demo
//
//  Created by Richa Mangukiya on 08/04/22.
//

import UIKit

class PlayListTableViewCell: UITableViewCell {

    //MARK: - Outelets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var outerView: UIView!
    
    //MARK: - Variables
    static let identifier = "PlayListTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageview.layer.cornerRadius = 7
        outerView.layer.cornerRadius = 7
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
