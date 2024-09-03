import UIKit

extension UILabel {
    func createPriamryLabel(text: String, fontName: String, fontSize: CGFloat, _ textColor: UIColor?) -> UILabel {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.sizeToFit()
        self.textAlignment = .left
        self.text = text
        self.numberOfLines = 1
        self.font = UIFont(name: fontName, size: fontSize)
        self.textColor? = textColor ?? .black
        self.minimumScaleFactor = 0.3
        self.adjustsFontSizeToFitWidth = true
        return self
    }

    func createSecondaryLabel(text: String, fontName: String, fontSize: CGFloat, _ textColor: UIColor?) -> UILabel {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.sizeToFit()
        self.textAlignment = .left
        self.text = text
        self.numberOfLines = 2
        self.font = UIFont(name: fontName, size: fontSize)
        self.minimumScaleFactor = 0.5
        self.adjustsFontSizeToFitWidth = true
        self.textColor? = textColor ?? .lightGray
        return self
    }

    func createCounterLabel(countWithPoint: String) -> NSAttributedString {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.numberOfLines = 1
        self.font = UIFont(name: "Arial", size: 20)
        self.textAlignment = .right
        let rghtSide = Double(countWithPoint)
        let leftSide = (countWithPoint as NSString).integerValue
        let rightSide = Int(rghtSide!.truncatingRemainder(dividingBy: 1) * 100)
        let attrs1 = [NSAttributedString.Key.foregroundColor : UIColor.black]
        let attrs2 = [NSAttributedString.Key.foregroundColor : UIColor.lightGray]
        let leftSideString = String("\(leftSide)")
        let rightSideString = String("\(rightSide)")
        let attributedString1 = NSMutableAttributedString(string:leftSideString, attributes:attrs1)
        let attributedString2 = NSMutableAttributedString(string: String(",\(rightSideString) ₽"), attributes:attrs2)
        attributedString1.append(attributedString2)
        return attributedString1
    }
}
