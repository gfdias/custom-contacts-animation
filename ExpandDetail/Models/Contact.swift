import UIKit

struct Contact {
  
  // MARK: - Properties
  
  var firstName: String
  var lastName: String
  var image: UIImage
  var phone: String
  var company: String
  
  var fullName: String {
    return "\(firstName) \(lastName)"
  }
  
  static let contactList: [Contact] =
    [
      Contact(
        firstName: "Anne",
        lastName: "Morris",
        image: UIImage(named: "1.jpg")!,
        phone: "931 232 134",
        company: "Alpha"
      ),
      Contact(
        firstName: "Jimmy",
        lastName: "Moore",
        image: UIImage(named: "2.jpg")!,
        phone: "911 156 434",
        company: "Beta"
      ),
      Contact(
        firstName: "Alex",
        lastName: "Platz",
        image: UIImage(named: "3.jpg")!,
        phone: "933 682 464",
        company: "Gamma"
      ),
      Contact(
        firstName: "Lilly",
        lastName: "Andrews",
        image: UIImage(named: "4.jpg")!,
        phone: "967 963 426",
        company: "Alpha"
      ),
      Contact(
        firstName: "Cristine",
        lastName: "Spark",
        image: UIImage(named: "5.jpg")!,
        phone: "913 788 633",
        company: "Beta"
      ),
      Contact(
        firstName: "Sandra",
        lastName: "Melody",
        image: UIImage(named: "6.jpg")!,
        phone: "924 763 634",
        company: "Gama"
      ),
      Contact(
        firstName: "Bob",
        lastName: "Ross",
        image: UIImage(named: "7.jpg")!,
        phone: "983 547 435",
        company: "Alpha"
      ),
  ]
}
