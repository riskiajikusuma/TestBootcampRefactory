//
//  ToDoList.swift
//  ToDoApps
//
//  Created by riski aji kusuma on 18/12/21.
//

import UIKit

class ToDoList: UITableViewCell {

    @IBOutlet weak var taskColor: UIView!
    @IBOutlet weak var taskLabel: UILabel!
    
    @IBOutlet weak var completeColor: UIView!
    @IBOutlet weak var completeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        taskColor.layer.cornerRadius = taskColor.frame.size.height / 5
        completeColor.layer.cornerRadius = completeColor.frame.size.height / 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
