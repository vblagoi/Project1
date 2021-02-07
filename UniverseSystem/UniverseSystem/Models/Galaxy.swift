//
//  Galaxy.swift
//  UniverseSystem
//
//  Created by Вова Благой on 28.01.2021.
//

import Foundation


class Galaxy: StarDelegate {
    
    /*
     Mentor's comment:
     Don't forget about access control modifiers. Not every property or method should be exposed to the outside world.
     */
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
    
    /*
     Mentor's comment:
     Unused code
     */
    func collapse(anotherGalaxy: Galaxy) -> Galaxy {
        // Код для зіткнення галактик і створення однієї
        return self
    }
    
    func blackHoleDidAppear() {
        /*
         Mentor's comment:
         Removing all planetes from a star-planetary system and leaving the star in place as a black hole looks
         like quick and dirty solution. Accoding to the requirements a star-planetary system ceases to exist
         when it's host star becomes a black hole. And this situation must be handled correctly when a view controller
         displaying the star-planetary system is presented to user.
         */
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

