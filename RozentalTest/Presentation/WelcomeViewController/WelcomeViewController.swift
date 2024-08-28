import UIKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - Private properties

    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Добро пожаловать!"
        label.numberOfLines = 2
        label.font = UIFont(name: "Arial-BoldMT", size: 40)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private lazy var letsWorkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Авторизуйтесь, чтобы продолжить работу"
        label.font = UIFont(name: "Arial-BoldMT", size: 14)
        label.textColor = .gray
        label.textAlignment = .left
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button.createCustomButton(
            setTitle: "Вход",
            backgroundColor: UIColor(named: "alertColor"),
            setTitleColor: .darkGray,
            borderWidth: 0)
    }()
    
    private lazy var registrationButton: UIButton = {
        let button = UIButton(type: .system)
        return button.createCustomButton(
            setTitle: "Регистрация",
            backgroundColor: .clear,
            setTitleColor: .darkGray,
            borderWidth: 1
        )
    }()
    
    private lazy var inviteButton: UIView = {
        let button = UIButton(type: .system)
        return button.createCustomClearButton(
            setTitle: "Пригласить управлять своим домом",
            backgroundColor: .clear,
            setTitleColor:  UIColor(named: "primaryColor")
        )
    }()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setConstraints()
    }

    // MARK: - Private Methods

    private func addSubviews() {
        [
            welcomeLabel,
            letsWorkLabel,
            loginButton,
            registrationButton,
            inviteButton

        ].forEach{ view.addSubview($0) }
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 435),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            welcomeLabel.widthAnchor.constraint(equalToConstant: 290),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 90),
            
            letsWorkLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 30),
            letsWorkLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            letsWorkLabel.widthAnchor.constraint(equalToConstant: 320),
            letsWorkLabel.heightAnchor.constraint(equalToConstant: 15),
            
            loginButton.topAnchor.constraint(equalTo: letsWorkLabel.bottomAnchor, constant: 32),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: Constants.widthButton),
            loginButton.heightAnchor.constraint(equalToConstant: Constants.heightButton),
            
            registrationButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16),
            registrationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registrationButton.widthAnchor.constraint(equalToConstant: Constants.widthButton),
            registrationButton.heightAnchor.constraint(equalToConstant: Constants.heightButton),
            
            inviteButton.topAnchor.constraint(equalTo: registrationButton.bottomAnchor, constant: 16),
            inviteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inviteButton.widthAnchor.constraint(equalToConstant: Constants.widthButton),
            inviteButton.heightAnchor.constraint(equalToConstant: Constants.heightButton),
        ])
    }
    
    @objc private func loginButtonDidTap() {
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
}


