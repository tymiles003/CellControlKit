//
//  EntryTableViewCell.swift
//  Forms
//
//  Created by Wendell Antildes M Sampaio on 12/02/2017.
//  Copyright © 2017 Wendell Antildes M Sampaio. All rights reserved.
//

import UIKit

@IBDesignable
class EntryTableViewCell: UITableViewCell {
    
    @IBInspectable var placeholder: String?
    @IBInspectable var title : String?
    
    let leftMargin : CGFloat = 10
    let rightMargin : CGFloat = 10
    var entryLabel : UILabel?
    var textField : UITextField?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureControls()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureControls()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.sizeToFitCustomControls()
    }
    
    func sizeToFitCustomControls(){
        let bounds = self.contentView.bounds
        guard let label = self.entryLabel, let textField = self.textField else{
            return
        }
        label.sizeToFit()
        label.frame.size.height = bounds.size.height
        textField.frame = CGRect(x:label.frame.size.width + self.leftMargin, y: bounds.origin.y, width: bounds.size.width - label.frame.size.width - self.rightMargin, height: bounds.size.height)
    }
    
    private func configureControls(){
        let label = UILabel()
        label.text = self.title
        label.textColor = UIColor.black
        let textField = UITextField()
        textField.autocapitalizationType = UITextAutocapitalizationType.none
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.textColor = UIColor.black
        textField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        textField.clearButtonMode = UITextFieldViewMode.whileEditing
        textField.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        textField.textAlignment = .right
        textField.placeholder = self.placeholder
        self.contentView.addSubview(label)
        self.contentView.addSubview(textField)
        self.entryLabel = label
        self.textField = textField
        self.selectionStyle = UITableViewCellSelectionStyle.none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForInterfaceBuilder() {
        self.configureControls()
    }

}
