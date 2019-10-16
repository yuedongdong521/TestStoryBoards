//
//  Player.swift
//  TestStoryBoards
//
//  Created by ydd on 2019/10/15.
//  Copyright © 2019 ydd. All rights reserved.
//

import Foundation

struct Player {
    var name: String?
    var game: String?
    // 星级
    var rating: Int
    
    init(Name name:String?, Game game:String?, Rating rating:Int) {
        self.name = name
        self.game = game
        self.rating = rating
    }
    
    
}
