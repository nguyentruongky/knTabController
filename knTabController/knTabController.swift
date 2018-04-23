//
//  ViewController.swift
//  knTabController
//
//  Created by Ky Nguyen on 4/7/18.
//  Copyright © 2018 kynguyen. All rights reserved.
//

import UIKit

class knTabBarItem: UIButton {
    var itemHeight: CGFloat = 0
    var lock = false
    var color: UIColor = UIColor.lightGray {
        didSet {
            guard lock == false else { return }
            iconImageView.image = iconImageView.image?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
            iconImageView.tintColor = color
            textLabel.textColor = color
        }}
    
    private let iconImageView = knUIMaker.makeImageView(contentMode: .scaleAspectFit)
    private let textLabel = knUIMaker.makeLabel(font: UIFont.systemFont(ofSize: 11),
                                        color: .black, alignment: .center)
    
    convenience init(icon: UIImage, title: String,
                     font: UIFont = UIFont.systemFont(ofSize: 18)) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        iconImageView.image = icon
        textLabel.text = title
        textLabel.font = UIFont(name: font.fontName, size: 11)
        setupView()
    }
    
    private func setupView() {
        addSubviews(views: iconImageView, textLabel)
        iconImageView.top(toView: self, space: 4)
        iconImageView.centerX(toView: self)
        iconImageView.square()
        
        let iconBottomConstant: CGFloat = textLabel.text == "" ? -2 : -20
        iconImageView.bottom(toView: self, space: iconBottomConstant)
        
        textLabel.bottom(toView: self, space: -2)
        textLabel.centerX(toView: self)
    }
}


class knTabBar: UITabBar {
    var kn_items = [knTabBarItem]()
    convenience init(items: [knTabBarItem]) {
        self.init()
        kn_items = items
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    override var tintColor: UIColor! {
        didSet {
            for item in kn_items {
                item.color = tintColor
            }}}
    
    func setupView() {
        backgroundColor = .white
        if kn_items.count == 0 { return }
        
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .gray
        line.height(1)
        
        addSubviews(views: line)
        line.horizontal(toView: self)
        line.top(toView: self)
        
        var horizontalConstraints = "H:|"
        let itemWidth: CGFloat = screenWidth / CGFloat(kn_items.count)
        for i in 0 ..< kn_items.count {
            let item = kn_items[i]
            addSubviews(views: item)
            if item.itemHeight == 0 {
                item.vertical(toView: self)
            }
            else {
                item.bottom(toView: self)
                item.height(item.itemHeight)
            }
            item.width(itemWidth)
            horizontalConstraints += String(format: "[v%d]", i)
            if item.lock == false {
                item.color = tintColor
            }
        }
        
        horizontalConstraints += "|"
        addConstraints(withFormat: horizontalConstraints, arrayOf: kn_items)
    }
}

class knTabController: UITabBarController {
    var kn_tabBar: knTabBar!
    var selectedColor = UIColor.darkGray
    var normalColor = UIColor.lightGray {
        didSet {
            kn_tabBar.tintColor = normalColor
        }}
    
    private var kn_tabBarHeight: CGFloat = 49
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isHidden = true
        setupView()
    }

    func setupView() {}
    
    func setTabBar(items: [knTabBarItem], height: CGFloat = 49) {
        guard items.count > 0 else { return }
        
        kn_tabBar = knTabBar(items: items)
        guard let bar = kn_tabBar else { return }
        kn_tabBar.tintColor = normalColor
        bar.kn_items.first?.color = selectedColor
        
        view.addSubviews(views: bar)
        bar.horizontal(toView: view)
        bar.bottom(toView: view)
        kn_tabBarHeight = height
        bar.height(kn_tabBarHeight)
        for i in 0 ..< items.count {
            items[i].tag = i
            items[i].addTarget(self, action: #selector(switchTab), for: .touchUpInside)
        }
    }
    
    @objc func switchTab(button: UIButton) {
        let newIndex = button.tag
        changeTab(from: selectedIndex, to: newIndex)
    }
    
    private func changeTab(from fromIndex: Int, to toIndex: Int) {
        kn_tabBar.kn_items[fromIndex].color = normalColor
        kn_tabBar.kn_items[toIndex].color = selectedColor
        animateSliding(from: fromIndex, to: toIndex)
    }
}

extension knTabController {

    func animateSliding(from fromIndex: Int, to toIndex: Int) {
        guard fromIndex != toIndex else { return }
        guard let fromController = viewControllers?[fromIndex], let toController = viewControllers?[toIndex] else { return }
        let fromView = fromController.view!
        let toView = toController.view!
        let viewSize = fromView.frame
        let scrollRight = fromIndex < toIndex
        fromView.superview?.addSubview(toView)
        toView.frame = CGRect(x: scrollRight ? screenWidth : -screenWidth,
                              y: viewSize.origin.y,
                              width: screenWidth,
                              height: viewSize.height)
        
        func animate() {
            fromView.frame = CGRect(x: scrollRight ? -screenWidth : screenWidth,
                                    y: viewSize.origin.y,
                                    width: screenWidth,
                                    height: viewSize.height)
            toView.frame = CGRect(x: 0,
                                  y: viewSize.origin.y,
                                  width: screenWidth,
                                  height: viewSize.height)
        }
        
        func finished(_ completed: Bool) {
            fromView.removeFromSuperview()
            selectedIndex = toIndex
        }
        
        UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseInOut,
                       animations: animate, completion: finished)
    }
}









