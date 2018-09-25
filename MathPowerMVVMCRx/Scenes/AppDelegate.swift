import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()

        setupDI()
        setupUI()
        setupAppCoordinator()

        return true
    }
}

private extension AppDelegate {
    func setupDI() {
        Assembler.shared.apply(assemblies: appAssemblies)
    }

    func setupUI() {
        UINavigationBar.appearance().barStyle = .blackOpaque
        let barAppearance = UINavigationBar.appearance()
        barAppearance.tintColor = .white
        barAppearance.barTintColor = .red
        barAppearance.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }

    func setupAppCoordinator() {
        appCoordinator = AppCoordinator(window: window!)
        appCoordinator.start().start()
    }
}
