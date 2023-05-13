//
//  THBubbleCellRight.swift
//  HelloAVF
//
//  Created by 张芳涛 on 2023/5/14.
//

import Foundation
import UIKit
class THBubbleCellRight: UITableViewCell {
    var messageLabel: UILabel?
    var bgImage: UIImageView?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        let screenWidth = UIScreen.main.bounds.width
        bgImage = UIImageView(frame: CGRect(x: 0, y: 2, width: screenWidth - 5, height: 56))
        bgImage?.image = UIImage(named: "bubble_right")
        messageLabel = UILabel(frame: CGRect(x: 5, y: 2, width: screenWidth - 20, height: 56))
        messageLabel?.font = UIFont.systemFont(ofSize: 15)
        messageLabel?.textAlignment = .right
        addSubview(bgImage!)
        addSubview(messageLabel!)
    }
}
