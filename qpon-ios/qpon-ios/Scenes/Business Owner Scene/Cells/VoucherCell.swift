//
//  VoucherCell.swift
//  qpon-ios
//
//  Created by Bianca Hinova on 12.04.20.
//  Copyright © 2020 Bianca Hinova. All rights reserved.
//

import UIKit

class VoucherCell: UICollectionViewCell {

    static let aspectRatio: CGFloat = 1.7
    
    @IBOutlet weak var labelCenterYConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var label: UILabel!
    
    var selectionLayer: CAShapeLayer?
    
    override var isSelected: Bool {
        set {
            if newValue != self.isSelected {
                
                if newValue {
                    let shapeLayer:CAShapeLayer = CAShapeLayer()
                    let frameSize = self.frame.size
                    let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)

                    shapeLayer.bounds = shapeRect
                    shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
                    shapeLayer.fillColor = UIColor.clear.cgColor
                    shapeLayer.strokeColor = UIColor.yellowColor().cgColor
                    shapeLayer.lineWidth = 5
                    shapeLayer.lineJoin = CAShapeLayerLineJoin.round
                    shapeLayer.lineDashPattern = [6,3]
                    shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 10).cgPath
                    self.selectionLayer = shapeLayer
                    self.layer.addSublayer(shapeLayer)
                } else {
                    self.selectionLayer?.removeFromSuperlayer()
                }
            }
            
            super.isSelected = newValue
        }
        get {
            return super.isSelected
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.labelCenterYConstraint.constant = self.bounds.height / 5
        self.label.sizeToFit()
        self.label.adjustsFontSizeToFitWidth = true
        self.label.minimumScaleFactor = 0.5
        self.label.numberOfLines = 0
    }
}
