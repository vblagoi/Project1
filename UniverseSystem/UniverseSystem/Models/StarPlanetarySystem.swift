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
    var radiusForBlackHole: Int? = nil
    var weightForBlackHole: Int? = nil
    
    init() {
        self.star = Factory.defaultFactory.createStar(type: TypeStar.random())
    }
    
    func handle(request: Double) {
        star.handle(request: request)
        star.radiusForBlackHole = radiusForBlackHole
        star.weightForBlackHole = weightForBlackHole
        createPlanet()
    }
    
    func createPlanet() {
        guard planets.count < 9 else { return }
        let planet = Factory.defaultFactory.createPlanet(type: PlanetType.random())
        planets.append(planet)
        delegate?.planetDidAppear()
        print("Create one more Planet")
    }
    
    func blackHoleDidAppear() {
        planets = []
        starDelegate?.blackHoleDidAppear()
    }
}
