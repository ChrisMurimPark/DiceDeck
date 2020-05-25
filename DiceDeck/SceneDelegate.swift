//
//  SceneDelegate.swift
//  DiceDeck
//
//  Created by Chris (Murim) Park on 5/24/20.
//  Copyright © 2020 Chris (Murim) Park. All rights reserved.
//

import UIKit
import SwiftUI

class DiceViewController: UIViewController {
    lazy var mainLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Tap to roll"
        textLabel.textColor = UIColor.white
        textLabel.font = textLabel.font.withSize(36)
        textLabel.textAlignment = NSTextAlignment.center
        return textLabel
    }()

    lazy var countLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Roll count: 0"
        textLabel.textColor = UIColor.white
        textLabel.font = textLabel.font.withSize(24)
        textLabel.textAlignment = NSTextAlignment.center
        return textLabel
    }()

    var cards: [Int] = []
    var totalCount = 0
    var currentCard = 0

    override func loadView() {
        let rootView = UIStackView(arrangedSubviews: [countLabel, mainLabel])
        rootView.axis = NSLayoutConstraint.Axis.vertical
        rootView.isUserInteractionEnabled = true
        rootView.distribution = UIStackView.Distribution.fillEqually
        rootView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tapped)))

        view = rootView
        refreshCards()
    }

    @objc func tapped() {
        if (currentCard == cards.count) {
            refreshCards()
        }
        mainLabel.text = "\(cards[currentCard])"
        currentCard = currentCard + 1
        totalCount = totalCount + 1
        countLabel.text = "Roll count: \(totalCount)"
    }

    func refreshCards() {
        cards = [2, 3, 3, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 11, 11, 12]
        cards.shuffle()
        currentCard = 0
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Create the SwiftUI view that provides the window contents.

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let dice = DiceViewController()
            window.rootViewController = dice

            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
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

