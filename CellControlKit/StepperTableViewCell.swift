//
//  StepperTableViewCell.swift
//  Forms
//
//  Created by Wendell Antildes M Sampaio on 12/02/2017.
//  Copyright © 2017 Wendell Antildes M Sampaio. All rights reserved.
//

import UIKit

@IBDesignable
class StepperTableViewCell: BaseTableViewCell {

    @IBInspectable var value : Double = 0
    @IBInspectable var maximumValue : Double = 0
    @IBInspectable var minimumValue : Double = 0
    
    private var stepperValueLabel : UILabel?
    var stepper : UIStepper?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let stepperValueLabel = self.stepperValueLabel, let stepper = self.stepper else{
            return
        }
        let bounds = self.contentView.bounds
        let center = self.centerToPositionCustomControls()
        stepperValueLabel.sizeToFit()
        stepperValueLabel.center = center
        stepper.sizeToFit()
        stepper.center = center
        stepper.frame.origin.x = bounds.size.width - stepper.frame.size.width - self.rightMargin
    }
    
     override func setupControls(){
        super.setupControls()
        let stepperValue = UILabel()
        stepperValueLabel?.text = ""
        stepperValue.textColor = UIColor.black
        stepperValue.font = UIFont.boldSystemFont(ofSize: 16)
        let stepper = UIStepper()
        stepper.maximumValue = self.maximumValue
        stepper.minimumValue = self.minimumValue
        stepper.value = self.value
        stepper.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        stepper.addTarget(self, action: #selector(StepperTableViewCell.stepperValueChanged(stepper:)), for: .valueChanged)
        self.contentView.addSubview(stepperValue)
        self.contentView.addSubview(stepper)
        self.stepperValueLabel = stepperValue
        self.stepper = stepper
        self.setStepperValueLabel()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForInterfaceBuilder() {
        self.setupControls()
    }
    
    func stepperValueChanged(stepper : UIStepper){
        self.setStepperValueLabel()
    }
    
    private func setStepperValueLabel(){
        guard let label = self.stepperValueLabel, let stepper = self.stepper else{
            return
        }
        label.text = "\(Int(stepper.value))"
        label.sizeToFit()
    }

}
