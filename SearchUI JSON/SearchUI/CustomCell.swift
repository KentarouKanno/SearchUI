//
//  CustomCell.swift
//  SearchUI
//
//  Created by Kentarou on 2016/08/05.
//  Copyright © 2016年 Kentarou. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var wordLabel        : UILabel!
    @IBOutlet weak var detailInfoLabel  : UILabel!
    @IBOutlet weak var separatorLineView: UIView!
    
    // 制約
    @IBOutlet weak var detailInfoTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var detailInfoBottomConstraint: NSLayoutConstraint!
    
    var data: DataModel! {
        didSet {
            self.wordLabel.text = data.word
            
            if data.isShowDetail {
                
                self.detailInfoLabel.text = data.detailInfo
                detailInfoTopConstraint.constant = 15
                detailInfoBottomConstraint.constant = 22
                separatorLineView.hidden = false
                
            } else {
                
                self.detailInfoLabel.text = ""
                detailInfoTopConstraint.constant = 0
                detailInfoBottomConstraint.constant = 0
                separatorLineView.hidden = true
            }
        }
    }
}
