import UIKit

final class DashboardViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let gestureRecognizer = UITapGestureRecognizer()

    // MARK: - Header

    private lazy var profilePhoto: UIImageView = {
        let image = UIImageView()
        return image.createImageInsideContainer(imageName: "person.circle", cornerRadius: Constants.avatarImageFrameSize)
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label.createPriamryLabel(text: "Unknown Name", fontName: "Arial-BoldMT", fontSize: 32, .white)
    }()

    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        return label.createPriamryLabel(text: "Unknown address", fontName: "Arial", fontSize: 14, .white)
    }()
    
    private lazy var arrowDownView: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "chevron.down")?.withRenderingMode(.alwaysTemplate))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .white
        image.isUserInteractionEnabled = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var notificationsContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(gestureRecognizer)
        gestureRecognizer.addTarget(self, action: #selector(pushTasksViewController))
        return view
    }()
    
    private lazy var notificationBellImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "bell")?.withRenderingMode(.alwaysTemplate))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        return image
    }()
    private lazy var notificationCounterAreaView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "notificationColor")
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var notificationCounterLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label.createPriamryLabel(text: "0", fontName: "Arial-BoldMT", fontSize: 10, .white)
    }()
    
    // MARK: - MainView

    private lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var nowadayLabel: UILabel = {
        let label = UILabel()
        return label.createPriamryLabel(text: "Сегодня", fontName: "Arial-BoldMT", fontSize: 24, nil)
    }()
    
    private lazy var nowadayLabelCount: UILabel = {
        let label = UILabel()
        return label.createSecondaryLabel(text: "1 января", fontName: "Arial-BoldMT", fontSize: 24, nil)
    }()
    
    private lazy var counterNotificationsView: UIView = {
        let view = UIView()
        return view.createBasicView(cornerRadius: 10)
    }()
    
    private lazy var countNotificationsLabel: UILabel = {
        let label = UILabel()
        return label.createPriamryLabel(text: "сообщения от УК", fontName: "Arial", fontSize: 18, nil)
    }()

    private lazy var isReadedNotificationsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "notificationColor")
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 3
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var paymentItemsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var paymentView: UIView = {
        let view = UIView()
        return view.createContainerForImageView()
    }()
    
    private lazy var paymentImage: UIImageView = {
        let image = UIImageView()
        return image.createImageInsideContainer(imageName: "income", cornerRadius: Constants.basicImageFrameSize)
    }()
    
    private lazy var paymentLabel: UILabel = {
        let label = UILabel()
        return label.createPriamryLabel(text: "Квартплата", fontName: "Arial-BoldMT", fontSize: 16, nil)
    }()
    
    private lazy var descriptionPaymentLabel: UILabel = {
        let label = UILabel()
        return label.createSecondaryLabel(text: "Оплатить", fontName: "Arial", fontSize: 14, nil)
    }()
    
    private lazy var paymentCountLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var metersItemsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var metersView: UIView = {
        let view = UIView()
        return view.createContainerForImageView()
    }()
    
    private lazy var metersImage: UIImageView = {
        let image = UIImageView()
        return image.createImageInsideContainer(imageName: "tachometer", cornerRadius: Constants.basicImageFrameSize)
    }()
    
    private lazy var metersLabel: UILabel = {
        let label = UILabel()
        return label.createPriamryLabel(text: "Показания счетчиков", fontName: "Arial-BoldMT", fontSize: 16, nil)
    }()
    
    private lazy var descriptionMetersLabel: UILabel = {
        let label = UILabel()
        return label.createSecondaryLabel(text: "Отправить", fontName: "Arial", fontSize: 14, nil)
    }()
    
    private lazy var expectedMetersIndicatorImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "bolt.fill")?.withRenderingMode(.alwaysTemplate)
        image.contentMode = .scaleAspectFit
        image.tintColor = .black
        image.backgroundColor = UIColor(named: "mainViewBackgroundColor")
        return image
    }()
    
    // MARK: - Banners

    private lazy var bannersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 25
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(DashboardCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        return collectionView
    }()
    
    // MARK: - Services

    // first
    private lazy var firstServiceItemsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor(named: "mainViewBackgroundColor")
        return view
    }()
    
    private lazy var firstServiceImageContainerView: UIView = {
        let view = UIView()
        return view.createContainerForImageView()
    }()

    private lazy var firstServiceImage: UIImageView = {
        let image = UIImageView()
        return image.createImageInsideContainer(imageName: "number.circle.fill", cornerRadius: Constants.basicImageFrameSize)
    }()
    
    private lazy var firstServiceLabel: UILabel = {
        let label = UILabel()
        return label.createPriamryLabel(text: "Сервис 1", fontName: "Arial-BoldMT", fontSize: 16, nil)
    }()
    
    // second
    private lazy var secondServiceItemsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor(named: "mainViewBackgroundColor")
        return view
    }()
    
    private lazy var secondServiceImageContainerView: UIView = {
        let view = UIView()
        return view.createContainerForImageView()
    }()
    
    private lazy var secondServiceImage: UIImageView = {
        let image = UIImageView()
        return image.createImageInsideContainer(imageName: "doc.fill", cornerRadius: Constants.basicImageFrameSize)
    }()
    
    private lazy var secondServiceLabel: UILabel = {
        let label = UILabel()
        return label.createPriamryLabel(text: "Сервис 2", fontName: "Arial-BoldMT", fontSize: 16, nil)
    }()
    
    // third
    private lazy var thirdServiceItemsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor(named: "mainViewBackgroundColor")
        return view
    }()
    
    private lazy var thirdServiceImageContainerView: UIView = {
        let view = UIView()
        return view.createContainerForImageView()
    }()
    
    private lazy var thirdServiceImage: UIImageView = {
        let image = UIImageView()
        return image.createImageInsideContainer(imageName: "sun.max.fill", cornerRadius: Constants.basicImageFrameSize)
    }()

    private lazy var thirdServiceLabel: UILabel = {
        let label = UILabel()
        return label.createPriamryLabel(text: "Сервис 3", fontName: "Arial-BoldMT", fontSize: 16, nil)
    }()
    
    // All Services Button
    private lazy var showAllServicesButton: UIButton = {
        let button = UIButton(type: .system)
        return button.createCustomButton(setTitle: "Все сервисы", backgroundColor: UIColor(named: "alertColor"), setTitleColor: .black, borderWidth: 0)
    }()
    
    // MARK: - App Service and model

    private let networkService = NetworkService.shared
    private var bannersModel = [Banners]()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "primaryColor")
        navigationItem.hidesBackButton = true;
        fetchData()
        addSubviews()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        bannersCollectionView.reloadData()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - Private Methods

    private func addSubviews() {
        
        //header
        [
            profilePhoto,
            nameLabel,
            addressLabel,
            notificationsContentView,
            arrowDownView,
            mainView,
        ].forEach{ view.addSubview($0) }
        
        [
            notificationBellImage,
            notificationCounterAreaView,
        ].forEach{ notificationsContentView.addSubview($0) }
        
        // mainView
        [
            nowadayLabel,
            nowadayLabelCount,
            counterNotificationsView,
            paymentItemsView,
            metersItemsView,
            bannersCollectionView,
            firstServiceItemsView,
            secondServiceItemsView,
            thirdServiceItemsView,
            showAllServicesButton,
        ].forEach{ mainView.addSubview($0) }
        
        notificationCounterAreaView.addSubview(notificationCounterLabel)
        counterNotificationsView.addSubview(countNotificationsLabel)
        counterNotificationsView.addSubview(isReadedNotificationsView)
        
        // menu items
        [
            paymentView,
            paymentLabel,
            descriptionPaymentLabel,
            paymentCountLabel
        ].forEach{ paymentItemsView.addSubview($0) }
        paymentView.addSubview(paymentImage)
        metersView.addSubview(metersImage)
        
        [
            metersView,
            metersImage,
            metersLabel,
            descriptionMetersLabel,
            expectedMetersIndicatorImage,
        ].forEach{ metersItemsView.addSubview($0) }
        
        //first service
        [
            firstServiceImageContainerView,
            firstServiceImage,
            firstServiceLabel,
        ].forEach{ firstServiceItemsView.addSubview($0) }
        
        //second service
        [
            secondServiceImageContainerView,
            secondServiceImage,
            secondServiceLabel,
        ].forEach{ secondServiceItemsView.addSubview($0) }
        
        //third service
        [
            thirdServiceImageContainerView,
            thirdServiceImage,
            thirdServiceLabel,
        ].forEach{ thirdServiceItemsView.addSubview($0) }
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            // Header
            profilePhoto.topAnchor.constraint(equalTo: view.topAnchor, constant: 77),
            profilePhoto.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            profilePhoto.widthAnchor.constraint(equalToConstant: Constants.avatarImageFrameSize),
            profilePhoto.heightAnchor.constraint(equalToConstant: Constants.avatarImageFrameSize),
            
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 77),
            nameLabel.leadingAnchor.constraint(equalTo: profilePhoto.trailingAnchor, constant: 20),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 14),
            addressLabel.leadingAnchor.constraint(equalTo: profilePhoto.trailingAnchor, constant: 20),
            addressLabel.widthAnchor.constraint(equalToConstant: 220),
            addressLabel.heightAnchor.constraint(equalToConstant: 14),
            
            notificationsContentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 77),
            notificationsContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            notificationsContentView.widthAnchor.constraint(equalToConstant: 27),
            notificationsContentView.heightAnchor.constraint(equalToConstant: 30),
            
            notificationBellImage.topAnchor.constraint(equalTo: notificationsContentView.topAnchor),
            notificationBellImage.leadingAnchor.constraint(equalTo: notificationsContentView.leadingAnchor),
            notificationBellImage.trailingAnchor.constraint(equalTo: notificationsContentView.trailingAnchor),
            notificationBellImage.bottomAnchor.constraint(equalTo: notificationsContentView.bottomAnchor),
            
            notificationCounterAreaView.topAnchor.constraint(equalTo: notificationsContentView.topAnchor, constant: -5),
            notificationCounterAreaView.trailingAnchor.constraint(equalTo: notificationsContentView.trailingAnchor, constant: 4),
            notificationCounterAreaView.widthAnchor.constraint(equalToConstant: 19),
            notificationCounterAreaView.heightAnchor.constraint(equalToConstant: 19),
            
            notificationCounterLabel.centerXAnchor.constraint(equalTo: notificationCounterAreaView.centerXAnchor),
            notificationCounterLabel.centerYAnchor.constraint(equalTo: notificationCounterAreaView.centerYAnchor),
            
            arrowDownView.centerYAnchor.constraint(equalTo: addressLabel.centerYAnchor),
            arrowDownView.leadingAnchor.constraint(equalTo: addressLabel.trailingAnchor),
            arrowDownView.widthAnchor.constraint(equalToConstant: 15),
            arrowDownView.heightAnchor.constraint(equalToConstant: 12),
            
            // MainView
            mainView.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            nowadayLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 30),
            nowadayLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            nowadayLabel.heightAnchor.constraint(equalToConstant: 26),
            
            nowadayLabelCount.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 30),
            nowadayLabelCount.leadingAnchor.constraint(equalTo: nowadayLabel.trailingAnchor, constant: 10),
            nowadayLabelCount.heightAnchor.constraint(equalToConstant: 26),
            
            counterNotificationsView.topAnchor.constraint(equalTo: nowadayLabel.bottomAnchor, constant: 15),
            counterNotificationsView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            counterNotificationsView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            counterNotificationsView.heightAnchor.constraint(equalToConstant: Constants.basicImageViewFrameSize),
            
            countNotificationsLabel.centerYAnchor.constraint(equalTo: counterNotificationsView.centerYAnchor),
            countNotificationsLabel.leadingAnchor.constraint(equalTo: counterNotificationsView.leadingAnchor, constant: 8),
            countNotificationsLabel.heightAnchor.constraint(equalToConstant: 18),
            
            isReadedNotificationsView.centerYAnchor.constraint(equalTo: counterNotificationsView.centerYAnchor),
            isReadedNotificationsView.trailingAnchor.constraint(equalTo: counterNotificationsView.trailingAnchor, constant: -8),
            isReadedNotificationsView.heightAnchor.constraint(equalToConstant: 7),
            isReadedNotificationsView.widthAnchor.constraint(equalToConstant: 7),
            
            paymentItemsView.topAnchor.constraint(equalTo: counterNotificationsView.bottomAnchor, constant: 25),
            paymentItemsView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            paymentItemsView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            paymentItemsView.heightAnchor.constraint(equalToConstant: Constants.itemViewHeightSize),
            
            paymentView.leadingAnchor.constraint(equalTo: paymentItemsView.leadingAnchor),
            paymentView.heightAnchor.constraint(equalToConstant: Constants.basicImageViewFrameSize),
            paymentView.widthAnchor.constraint(equalToConstant: Constants.basicImageViewFrameSize),
            paymentView.centerYAnchor.constraint(equalTo: paymentItemsView.centerYAnchor),
            
            paymentImage.centerXAnchor.constraint(equalTo: paymentView.centerXAnchor),
            paymentImage.centerYAnchor.constraint(equalTo: paymentView.centerYAnchor),
            paymentImage.heightAnchor.constraint(equalToConstant: Constants.basicImageFrameSize),
            paymentImage.widthAnchor.constraint(equalToConstant: Constants.basicImageFrameSize),
            
            paymentLabel.leadingAnchor.constraint(equalTo: paymentView.trailingAnchor, constant: 10),
            paymentLabel.topAnchor.constraint(equalTo: paymentItemsView.topAnchor, constant: 10),
            paymentLabel.heightAnchor.constraint(equalToConstant: 16),
            
            descriptionPaymentLabel.leadingAnchor.constraint(equalTo: paymentView.trailingAnchor, constant: 10),
            descriptionPaymentLabel.bottomAnchor.constraint(equalTo: paymentItemsView.bottomAnchor, constant: -10),
            descriptionPaymentLabel.heightAnchor.constraint(equalToConstant: 14),
            
            paymentCountLabel.centerYAnchor.constraint(equalTo: paymentItemsView.centerYAnchor),
            paymentCountLabel.trailingAnchor.constraint(equalTo: paymentItemsView.trailingAnchor),
            paymentCountLabel.heightAnchor.constraint(equalToConstant: 20),
            
            metersItemsView.topAnchor.constraint(equalTo: paymentItemsView.bottomAnchor, constant: 15),
            metersItemsView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            metersItemsView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            metersItemsView.heightAnchor.constraint(equalToConstant: Constants.itemViewHeightSize),
            
            metersView.leadingAnchor.constraint(equalTo: metersItemsView.leadingAnchor),
            metersView.heightAnchor.constraint(equalToConstant: Constants.basicImageViewFrameSize),
            metersView.widthAnchor.constraint(equalToConstant: Constants.basicImageViewFrameSize),
            metersView.centerYAnchor.constraint(equalTo: metersItemsView.centerYAnchor),
            
            metersImage.centerXAnchor.constraint(equalTo: metersView.centerXAnchor),
            metersImage.centerYAnchor.constraint(equalTo: metersView.centerYAnchor),
            metersImage.heightAnchor.constraint(equalToConstant: Constants.basicImageFrameSize),
            metersImage.widthAnchor.constraint(equalToConstant: Constants.basicImageFrameSize),
            
            metersLabel.leadingAnchor.constraint(equalTo: metersView.trailingAnchor, constant: 10),
            metersLabel.topAnchor.constraint(equalTo: metersItemsView.topAnchor, constant: 10),
            metersLabel.heightAnchor.constraint(equalToConstant: 16),
            
            descriptionMetersLabel.leadingAnchor.constraint(equalTo: metersView.trailingAnchor, constant: 10),
            descriptionMetersLabel.bottomAnchor.constraint(equalTo: metersItemsView.bottomAnchor, constant: -10),
            descriptionMetersLabel.heightAnchor.constraint(equalToConstant: 14),
            
            expectedMetersIndicatorImage.topAnchor.constraint(equalTo: metersItemsView.topAnchor, constant: 10),
            expectedMetersIndicatorImage.trailingAnchor.constraint(equalTo: metersItemsView.trailingAnchor, constant: -10),
            expectedMetersIndicatorImage.widthAnchor.constraint(equalToConstant: Constants.meterIndicatorHeightSize),
            expectedMetersIndicatorImage.heightAnchor.constraint(equalToConstant: Constants.meterIndicatorHeightSize),
            
            // UICollectionView
            bannersCollectionView.topAnchor.constraint(equalTo: metersItemsView.bottomAnchor, constant: 20),
            bannersCollectionView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            bannersCollectionView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            bannersCollectionView.heightAnchor.constraint(equalToConstant:80),
            
            // first service
            firstServiceItemsView.topAnchor.constraint(equalTo: bannersCollectionView.bottomAnchor, constant: 20),
            firstServiceItemsView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            firstServiceItemsView.widthAnchor.constraint(equalToConstant: Constants.serviceViewWidth),
            firstServiceItemsView.heightAnchor.constraint(equalToConstant: Constants.serviceViewHeight),
            
            firstServiceImageContainerView.centerYAnchor.constraint(equalTo: firstServiceItemsView.centerYAnchor, constant: Constants.serviceImageContainerViewOffset),
            firstServiceImageContainerView.centerXAnchor.constraint(equalTo: firstServiceItemsView.centerXAnchor),
            firstServiceImageContainerView.widthAnchor.constraint(equalToConstant: Constants.serviceImageContainerViewFrame),
            firstServiceImageContainerView.heightAnchor.constraint(equalToConstant: Constants.serviceImageContainerViewFrame),
            
            firstServiceImage.centerXAnchor.constraint(equalTo: firstServiceImageContainerView.centerXAnchor),
            firstServiceImage.centerYAnchor.constraint(equalTo: firstServiceImageContainerView.centerYAnchor),
            firstServiceImage.widthAnchor.constraint(equalToConstant: Constants.serviceImageFrame),
            firstServiceImage.heightAnchor.constraint(equalToConstant: Constants.serviceImageFrame),
            
            firstServiceLabel.topAnchor.constraint(equalTo: firstServiceImageContainerView.bottomAnchor, constant: Constants.serviceLabelTopAnchor),
            firstServiceLabel.centerXAnchor.constraint(equalTo: firstServiceItemsView.centerXAnchor),
            
            // second service
            secondServiceItemsView.topAnchor.constraint(equalTo: bannersCollectionView.bottomAnchor, constant: 20),
            secondServiceItemsView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            secondServiceItemsView.widthAnchor.constraint(equalToConstant: Constants.serviceViewWidth),
            secondServiceItemsView.heightAnchor.constraint(equalToConstant: Constants.serviceViewHeight),
            
            secondServiceImageContainerView.centerYAnchor.constraint(equalTo: secondServiceItemsView.centerYAnchor, constant: Constants.serviceImageContainerViewOffset),
            secondServiceImageContainerView.centerXAnchor.constraint(equalTo: secondServiceItemsView.centerXAnchor),
            secondServiceImageContainerView.widthAnchor.constraint(equalToConstant: Constants.serviceImageContainerViewFrame),
            secondServiceImageContainerView.heightAnchor.constraint(equalToConstant: Constants.serviceImageContainerViewFrame),
            
            secondServiceImage.centerXAnchor.constraint(equalTo: secondServiceImageContainerView.centerXAnchor),
            secondServiceImage.centerYAnchor.constraint(equalTo: secondServiceImageContainerView.centerYAnchor),
            secondServiceImage.widthAnchor.constraint(equalToConstant: Constants.serviceImageFrame),
            secondServiceImage.heightAnchor.constraint(equalToConstant: Constants.serviceImageFrame),
            
            secondServiceLabel.topAnchor.constraint(equalTo: secondServiceImageContainerView.bottomAnchor, constant: Constants.serviceLabelTopAnchor),
            secondServiceLabel.centerXAnchor.constraint(equalTo: secondServiceItemsView.centerXAnchor),
            
            // third service
            thirdServiceItemsView.topAnchor.constraint(equalTo: bannersCollectionView.bottomAnchor, constant: 20),
            thirdServiceItemsView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            thirdServiceItemsView.widthAnchor.constraint(equalToConstant: Constants.serviceViewWidth),
            thirdServiceItemsView.heightAnchor.constraint(equalToConstant: Constants.serviceViewHeight),
            
            thirdServiceImageContainerView.centerYAnchor.constraint(equalTo: thirdServiceItemsView.centerYAnchor, constant: Constants.serviceImageContainerViewOffset),
            thirdServiceImageContainerView.centerXAnchor.constraint(equalTo: thirdServiceItemsView.centerXAnchor),
            thirdServiceImageContainerView.widthAnchor.constraint(equalToConstant: Constants.serviceImageContainerViewFrame),
            thirdServiceImageContainerView.heightAnchor.constraint(equalToConstant: Constants.serviceImageContainerViewFrame),
            
            thirdServiceImage.centerXAnchor.constraint(equalTo: thirdServiceImageContainerView.centerXAnchor),
            thirdServiceImage.centerYAnchor.constraint(equalTo: thirdServiceImageContainerView.centerYAnchor),
            thirdServiceImage.widthAnchor.constraint(equalToConstant: Constants.serviceImageFrame),
            thirdServiceImage.heightAnchor.constraint(equalToConstant: Constants.serviceImageFrame),
            
            thirdServiceLabel.topAnchor.constraint(equalTo: thirdServiceImageContainerView.bottomAnchor, constant: Constants.serviceLabelTopAnchor),
            thirdServiceLabel.centerXAnchor.constraint(equalTo: thirdServiceItemsView.centerXAnchor),
            
            // All services button
            showAllServicesButton.topAnchor.constraint(equalTo: thirdServiceItemsView.bottomAnchor, constant: 20),
            showAllServicesButton.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            showAllServicesButton.widthAnchor.constraint(equalToConstant: Constants.widthButton),
            showAllServicesButton.heightAnchor.constraint(equalToConstant: Constants.heightButton),
        ])
    }
    
    private func fetchData() {
        networkService.generateDashboardRequest(expecting: DashboardDataModel.self) { result in
            switch result {
            case .success(let model):
                let url = model.myProfile.photo
                self.fetchImage(url: url, image: self.profilePhoto)
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    nameLabel.text = model.myProfile.shortName
                    addressLabel.text = model.myProfile.address
                    notificationCounterLabel.text = String(model.myNewNotifications)
                    nowadayLabelCount.text = model.customerDashboard.date
                    countNotificationsLabel.text = String("\(model.customerDashboard.menuItems.count) сообщения от УК")
                    paymentLabel.text = model.customerDashboard.menuItems[0].name
                    paymentCountLabel.attributedText = paymentCountLabel.createCounterLabel(countWithPoint: "\(model.customerDashboard.menuItems[0].arrear ?? "0.00")")
                    descriptionPaymentLabel.text = model.customerDashboard.menuItems[0].description
                    metersLabel.text = model.customerDashboard.menuItems[1].name
                    descriptionMetersLabel.text = model.customerDashboard.menuItems[1].description
                    let banners = model.customerDashboard.banners
                    for banner in banners {
                        bannersModel.append(banner)
                    }
                    bannersCollectionView.reloadData()
                    firstServiceLabel.text = model.customerDashboard.services[0].name
                    secondServiceLabel.text = model.customerDashboard.services[1].name
                    thirdServiceLabel.text = model.customerDashboard.services[2].name
                }
                print(model)
            case .failure(let error):
                DispatchQueue.main.sync {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func fetchImage(url: URL, image: UIImageView) {
        URLSession.shared.dataTask(with: url) { data, _, _ in
              guard let imageData = data else { return }
              DispatchQueue.main.async {
                  image.image = UIImage(data: imageData)
              }
        }.resume()
    }
    
    @objc private func pushTasksViewController() {
        let taskViewController = TasksViewController()
        navigationController?.present(taskViewController, animated: true)
    }
}

// MARK: - UICollectionViewDataSource

extension DashboardViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        bannersModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as? DashboardCollectionViewCell else
        { return UICollectionViewCell.init() }
        cell.titleLabel.text = bannersModel[indexPath.row].title
        cell.descriptionLabel.text = bannersModel[indexPath.row].text
        let url = URL(string: bannersModel[indexPath.row].image)
        URLSession.shared.dataTask(with: url!) { data, _, _ in
            guard let imageData = data else { return }
            DispatchQueue.main.async {
                cell.bannerImageView.image = UIImage(data: imageData)
            }
        }.resume()
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension DashboardViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.width - 30
        return CGSize(width: width, height: height)
    }
}

