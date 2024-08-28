import UIKit

final class TabBarController: UITabBarController {
    
    // MARK: - Private properties
    
    private let homeViewController = DashboardViewController()
    private let tasksViewController = TasksViewController()
    private let serviceViewController = ServiceViewController()
    private let chatViewController = ChatViewController()
    private let contactViewController = ContactViewController()
    


    // MARK: - Life Cycle

    override func viewDidLoad() {
        setupTabBarControllers()
        setupTabs()
        navigationItem.hidesBackButton = true;
        tabBar.barStyle = .default
        tabBar.barTintColor = .white
        tabBar.tintColor = UIColor(named: "primaryColor")
        tabBar.unselectedItemTintColor = .gray
    }
    
    // MARK: - Private Methods
    
    fileprivate func setupTabs() {
        setViewControllers([
            homeViewController,
            tasksViewController,
            serviceViewController,
            chatViewController,
            contactViewController
        ], animated: true)
    }
    private func setupTabBarControllers(){
        homeViewController.tabBarItem.image = UIImage(systemName: "key.horizontal.fill")
        homeViewController.tabBarItem.title = "Главная"
        tasksViewController.tabBarItem.image = UIImage(systemName: "checklist.checked.rtl")
        tasksViewController.tabBarItem.title = "Заявки"
        serviceViewController.tabBarItem.image = UIImage(systemName: "star.fill")
        serviceViewController.tabBarItem.title = "Услуги"
        chatViewController.tabBarItem.image = UIImage(systemName: "message.fill")
        chatViewController.tabBarItem.title = "Чат"
        contactViewController.tabBarItem.image = UIImage(systemName: "book.pages.fill")
        contactViewController.tabBarItem.title = "Контакты"
    }
}
