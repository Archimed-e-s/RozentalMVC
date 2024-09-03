import UIKit

final class LoginViewController: UIViewController {

    // MARK: - Private properties
    
    private let networkService = NetworkService.shared
    
    private lazy var leftNavigationBarButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.tintColor = .darkGray
        button.backgroundColor = UIColor(named: "mainViewBackgroundColor")
        button.layer.masksToBounds = false
        button.layer.cornerRadius = Constants.leftNavigationBarButtonFrame / 2
        button.clipsToBounds = false
        button.addTarget(self, action: #selector(backToWelcomeScreen), for: .touchUpInside)
        return button
    }()

    private lazy var rightNavigationBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Забыли пароль?", style: .plain, target: self, action: #selector(forgotPasswordDidTap))
        button.tintColor = .darkGray
        return button
    }()
    
    private lazy var entryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Вход в аккаунт"
        label.font = UIFont(name: "Arial-BoldMT", size: 24)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()

    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        return textField.createLoginTextField()
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        return textField.createSecureTextField()
    }()
    
    private lazy var sendPostRequestButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(sendButtonDidTap), for: .touchUpInside)
        return button.createCustomButton(
            setTitle: "Войти",
            backgroundColor: UIColor(named: "alertColor"),
            setTitleColor: .darkGray,
            borderWidth: 0
        )
    }()

    
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = rightNavigationBarButton
        let customBarButton = UIBarButtonItem(customView: leftNavigationBarButton)
        navigationItem.leftBarButtonItem = customBarButton
        let hideKeyboardGesture = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        hideKeyboardGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(hideKeyboardGesture)
        self.view.endEditing(true)
        addSubviews()
        setConstraints()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loginTextField.becomeFirstResponder()
    }
    
    // MARK: - Private Methods

    private func addSubviews() {
        [
            leftNavigationBarButton,
            entryLabel,
            loginTextField,
            passwordTextField,
            sendPostRequestButton,
        ].forEach{ view.addSubview($0) }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            leftNavigationBarButton.widthAnchor.constraint(equalToConstant: Constants.leftNavigationBarButtonFrame),
            leftNavigationBarButton.heightAnchor.constraint(equalToConstant: Constants.leftNavigationBarButtonFrame),
            
            entryLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            entryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            entryLabel.widthAnchor.constraint(equalToConstant: 200),
            entryLabel.heightAnchor.constraint(equalToConstant: 24),

            loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTextField.centerYAnchor.constraint(equalTo: entryLabel.bottomAnchor, constant: 50),
            loginTextField.widthAnchor.constraint(equalToConstant: Constants.widthButton),
            loginTextField.heightAnchor.constraint(equalToConstant: Constants.heightButton),
            
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.centerYAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 50),
            passwordTextField.widthAnchor.constraint(equalToConstant: Constants.widthButton),
            passwordTextField.heightAnchor.constraint(equalToConstant: Constants.heightButton),
            
            sendPostRequestButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendPostRequestButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor, constant: 80),
            sendPostRequestButton.widthAnchor.constraint(equalToConstant: Constants.widthButton),
            sendPostRequestButton.heightAnchor.constraint(equalToConstant: Constants.heightButton)
        ])
    }
    
    @objc private func sendButtonDidTap() {
        networkService.generateAuthRequest(
            expecting: AuthorizationDataModel.self,
            login: loginTextField.text ?? "",
            password: passwordTextField.text ?? "") { result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    let viewController = TabBarController()
                    navigationController?.pushViewController(viewController, animated: true)
                }
                print(model)
            case .failure(_):
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    let alertController = UIAlertController(
                        title: "Не верный логин или пароль",
                        message: nil,
                        preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "ОК", style: .cancel)
                    alertController.addAction(alertAction)
                    self.present(alertController, animated: true)
                }
            }
        }
    }
    
    @objc private func backToWelcomeScreen() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc private func forgotPasswordDidTap() {
        navigationController?.popToRootViewController(animated: true)
    }
}

