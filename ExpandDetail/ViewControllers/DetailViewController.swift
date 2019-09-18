import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    
    var containerView = UIView()
    var imageView = UIImageView()
    var label = UILabel()
    var lineView = UIView()

    private var contact: Contact
    
    // MARK: - Initializers
    
    init(contact: Contact) {
        self.contact = contact
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        setupLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.largeTitleDisplayMode = .never
        self.view.backgroundColor = .white
        self.view.bringSubviewToFront(containerView)
        setupCollectionView()
    }
    
    // MARK: - Layout
    
    private func setupLayout() {
        setupContainerViewLayout()
        setupImageViewLayout()
        setupLabelLayout()
        setupLineViewLayout()
        setupCollectionViewLayout()
    }
    
    private func setupContainerViewLayout() {
        let containerView = UIView(frame: .zero)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(containerView)
        
        NSLayoutConstraint.activate(
            [
                self.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: containerView.topAnchor),
                self.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                self.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
            ]
        )
        
        self.containerView = containerView
        self.containerView.backgroundColor = .white
    }
    
    private func setupImageViewLayout() {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.containerView.addSubview(imageView)
        
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.black.withAlphaComponent(0.6).cgColor
        
        NSLayoutConstraint.activate(
            [
                imageView.heightAnchor.constraint(equalToConstant: 80),
                imageView.widthAnchor.constraint(equalToConstant: 80),
                imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
                imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            ]
        )
        
        imageView.image = contact.image
        self.imageView = imageView
    }
    
    private func setupLabelLayout() {
        
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        self.containerView.addSubview(label)
        
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        
        NSLayoutConstraint.activate(
            [
                label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
                label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),

            ]
        )
        label.text = contact.fullName
        self.label = label
    }
    
    private func setupLineViewLayout() {
        let lineView = UIView(frame: .zero)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(lineView)
        
        lineView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.4)
        
        NSLayoutConstraint.activate(
            [
                lineView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
                lineView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
                containerView.leftAnchor.constraint(equalTo: lineView.leftAnchor, constant: -16),
                lineView.heightAnchor.constraint(equalToConstant: 1),
                containerView.bottomAnchor.constraint(equalTo: lineView.bottomAnchor)
            ]
        )
        
        self.lineView = lineView
    }
    
    private func setupCollectionViewLayout() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(collectionView)
        
        NSLayoutConstraint.activate(
            [
                self.view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
                self.view.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
                self.view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
                containerView.bottomAnchor.constraint(equalTo: collectionView.topAnchor)
            ]
        )
        self.collectionView = collectionView
    }
    
    // MARK: - CollectionView
    
    private func setupCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(
            ListDetailCell.self,
            forCellWithReuseIdentifier: ListDetailCell.identifier
        )
        self.collectionView.alwaysBounceVertical = true
        self.collectionView.backgroundColor = .white
    }
}

// MARK: - UICollectionViewDataSource

extension DetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ListDetailCell.identifier,
            for: indexPath) as! ListDetailCell
        switch indexPath.row {
        case 0:
            cell.setup(with : "First name", subtitle: contact.firstName)
        case 1:
            cell.setup(with : "Last name", subtitle: contact.lastName)
        case 2:
            cell.setup(with : "Phone", subtitle: contact.phone)
        case 3:
            cell.setup(with : "Company", subtitle: contact.company)
        default:
            break
        }
        
        return cell
    }
}


// MARK: - UICollectionViewDelegateFlowLayout

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
}

