//
//  SceneDelegate.swift
//  Testidididi
//
//  Created by Nunu Nugraha on 29/08/25.
//

import UIKit
import Swinject

class Engine {
    func start() {
        print("Start Engine")
    }
}

class Car {
    let engine: Engine
    
    init(engine: Engine) {
        self.engine = engine
    }
    
    func start() {
        engine.start()
        print("start in car")
    }
    
    func mogok() {
        print("mobil mogok")
    }
}



class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    let container: Container = {
        let container = Container()
        container.register(Engine.self) { _ in Engine() }
        container.register(Car.self) { r in Car(engine: r.resolve(Engine.self)!)}
        container.register(ViewController.self) { r in
            let controller = ViewController()
            controller.car = r.resolve(Car.self)!
            return controller
        }
        
        return container
    }()


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // Buat instance window.
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        self.window = window
        
        // Pembuatan instance root view controller dengan Container DI.
        window.rootViewController = container.resolve(ViewController.self)
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

