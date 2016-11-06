//
//  CurrentPlayer.swift
//  LoLGameTimers
//
//  Created by Bob De Kort on 11/5/16.
//  Copyright © 2016 Bob De Kort. All rights reserved.
//

import Foundation

class CurrentPlayer {
    let summonerId: Int
    let summonerName: String
    let summonerLevel: Int
    let region: Regions?
    
    init(id: Int, name: String, level: Int, region: Regions?) {
        self.summonerId = id
        self.summonerName = name
        self.summonerLevel = level
        self.region = region
    }
}
