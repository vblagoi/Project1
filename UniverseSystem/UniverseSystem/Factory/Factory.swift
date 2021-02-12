//
//  Factory.swift
//  UniverseSystem
//
//  Created by Вова Благой on 12.02.2021.
//

import Foundation

class Factory {
    static let defaultFactory = Factory()
    
    func createGalaxy(type: TypeGalaxy) -> Galaxy {
        return Galaxy(type: type)
    }
    
    func createStarPlanetarySystem() -> StarPlanetarySystem {
        return StarPlanetarySystem()
    }
    
    func createStar(type: TypeStar) -> Star {
        return Star(type: type)
    }
    
    func createPlanet(type: PlanetType) -> Planet {
        return Planet(type: type)
    }
    
    func createSatellit() -> Satellite {
        return Satellite()
    }
}
