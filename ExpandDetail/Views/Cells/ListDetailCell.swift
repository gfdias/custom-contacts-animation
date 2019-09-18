import UIKit

class ListDetailCell: UICollectionViewCell {
  
  // MARK: - Outlets
  
  weak private var titleLabel: UILabel!
  weak private var subtitleLabel: UILabel!
  weak private var lineView: UIView!
  
  // MARK: - Properties
  
  static var identifier: String = "DetailCell"
  
  // MARK: - Lifecycle
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    let titleLabel = UILabel(frame: .zero)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
    titleLabel.textColor = UIColor.darkGray.withAlphaComponent(0.7)
    
    let subtitleLabel = UILabel(frame: .zero)
    subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
    subtitleLabel.font = UIFont.systemFont(ofSize: 25.0)

    let lineView = UIView()
    lineView.translatesAutoresizingMaskIntoConstraints = false
    lineView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.4)
    
    self.contentView.addSubview(titleLabel)
    self.contentView.addSubview(subtitleLabel)
    self.contentView.addSubview(lineView)

    NSLayoutConstraint.activate(
      [
        titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
        self.contentView.topAnchor.constraint(equalTo: titleLabel.topAnchor),
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
        subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
        lineView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 5),
        lineView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        lineView.leadingAnchor.constraint(equalTo: subtitleLabel.leadingAnchor),
        lineView.heightAnchor.constraint(equalToConstant: 0.5),
        lineView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20)
      ]
    )
    
    self.titleLabel = titleLabel
    self.subtitleLabel = subtitleLabel
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Setup
  
  func setup(with title: String, subtitle: String) {
    self.titleLabel.text = title
    self.subtitleLabel.text = subtitle
  }
}
