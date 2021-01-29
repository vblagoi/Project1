//
//  Protocols.swift
//  UniverseSystem
//
//  Created by Вова Благой on 28.01.2021.
//

import Foundation

protocol Handler: class {

    @discardableResult
    func setNext(handler: Handler) -> Handler

    func handle(request: Double) -> Void

    var nextHandler: Handler? { get set }
}

extension Handler {

    func setNext(handler: Handler) -> Handler {
        self.nextHandler = handler
        return handler
    }

    func handle(request: Double){
    }
}

protocol StarDelegate: AnyObject {
    func blackHoleDidAppear()
}

protocol UniverseDelegate: AnyObject {
    func galaxyDidAppear()
}

protocol GalaxyDelegate: AnyObject {
    func systemDidAppear()
}

protocol StarPlanetarySystemDelegate: AnyObject {
    func planetDidAppear()
}
