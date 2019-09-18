import UIKit

class ListViewController: UIViewController {
    
    // MARK: - Outlets
    
    weak private var collectionView: UICollectionView!
    
    
    // MARK: - Properties
    
    private var data = Contact.contactList
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        setupLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contacts"
        self.view.backgroundColor = .white
        setupCollectionView()
    }
    
    
    // MARK: - Setup
    
    private func setupLayout() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        
        NSLayoutConstraint.activate(
            [
                self.view.topAnchor.constraint(equalTo: collectionView.topAnchor),
                self.view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
                self.view.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
                self.view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor)
            ]
        )
        
        self.collectionView = collectionView
    }
    
    private func setupCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(
            ListCollectionViewCell.self,
            forCellWithReuseIdentifier: ListCollectionViewCell.identifier
        )
        self.collectionView.alwaysBounceVertical = true
        self.collectionView.backgroundColor = .white
    }
}

// MARK: - UICollectionViewDataSource

extension ListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ListCollectionViewCell.identifier,
            for: indexPath) as! ListCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell = cell as! ListCollectionViewCell
        cell.layoutIfNeeded()
        cell.setup(with: data[indexPath.row])
    }
}


// MARK: - UICollectionViewDelegate

extension ListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController(contact: data[indexPath.row])
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}


// MARK: - UICollectionViewDelegateFlowLayout

extension ListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50)
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
