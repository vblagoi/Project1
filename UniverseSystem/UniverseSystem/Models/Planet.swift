//
//  Planet.swift
//  UniverseSystem
//
//  Created by Вова Благой on 28.01.2021.
//

import Foundation

class Planet: Handler {
    var nextHandler: Handler?
    
    let type: PlanetType
    let temperature: Int
    let weight: Int
    let radius: Int
    var satellites: [Satellite] = []
    
    init() {
        self.type = PlanetType.random()
        self.temperature = Int.random(in: 1...100)
        self.radius = Int.random(in: 1...100)
        self.weight = Int.random(in: 1...100)
        newSatellites()
    }
    
    func newSatellites() {
        let satellitesCount = Int.random(in: 0...5)
        while satellites.count != satellitesCount {
            let satellite = Satellite()
            self.satellites.append(satellite)
            print("Create one more Satellite")
        }
    }

}

extension Planet {
    func stringType() -> String {
        switch type {
        case .ammoniaClouds:
            return "AmmoniaClouds"
        case .waterClouds:
            return "WaterClouds"
        case .cloudless:
            return "Cloudless"
        case .alkaliMetals:
            return "AlkaliMetals"
        case .silicateClouds:
            return "SilicateClouds"
        }
    }
}

enum PlanetType: CaseIterable {
    case ammoniaClouds
    case waterClouds
    case cloudless
    case alkaliMetals
    case silicateClouds
    
    static func random() -> PlanetType {
        return allCases.randomElement()!
    }
}

class Satellite {
    
}
