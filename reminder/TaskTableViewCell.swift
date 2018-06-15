//
//  TaskTableViewCell.swift
//  reminder
//
//  Created by NagaiNaoki on 2018/06/15.
//  Copyright © 2018年 nmr. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    static let reuseIdentifier = "TaskCell"
    
    // MARK: -
    
    @IBOutlet var taskLabel: UILabel!
    
    // MARK: - Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
