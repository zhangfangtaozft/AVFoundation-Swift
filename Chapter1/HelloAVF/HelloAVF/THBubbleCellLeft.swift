//
//  THBubbleCell.swift
//  HelloAVF
//
//  Created by 张芳涛 on 2023/5/13.
//

import Foundation
import UIKit
class THBubbleCellLeft: UITableViewCell {
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
        bgImage = UIImageView(frame: CGRect(x: 5, y: 2, width: screenWidth - 5, height: 56))
        bgImage?.image = UIImage(named: "bubble_left")
        messageLabel = UILabel(frame: CGRect(x: 15, y: 5, width: screenWidth - 15, height: 53))
        messageLabel?.font = UIFont.systemFont(ofSize: 15)
        addSubview(bgImage!)
        addSubview(messageLabel!)
    }
}
