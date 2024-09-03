import UIKit

enum PaddingSpace {
    case left(CGFloat)
    case right(CGFloat)
    case equalSpacing(CGFloat)
}

extension UITextField {
    func addPadding(padding: PaddingSpace, for image: String) {
        self.leftViewMode = .always
        self.layer.masksToBounds = true
        switch padding {

        case .left(let spacing):
            let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            let imageView = UIImageView(image: UIImage(systemName: image))
            leftPaddingView.addSubview(imageView)
            imageView.frame = CGRectMake(10, -10 , 20, 20)
            self.leftView = leftPaddingView
            self.leftViewMode = .always

        case .right(let spacing):
            let rightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            let imageView = UIImageView(image: UIImage(systemName: image))
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRectMake(10, -10 , 20, 20)
            rightPaddingView.addSubview(imageView)
            self.rightView = rightPaddingView
            self.rightViewMode = .always

        case .equalSpacing(let spacing):
            let equalPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            let imageView = UIImageView(image: UIImage(systemName: image))
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRectMake(10, -10 , 20, 20)
            equalPaddingView.addSubview(imageView)
            self.leftView = equalPaddingView
            self.leftViewMode = .always
            self.rightView = equalPaddingView
            self.rightViewMode = .always
        }
    }

    func createLoginTextField() -> UITextField {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addPadding(padding: .left(40), for: "at")
        self.placeholder = "E-mail"
        self.tintColor = .gray
        self.layer.masksToBounds = false
        self.layer.cornerRadius = Constants.cornerRadiusTextField
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        return self
    }

    func createSecureTextField() -> UITextField {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addPadding(padding: .left(40), for: "lock.fill")
        self.placeholder = "Password"
        self.tintColor = .gray
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.setPasswordToggleImage(button, iSecureTextEntry: isSecureTextEntry, sender: self)
        button.addTarget(self, action: #selector(setPasswordToggleImage), for: .touchUpInside)
        self.rightView = button
        self.rightViewMode = .always
        self.layer.masksToBounds = true
        self.layer.cornerRadius = Constants.cornerRadiusTextField
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.isSecureTextEntry = true
        return self
    }

    @objc fileprivate func setPasswordToggleImage(_ button: UIButton, iSecureTextEntry: Bool, sender: AnyObject) {
        if isSecureTextEntry {
            isSecureTextEntry.toggle()
            button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        } else {
            isSecureTextEntry.toggle()
            button.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        }

    }

}
