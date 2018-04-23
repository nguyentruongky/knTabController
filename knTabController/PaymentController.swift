//
//  PaymentController.swift
//  knTabController
//
//  Created by Ky Nguyen Coinhako on 4/23/18.
//  Copyright © 2018 kynguyen. All rights reserved.
//

import UIKit
class PaymentController: knTabController {
    override func setupView() {
        let transfer = knTabBarItem(icon: #imageLiteral(resourceName: "transfer"), title: "Transfer")
        let utilities = knTabBarItem(icon: #imageLiteral(resourceName: "utilities"), title: "Utilities")
        let pay = knTabBarItem(icon: #imageLiteral(resourceName: "pay"), title: "")
        pay.lock = true
        pay.itemHeight = 66
        let merchants = knTabBarItem(icon: #imageLiteral(resourceName: "location"), title: "Merchants")
        let profile = knTabBarItem(icon: #imageLiteral(resourceName: "profile"), title: "Me")
        
        let red = UIViewController()
        red.view.backgroundColor = .red
        let green = UIViewController()
        green.view.backgroundColor = .green
        let blue = UIViewController()
        blue.view.backgroundColor = .white
        let yellow = UIViewController()
        yellow.view.backgroundColor = .yellow
        let gray = UIViewController()
        gray.view.backgroundColor = .gray
        
        setTabBar(items: [transfer, utilities, pay, merchants, profile])
        viewControllers = [red, green, blue, yellow, gray]
    }}
