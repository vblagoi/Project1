//
//  Universe.swift
//  UniverseSystem
//
//  Created by Вова Благой on 28.01.2021.
//

import Foundation

class Universe {
    
    var galaxys: [Galaxy] = []
    var timer: Timer = Timer()
    var age: Int = 0
    let radiusForBlackHole: Int
    let weightForBlackHole: Int
    
    weak var delegate: UniverseDelegate?
    
    init(radiusForBlackHole: Int, weightForBlackHole: Int) {
        self.radiusForBlackHole = radiusForBlackHole
        self.weightForBlackHole = weightForBlackHole
        startTimer()
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(didRecieveTime), userInfo: nil, repeats: true)
    }
    
    private func handle(request: Double) {
        
        for galaxy in galaxys {
            galaxy.handle(request: request)
            galaxy.radiusForBlackHole = radiusForBlackHole
            galaxy.weightForBlackHole = weightForBlackHole
        }

    }
    
    @objc private func didRecieveTime() {
        age += 10
        if timeToColapse() {
            let randomGalaxysIndexes = randomGalaxyForCollapse()
            if randomGalaxysIndexes!.count > 1 {
                colapseGalaxys(first: randomGalaxysIndexes![0], second: randomGalaxysIndexes![1])
            }
        }
        handle(request: timer.timeInterval)
        createGalaxy()
    }
    
    func timeToColapse() -> Bool {
        if (age % 30 == 0) {
            return true
        } else {
            return false
        }
    }
    
    private func createGalaxy() {
        let newGalaxy = Factory.defaultFactory.createGalaxy(type: TypeGalaxy.random())
        galaxys.append(newGalaxy)
        delegate?.galaxyDidAppear()
        print("Create one more Galaxy")
    }
    
    private func randomGalaxyForCollapse() -> [Int]? {
        let arrayIndexes = Array(0...(galaxys.count - 1))
        let filteredIndexes = arrayIndexes.filter{ index in
            return galaxys[index].age >= 180
        }
        return Array(filteredIndexes.shuffled().prefix(2))
    }
    
    private func colapseGalaxys(first: Int, second: Int) {
        if galaxys[first].weight > galaxys[second].weight {
            firstGalaxyMergeSecond(firstIndex: first, secondIndex: second)
        } else {
            firstGalaxyMergeSecond(firstIndex: second, secondIndex: first)
        }
    }
    
    private func firstGalaxyMergeSecond(firstIndex: Int, secondIndex: Int) {
        galaxys[firstIndex].starPlanetSystems += galaxys[secondIndex].starPlanetSystems
        let countToDelete = getCountOfSystemsWith(index: firstIndex, persent: 10.0)
        
        deleteSystemsCountBy(index: firstIndex, count: countToDelete)
        galaxys.remove(at: secondIndex)
        print("Colapse")
    }
    
    private func deleteSystemsCountBy(index: Int, count: Int) {
        if count > 0 {
            for _ in 1...count {
                let count = galaxys[index].starPlanetSystems.count
                let indexSystem = Int.random(in: 0..<count)
                galaxys[index].starPlanetSystems.remove(at: indexSystem)
            }
        }
    }
    
    private func getCountOfSystemsWith(index: Int, persent: Double) -> Int {
        let persentPartOfCount = Double(galaxys[index].starPlanetSystems.count) / persent
        return Int(floor(persentPartOfCount))
    }
}
