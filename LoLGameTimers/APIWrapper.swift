//
//  APIWrapper.swift
//  LoLGameTimers
//
//  Created by Bob De Kort on 11/5/16.
//  Copyright © 2016 Bob De Kort. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIWrapper {

    var player: CurrentPlayer?
    let apiKey = "RGAPI-fa51998c-c77b-434a-af37-b7ba9301ca5d"
    
    
    func getSummoner(region: Regions, query: String, sender: ConnectViewController){
        let urlString = "https://\(region.rawValue).api.pvp.net/api/lol/\(region.rawValue)/v1.4/summoner/by-name/\(query)?api_key=\(apiKey)"
        let url = URL(string: urlString)
        let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            guard let data = data else {
                print("Data Error")
                return
            }
            
            let json = JSON(data: data)
            print(json)
            let jsonQ = json[query]
            if let id = jsonQ["id"].int{
                if let name = jsonQ["name"].string {
                    if let level = jsonQ["summonerLevel"].int {
                        self.player = CurrentPlayer(id: id, name: name, level: level, region: region)
                             sender.player = self.player
                        }
                    }
                }
            })
        task.resume()
    }
    
    
    func getGameInfo(region: Regions, playerId: Int){
        let urlString = "https://\(region.rawValue).api.pvp.net/observer-mode/rest/consumer/getSpectatorGameInfo/\(region.getPlatformId(region: region))/47360346?api_key=\(apiKey)"
        let url = URL(string: urlString)
        let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            guard let data = data else {
                print("Data Error")
                return
            }
            
            let json = JSON(data: data)
            self.parseGameData(json: json)

        })
        task.resume()
    }
    
    func parseGameData(json: JSON){
        let id = json["gameId"].int
        let mapId = json["mapId"].int
        let gameMode = json["gameMode"].string
        let teams = getTeam(participants: json["participants"].array!)
        let frienlyTeam = teams.0
        let enemyTeam = teams.1
        
        let game = ActiveGame(id: id!, mapId: mapId!, gameMode: gameMode!, enemyTeam: enemyTeam, friendlyTeam: frienlyTeam)
        // return 
    }
    
    func getTeam(participants: [JSON]) -> ([Participant], [Participant]){
        var enemyTeam: [Participant] = []
        var friendlyTeam: [Participant] = []
        
        for p in participants{
            let player = Participant(teamId: p["teamId"].int!, spell1Id: p["spell1Id"].int!, spell2Id: p["spell2Id"].int!, championId: p["championId"].int!, summonerName: p["summonerName"].string!, summonerId: p["summonerId"].int!, isBot: p["bot"].bool!)
            if player.teamId == 100{
                friendlyTeam.append(player)
            } else {
                enemyTeam.append(player)
            }
        }
//        guard friendlyTeam.count == enemyTeam.count else {
//            return ([nil], [nil])
//        }
        return (friendlyTeam, enemyTeam)
    }
}
