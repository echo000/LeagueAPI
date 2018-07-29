//
//  TournamentRegion.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 7/29/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class TournamentRegion {
    
    public private(set) var region: Region
    
    public init?(region: Region) {
        guard region != .KR else { return nil }
        self.region = region
    }
}