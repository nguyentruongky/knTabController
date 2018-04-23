//
//  UIMaker.swift
//  knCollection
//
//  Created by Ky Nguyen on 10/12/17.
//  Copyright © 2017 Ky Nguyen. All rights reserved.
//

import UIKit

var screenWidth: CGFloat { return UIScreen.main.bounds.width }

struct knUIMaker {
    static func makeLabel(text: String? = nil, font: UIFont = .systemFont(ofSize: 15),
                          color: UIColor = .black, numberOfLines: Int = 1,
                          alignment: NSTextAlignment = .left) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = font
        label.textColor = color
        label.text = text
        label.numberOfLines = numberOfLines
        label.textAlignment = alignment
        return label
    }
    
    static func makeImageView(image: UIImage? = nil,
                              contentMode: UIViewContentMode = .scaleAspectFit) -> UIImageView {
        let iv = UIImageView(image: image)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = contentMode
        iv.clipsToBounds = true
        return iv
    }
}

