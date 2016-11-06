//
//  Participants.swift
//  LoLGameTimers
//
//  Created by Bob De Kort on 11/5/16.
//  Copyright © 2016 Bob De Kort. All rights reserved.
//

import Foundation

class Participant{
    let teamId: Int
    let spell1Id: Int
    let spell2Id: Int
    let championId: Int
    let summonerName: String
    let summonerId: Int
    let isBot: Bool
    
    init(teamId: Int, spell1Id: Int, spell2Id: Int, championId: Int, summonerName: String, summonerId: Int, isBot: Bool) {
        self.teamId = teamId
        self.spell1Id = spell1Id
        self.spell2Id = spell2Id
        self.championId = championId
        self.summonerName = summonerName
        self.summonerId = summonerId
        self.isBot = isBot
    }
}
