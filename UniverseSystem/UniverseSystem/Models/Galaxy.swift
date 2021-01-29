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
    let radiusForBlackHole: Int
    let weightForBlackHole: Int
    
    init(radiusForBlackHole: Int, weightForBlackHole: Int) {
        self.radiusForBlackHole = radiusForBlackHole
        self.weightForBlackHole = weightForBlackHole
        self.type = TypeGalaxy.random()
        self.age = 0
    }
    
    func createStarPlanetSystem() {
        let system = StarPlanetarySystem(radiusForBlackHole: radiusForBlackHole, weightForBlackHole: weightForBlackHole)
        
        starPlanetSystems.append(system)
        delegate?.systemDidAppear()
        print("Create one more StarPlanetSystem")
    }
    
    func collapse(anotherGalaxy: Galaxy) -> Galaxy {
        // Код для зіткнення галактик і створення однієї
        return self
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

