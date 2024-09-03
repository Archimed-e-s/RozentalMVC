import UIKit

extension UIButton {
    func createCustomButton(setTitle: String, backgroundColor: UIColor!, setTitleColor: UIColor!, borderWidth: CGFloat) -> UIButton {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(setTitle, for: .normal)
        self.contentMode = .scaleAspectFit
        self.titleLabel?.font = UIFont(name: "Arial-BoldMT", size: 14)
        self.layer.masksToBounds = false
        self.layer.cornerRadius = Constants.cornerRadiusButton
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.setTitleColor(setTitleColor, for: .normal)
        self.backgroundColor = backgroundColor
        return self
    }

    func createCustomClearButton(setTitle: String, backgroundColor: UIColor!, setTitleColor: UIColor!) -> UIButton {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setImage(UIImage(named: "homeIcon")?.withRenderingMode(.alwaysTemplate), for: .normal)
        self.imageView?.contentMode = .scaleAspectFit
        self.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 320)
        self.tintColor = UIColor(named: "colorInviteButton")
        self.setTitle(setTitle, for: .normal)
        self.titleLabel?.font = UIFont(name: "Arial-BoldMT", size: 14)
        self.setTitleColor(setTitleColor, for: .normal)
        self.backgroundColor = backgroundColor
        return self
    }
}
