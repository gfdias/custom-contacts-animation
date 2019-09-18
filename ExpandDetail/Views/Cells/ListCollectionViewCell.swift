import UIKit

class ListCollectionViewCell: UICollectionViewCell {
  
  // MARK: - Outlets
  
  weak var titleLabel: UILabel!
  weak var avatarImageView: UIImageView!
  weak var lineView: UIView!
  
  // MARK: - Properties
  
  static var identifier: String = "ListCell"
  
  // MARK: - Lifecycle
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.translatesAutoresizingMaskIntoConstraints = false
    
    let titleLabel = UILabel()
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.font = UIFont.systemFont(ofSize: 25.0)
    
    let avatarImageView = UIImageView()
    avatarImageView.layer.masksToBounds = true
    avatarImageView.clipsToBounds = true
    avatarImageView.contentMode = .scaleAspectFill
    avatarImageView.translatesAutoresizingMaskIntoConstraints = false
    avatarImageView.layer.borderWidth = 1.0
    avatarImageView.layer.borderColor = UIColor.black.withAlphaComponent(0.6).cgColor
    
    
    
    let lineView = UIView()
    lineView.translatesAutoresizingMaskIntoConstraints = false
    lineView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.4)
    
    self.contentView.addSubview(titleLabel)
    self.contentView.addSubview(avatarImageView)
    self.contentView.addSubview(lineView)
    
    NSLayoutConstraint.activate(
      [
        avatarImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
        avatarImageView.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -20),
        avatarImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
        avatarImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
        avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor, multiplier: 1.0/1.0),
        self.contentView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
        lineView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        lineView.heightAnchor.constraint(equalToConstant: 0.5),
        lineView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
        lineView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20)
      ]
    )
    self.titleLabel = titleLabel
    self.avatarImageView = avatarImageView
    self.lineView = lineView
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Setup
  
  func setup(with contact: Contact) {
    titleLabel.text = contact.firstName
    avatarImageView.image = contact.image
    avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
    avatarImageView.layer.shadowColor = UIColor.gray.cgColor
    avatarImageView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
    avatarImageView.layer.shadowRadius = avatarImageView.frame.height / 2
    avatarImageView.layer.shadowOpacity = 0.4
    avatarImageView.layer.masksToBounds = true
  }
}
