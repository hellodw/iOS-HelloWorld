//
//  GlobalMoreItemTableViewCell.swift
//  -
//
//  Created by -
//  -
//

import UIKit
import Combine

class GlobalMoreItemTableViewCell: UITableViewCell {
  
  @IBOutlet private weak var iconImageView: UIImageView!
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet weak var itemButton: UIButton!
  
  var subscriptions = Set<AnyCancellable>()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    subscriptions = Set<AnyCancellable>()
  }
  
//  func bind(_ viewModel: HashableTableViewItem) {
//    guard let vm = viewModel as? GlobalMoreItemCellViewModel else { return }
//    iconImageView.image = UIImage(named: vm.iconName)
//    titleLabel.text = vm.title
//    itemButton.tapPublisher
//      .sink { _ in
//        vm.itemTapped.send()
//      }
//      .store(in: &subscriptions)
//  }
}

//class GlobalMoreItemCellViewModel: HashableTableViewItem {
//  override var height: CGFloat { 49 }
//  var iconName: String
//  var title: String
//  var itemTapped: PassthroughSubject<Void, Never>
//
//  init(item: GlobalMoreItem) {
//    self.iconName = item.iconName
//    self.title = item.title
//    self.itemTapped = item.itemTapped
//  }
//}
