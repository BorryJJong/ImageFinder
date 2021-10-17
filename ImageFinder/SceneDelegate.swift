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
    
    let service = SearchImageService() // 메모리 주소값 생성 -> A 주소값
    let presenter = SearchImagePresenter(searchImageService: service)
//    let view = SearchImageViewController(presenter: presenter)
    let view = SearchImageViewController()
    view.presenter = presenter
    
    let navigationCotroller = UINavigationController(rootViewController: view)

    window?.rootViewController = navigationCotroller
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
