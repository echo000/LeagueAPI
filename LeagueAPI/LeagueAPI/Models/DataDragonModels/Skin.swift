//
//  Skin.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 8/14/18.
//  Copyright © 2018 Antoine Clop. All rights reserved.
//

import Foundation

public class Skin {
    
    public var skinId: SkinId
    public var skinNumber: Int
    public var name: String
    public var hasChromas: Bool
    public var skinImages: SkinImages
    
    public init(skinId: String, skinNumber: Int, name: String, hasChromas: Bool, skinImages: SkinImages) {
        self.skinId = skinId
        self.skinNumber = skinNumber
        self.name = name
        self.hasChromas = hasChromas
        self.skinImages = skinImages
    }
    
    internal init(from data: SkinData, version: String, championNameId: String) {
        self.skinId = data.skinId
        self.skinNumber = data.skinNumber
        self.name = data.name
        self.hasChromas = data.hasChromas
        self.skinImages = SkinImages(version: version, championName: championNameId, skinNumber: data.skinNumber)
    }
}