//
//  MyCollectionViewCell.swift
//  UISwift
//
//  Created by huangshuimei on 16/9/25.
//  Copyright © 2016年 huangshuimei. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    internal func setupView(lableText:String,imageName:String)->Void {
//        myLabel.text = lableText
//        myImageView.image = UIImage(named: imageName)
    }
    override func awakeFromNib() {
   
        super.awakeFromNib()
        
        self.contentView.backgroundColor = UIColor(red: 23/255, green: 232/255, blue: 233/255, alpha: 1)
    
    }

}
