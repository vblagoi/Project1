//
//  StarPlanetarySystem.swift
//  UniverseSystem
//
//  Created by Вова Благой on 28.01.2021.
//

import Foundation

class StarPlanetarySystem: Handler, StarDelegate {
    
    weak var starDelegate: StarDelegate?
    var nextHandler: Handler?
    weak var delegate: StarPlanetarySystemDelegate?
    let star: Star
    var planets: [Planet] = []
    let radiusForBlackHole: Int
    let weightForBlackHole: Int
    
    init(radiusForBlackHole: Int, weightForBlackHole: Int) {
        self.radiusForBlackHole = radiusForBlackHole
        self.weightForBlackHole = weightForBlackHole
        self.star = Star(radiusForBlackHole: radiusForBlackHole, weightForBlackHole: weightForBlackHole)
    }
    
    func handle(request: Double) {
        star.handle(request: request)
        createPlanet()
    }
    
    func createPlanet() {
        guard planets.count < 9 else { return }
        let planet = Planet()
        planets.append(planet)
        delegate?.planetDidAppear()
        print("Create one more Planet")
    }
    
    func blackHoleDidAppear() {
        planets = []
        starDelegate?.blackHoleDidAppear()
    }
}
