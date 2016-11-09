//
//  LoadingViewController.swift
//  LoLGameTimers
//
//  Created by Bob De Kort on 11/5/16.
//  Copyright © 2016 Bob De Kort. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    
    let apiWrapper = APIWrapper()
    var player: CurrentPlayer? = nil{
        didSet{
            print("player name: \(player?.summonerName)")
        }
    }
    var loadingGame: ActiveGame?{
        didSet{
            print("-------------------")
            print (String(describing: loadingGame?.gameId))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        apiWrapper.getGameInfo(region: Regions.northAm, playerId: (player?.summonerId)!, sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
