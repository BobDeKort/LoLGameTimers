//
//  Enums.swift
//  LoLGameTimers
//
//  Created by Bob De Kort on 11/5/16.
//  Copyright © 2016 Bob De Kort. All rights reserved.
//

import Foundation

enum Regions: String {
    case brazil = "br"
    case euNortEast = "eune"
    case euWest = "euw"
    case japan = "jp"
    case korea = "kr"
    case latinAmNord = "lan"
    case latinAmSouth = "las"
    case northAm = "na"
    case oceania = "oce"
    case russia = "ru"
    case turkey = "tr"
    case pbe = "pbe"
    
    func getPlatformId(region: Regions) -> String{
        switch region{
        case .euNortEast:
            return "EUN1"
        case .korea, .russia:
            return region.rawValue
        case .latinAmNord, .latinAmSouth:
            let result = "LA"
            if region == .latinAmNord {
                return (result + "1")
            } else {
                return (result + "2")
            }
        case .oceania:
            return "OC1"
        case .brazil, .euWest, .japan, .northAm, .turkey, .pbe:
            return (region.rawValue + "1")
        }
    }
    
    
}
