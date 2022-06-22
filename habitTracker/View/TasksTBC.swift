//
//  TasksTBC.swift
//  habitTracker
//
//  Created by Dilara Şimşek on 22.06.2022.
//

import UIKit

class TasksTBC: UITableViewCell {
    
    @IBOutlet weak var taskImgView: UIImageView!
    
    @IBOutlet weak var taskLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
         super.layoutSubviews()
         let bottomSpace: CGFloat = 15.0 // Let's assume the space you want is 10
         self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: bottomSpace, right: 0))
        
        
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
