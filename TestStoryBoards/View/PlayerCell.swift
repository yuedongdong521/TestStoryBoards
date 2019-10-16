//
//  PlayerCell.swift
//  TestStoryBoards
//
//  Created by ydd on 2019/10/15.
//  Copyright © 2019 ydd. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
   
    @IBOutlet weak var gameLabel: UILabel!
    
    @IBOutlet weak var xingjiLabel: UILabel!
    
    
    var player: Player! {
        didSet {
            nameLabel.text = player.name
            gameLabel.text = player.game
            xingjiLabel.text = self.ratingStr(rating: player.rating)
        }
    }
    
    func ratingStr(rating:Int) -> String {
        var str :String = ""
        for _ in 0..<rating {
            str += "✨"
        }
        return str
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
