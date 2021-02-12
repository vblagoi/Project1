//
//  Galaxy.swift
//  UniverseSystem
//
//  Created by Вова Благой on 28.01.2021.
//

import Foundation


class Galaxy: StarDelegate {
    
    var nextHandler: Handler?
    var delegate: GalaxyDelegate?
    let type: TypeGalaxy
    var age: Int
    var starPlanetSystems: [StarPlanetarySystem] = []
    var weight = Int.random(in: 1...100)
    var radiusForBlackHole: Int?
    var weightForBlackHole: Int?
    
    init(type: TypeGalaxy) {
        self.type = type
        self.age = 0
    }
    
    func createStarPlanetSystem() {
        let system = Factory.defaultFactory.createStarPlanetarySystem()
        
        starPlanetSystems.append(system)
        delegate?.systemDidAppear()
        print("Create one more StarPlanetSystem")
    }
    
    func blackHoleDidAppear() {
        print("Black Hole did appear!")
    }
}

extension Galaxy: Handler {

    func handle(request: Double) {
        age += 10
        for system in starPlanetSystems {
            system.handle(request: request)
            system.radiusForBlackHole = radiusForBlackHole
            system.weightForBlackHole = weightForBlackHole
        }
        createStarPlanetSystem()
    }
    
}

extension Galaxy {
    func stringType() -> String {
        switch type {
        case .elliptical:
            return "Elliptical"
        case .irregular:
            return "Irregular"
        case .lenticular:
            return "Lenticular"
        case .spiral:
            return "Spiral"
        }
    }
}

enum TypeGalaxy: CaseIterable {
    case elliptical
    case spiral
    case lenticular
    case irregular
    
    static func random() -> TypeGalaxy {
        return allCases.randomElement()!
    }
}

