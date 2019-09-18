import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
    
    window = UIWindow()
    let navigationController = makeRootNavigationController()
    window!.rootViewController = navigationController
    window!.makeKeyAndVisible()
    
    return true
  }
  
  private func makeRootNavigationController() -> UINavigationController {
    let listViewController = ListViewController()
    let navigationController = UINavigationController(rootViewController: listViewController)
    navigationController.navigationBar.prefersLargeTitles = true
    
    let navigationBarAppearace = UINavigationBar.appearance()
    navigationBarAppearace.tintColor = .black
    //navigationBarAppearace.isTranslucent = false
    
    return navigationController
  }
}

