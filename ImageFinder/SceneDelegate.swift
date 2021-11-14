//
//  SceneDelegate.swift
//  ImageFinder
//
//  Created by Daye on 2021/09/15.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }

    window = UIWindow(windowScene: windowScene)
    let view = ChallengeViewController()
    let presenter = ChallengePresenter()
    view.presenter = presenter

    let tabBarController = UITabBarController()
    self.window?.rootViewController = tabBarController

    let viewChallenge = ChallengeViewController()
    let viewHome = SearchImageViewController()
    let viewWriteFeed = ChallengeViewController()
    let viewStore = SearchImageViewController()
    let viewMyPage = SearchImageViewController()

    tabBarController.setViewControllers([viewHome, viewChallenge, viewWriteFeed, viewStore, viewMyPage], animated: false)

    viewHome.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: "home0"), tag: 0)
    viewChallenge.tabBarItem = UITabBarItem(title: "챌린지", image: UIImage(named: "challenge0"), tag: 1)
    viewWriteFeed.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "writeMyFeed"), tag: 2)
    viewStore.tabBarItem = UITabBarItem(title: "스토어", image: UIImage(named: "store0"), tag: 3)
    viewMyPage.tabBarItem = UITabBarItem(title: "MY", image: UIImage(named: "myPage0"), tag: 4)

    if let tbc = self.window?.rootViewController as? UITabBarController {
      if let tbItems = tbc.tabBar.items {
        tbItems[0].image = UIImage(named: "home0")?.withRenderingMode(.alwaysOriginal)
        tbItems[0].selectedImage = UIImage(named: "home1")?.withRenderingMode(.alwaysOriginal)

        tbItems[1].image = UIImage(named: "challenge0")?.withRenderingMode(.alwaysOriginal)
        tbItems[1].selectedImage = UIImage(named: "challenge1")?.withRenderingMode(.alwaysOriginal)

        tbItems[2].image = UIImage(named: "writeMyFeed")?.withRenderingMode(.alwaysOriginal)
        tbItems[2].selectedImage = UIImage(named: "writeMyFeed")?.withRenderingMode(.alwaysOriginal)

        tbItems[3].image = UIImage(named: "store0")?.withRenderingMode(.alwaysOriginal)
        tbItems[3].selectedImage = UIImage(named: "store1")?.withRenderingMode(.alwaysOriginal)

        tbItems[4].image = UIImage(named: "myPage0")?.withRenderingMode(.alwaysOriginal)
        tbItems[4].selectedImage = UIImage(named: "myPage1")?.withRenderingMode(.alwaysOriginal)
      }
      tbc.tabBar.backgroundColor = .white
    }

//    ** ImageFinder code
//    let view = SearchImageViewController()
//    let service = SearchImageService()
//    let presenter = SearchImagePresenter(searchImageService: service)
//    view.presenter = presenter
//
//    let navigationCotroller = UINavigationController(rootViewController: view)
//    window?.rootViewController = navigationCotroller

    window?.makeKeyAndVisible()
  }

  func sceneDidDisconnect(_ scene: UIScene) {
  }

  func sceneDidBecomeActive(_ scene: UIScene) {
  }

  func sceneWillResignActive(_ scene: UIScene) {
  }

  func sceneWillEnterForeground(_ scene: UIScene) {
  }

  func sceneDidEnterBackground(_ scene: UIScene) {
  }
}
