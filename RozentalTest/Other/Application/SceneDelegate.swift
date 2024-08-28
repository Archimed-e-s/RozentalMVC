import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        let viewController = WelcomeViewController()
        let navigationViewController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
    }
}

