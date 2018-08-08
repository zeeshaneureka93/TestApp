//
//  CustomPageControl.swift
//  CoreDirection
//
//  Created by Ahmar on 1/3/18.
//  Copyright © 2018 Rebel Technology. All rights reserved.
//

import UIKit

class CustomPageControl: UIPageControl {

    let activeImage:UIImage = UIImage(named: "Green-banta")!
    let inactiveImage:UIImage = UIImage(named: "Grey-banta")!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.pageIndicatorTintColor = UIColor.clear
        self.currentPageIndicatorTintColor = UIColor.clear
        self.clipsToBounds = false
    }
    
    
    func updateDots() {
        var i = 0
        for view in self.subviews {
            if let imageView = self.imageForSubview(view) {
                if i == self.currentPage {
                    imageView.image = self.activeImage
                } else {
                    imageView.image = self.inactiveImage
                }
                i = i + 1
            } else {
                var dotImage = self.inactiveImage
                if i == self.currentPage {
                    dotImage = self.activeImage
                }
                view.clipsToBounds = false
                let imageView = UIImageView(image:dotImage)
                imageView.isUserInteractionEnabled = false
                if i == 0 || i != (self.subviews.count - 1) {
                imageView.frame = CGRect(x: 3, y: 0, width: imageView.frame.size.width, height: imageView.frame.size.height)
                }
                view.addSubview(imageView)
                i = i + 1
            }
        }
    }
    
    fileprivate func imageForSubview(_ view:UIView) -> UIImageView? {
        var dot:UIImageView?
        
        if let dotImageView = view as? UIImageView {
            dot = dotImageView
        } else {
            for foundView in view.subviews {
                if let imageView = foundView as? UIImageView {
                    dot = imageView
                    break
                }
            }
        }
        
        return dot
    }

}
