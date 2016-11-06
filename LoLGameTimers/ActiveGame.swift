//
//  ActiveGame.swift
//  LoLGameTimers
//
//  Created by Bob De Kort on 11/5/16.
//  Copyright © 2016 Bob De Kort. All rights reserved.
//

import Foundation

class ActiveGame{
    
    let gameId: Int
    let mapId: Int
    let gameMode: String
    let enemyTeam: [Participant]
    let friendlyTeam: [Participant]
    // let bannedChampions: String // [Champions]
    // let startTime: Int // in epoch milliseconds
    
    init(id: Int, mapId: Int, gameMode: String, enemyTeam: [Participant], friendlyTeam: [Participant]) {
        self.gameId = id
        self.mapId = mapId
        self.gameMode = gameMode
        self.enemyTeam = enemyTeam
        self.friendlyTeam = friendlyTeam
        // self.bannedChampions = bannedChampions
        // self.startTime = startTime
    }
    
    
}
