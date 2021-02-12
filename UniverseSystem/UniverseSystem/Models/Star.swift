//
//  Star.swift
//  UniverseSystem
//
//  Created by Вова Благой on 28.01.2021.
//

import Foundation

class Star: Handler {
    var nextHandler: Handler?
    
    let type: TypeStar
    let weight: Int
    let temperature: Int
    var evolveLevel: EvolveLevel
    let radius: Int
    let luminosity: Int
    var age: Int
    var radiusForBlackHole: Int? = nil
    var weightForBlackHole: Int? = nil
    
    weak var delegate: StarDelegate?
    
    
    
    init(type: TypeStar) {
        self.weight = Int.random(in: 1...100)
        self.temperature = Int.random(in: 1...100)
        self.radius = Int.random(in: 1...100)
        self.luminosity = Int.random(in: 1...100)
        self.age = 0
        self.type = type
        self.evolveLevel = .youngStar
    }
    
    func handle(request: Double) {
        age += 10
        if timeToEvolve() {
            evolve()
        }
    }
    
    private func timeToEvolve() -> Bool {
        if (age % 60 == 0) {
            return true
        } else {
            return false
        }
    }
    
    private func evolve() {
        switch evolveLevel {
        case .youngStar:
            evolveLevel = .oldStar
        case .oldStar:
            finalEvolve()
        default:
            return
        }
    }
    
    private func finalEvolve() {
        if let _ = radiusForBlackHole, let _ = weightForBlackHole {
            if radius > radiusForBlackHole! && weight > weightForBlackHole! {
                evolveLevel = .blackHole
            } else {
                evolveLevel = .denseDwarf
            }
        }
    }
    
}

extension Star {
    func stringType() -> String {
        switch type {
        case .o:
            return "O"
        case .b:
            return "B"
        case .a:
            return "A"
        case .f:
            return "F"
        case .g:
            return "G"
        case .k:
            return "K"
        case .m:
            return "M"
        }
    }
    
    func stringEvolve() -> String {
        switch evolveLevel {
        case .youngStar:
            return "Young Star"
        case .oldStar:
            return "Old Star"
        case .denseDwarf:
            return "Dense Dwarf"
        case .blackHole:
            return "Black Hole"
        }
    }
}

enum TypeStar: CaseIterable {
    case o
    case b
    case a
    case f
    case g
    case k
    case m
    
    static func random() -> TypeStar {
        return allCases.randomElement()!
    }
}

enum EvolveLevel {
    case youngStar
    case oldStar
    case denseDwarf
    case blackHole
}


