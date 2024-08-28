import UIKit

extension UIImageView {
    func createImageInsideContainer(imageName: String, cornerRadius: CGFloat) -> UIImageView {
        self.image = UIImage(named: imageName)?
            .withRenderingMode(.alwaysTemplate)
        ?? UIImage(systemName: imageName)?
            .withRenderingMode(.alwaysTemplate)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .scaleAspectFit
        self.tintColor = .white
        self.backgroundColor = UIColor(named: "primaryColor")
        self.layer.masksToBounds = false
        self.layer.cornerRadius = cornerRadius / 2
        self.clipsToBounds = true
        return self
    }
}
