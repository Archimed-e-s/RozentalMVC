import UIKit

class DashboardCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Private properties
    
    lazy var bannerImageView = {
        let image = UIImageView(image: UIImage(systemName: "nosign.app"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.tintColor = .lightGray
        return image
    }()
    
    lazy var titleLabel = {
        let label = UILabel()
        return label.createPriamryLabel(text: "Уведомления", fontName: "Arial", fontSize: 16, nil)
    }()
    
    lazy var descriptionLabel = {
        let label = UILabel()
        return label.createSecondaryLabel(text: "Описание", fontName: "Arial", fontSize: 14, nil)
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setConstraints()
        contentView.backgroundColor = .white
        contentView.layer.masksToBounds = false
        contentView.layer.cornerRadius = Constants.cornerRadiusButton
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 0)
        contentView.layer.shadowRadius = 5.0
        contentView.layer.shadowOpacity = 0.1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.bannerImageView.image = nil
        self.titleLabel.text = nil
        self.descriptionLabel.text = nil
    }
    
    // MARK: - Private Methods
    
    private func addSubviews() {
        [
            bannerImageView,
            titleLabel,
            descriptionLabel
        ].forEach{ contentView.addSubview($0) }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            bannerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            bannerImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            bannerImageView.widthAnchor.constraint(equalToConstant: Constants.bannerImageViewFrame),
            bannerImageView.heightAnchor.constraint(equalToConstant: Constants.bannerImageViewFrame),
            
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10),
            titleLabel.leadingAnchor.constraint(equalTo: bannerImageView.trailingAnchor, constant: 10),
            titleLabel.widthAnchor.constraint(equalToConstant: Constants.titleAndDescriptionLabelWidth),
            
            descriptionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: bannerImageView.trailingAnchor, constant: 10),
            descriptionLabel.widthAnchor.constraint(equalToConstant: Constants.titleAndDescriptionLabelWidth),
        ])
    }
}
