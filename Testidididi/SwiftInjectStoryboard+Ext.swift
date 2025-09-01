//
//  SwiftInjectStoryboard+Ext.swift
//  Testidididi
//
//  Created by Nunu Nugraha on 01/09/25.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    
    @objc class func setup() {
        defaultContainer.register(Engine.self) { _ in Engine() }
        defaultContainer.register(Car.self) { resolver in Car(engine: resolver.resolve(Engine.self)!) }
        defaultContainer.storyboardInitCompleted(ViewController.self) { resolver, controller in
            controller.car = resolver.resolve(Car.self)!
        }
    }
}
