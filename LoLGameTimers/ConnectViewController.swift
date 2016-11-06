//
//  ViewController.swift
//  LoLGameTimers
//
//  Created by Bob De Kort on 11/5/16.
//  Copyright © 2016 Bob De Kort. All rights reserved.
//

import UIKit

class ConnectViewController: UIViewController {
    
    let nextViewController = LoadingViewController()
    var player: CurrentPlayer?{
        didSet{
            showReadyButton()
        }
    }
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var searchButton: UIButton!

    @IBAction func searchButtonPressed(_ sender: Any) {
        if let searchText = searchTextField.text {
            apiWrapper.getSummoner(region: Regions.northAm, query: searchText, sender: self)
        }
    }
    
    @IBOutlet weak var readyButton: UIButton!
    
    @IBAction func readyButtonPressed(_ sender: Any) {
        if player != nil {
            apiWrapper.getGameInfo(region: Regions.northAm, playerId: (player?.summonerId)!)
            performSegue(withIdentifier: "toLoadingScreen", sender: self)
        } else {
            print("----Error----")
        }
    }
    
    
    var apiWrapper = APIWrapper()
    override func viewDidLoad() {
        super.viewDidLoad()
        hideReadyButton()
        // apiWrapper.getSummoner(region: Regions.northAm, query: "oxed")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showReadyButton(){
        readyButton.isHidden = false
        print("button is visable")
    }
    
    func hideReadyButton(){
        readyButton.isHidden = true
    }
}

