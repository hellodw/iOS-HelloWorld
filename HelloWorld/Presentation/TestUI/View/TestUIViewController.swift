//
//  TestUIViewController.swift
//  HelloWorld
//
//  Created by maverick.b on 2022/07/18.
//

import UIKit
import SnapKit

final class TestUIViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tb = UITableView(frame: .zero)
        tb.separatorStyle = .none
        tb.delegate = self
        tb.dataSource = self
        return tb
    }()
    
    override func loadView() {
        super.loadView()
        
        tableView.register(class: GlobalMoreItemTableViewCell.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
    }
}

extension TestUIViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GlobalMoreItemTableViewCell", for: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GlobalMoreItemTableViewCell", for: indexPath) as! GlobalMoreItemTableViewCell
            if #available(iOS 15.0, *) {
                cell.itemButton.configuration = .none
            } else {
                // Fallback on earlier versions
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
}






extension UITableView {
    func register<T>(class: T.Type) where T: UITableViewCell {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: String(describing: T.self), bundle: bundle)
        self.register(nib, forCellReuseIdentifier: String(describing: T.self))
    }
}
