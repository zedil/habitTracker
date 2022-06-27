//
//  MainTasksTBC.swift
//  habitTracker
//
//  Created by Dilara Şimşek on 24.06.2022.
//

import UIKit

class MainTasksTBC: UITableViewCell {
    
    @IBOutlet weak var mainTaskLbl: UILabel!
    
    
    override func layoutSubviews() {
//
//        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 7, bottom: 10, right: 7))
//
        contentView.backgroundColor = UIColor(named: "pink")!
        contentView.layer.cornerRadius = 20
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
