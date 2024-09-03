import UIKit

extension UIView {

    func createBasicView(cornerRadius: CGFloat) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 0.08
        self.layer.masksToBounds = false
        return self
    }

    func createContainerForImageView() -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 25
        self.clipsToBounds = true
        self.backgroundColor = UIColor(named: "primaryColor")
        return self
    }
}
