//
//  Ogenii.swift
//  knTabController
//
//  Created by Ky Nguyen Coinhako on 4/23/18.
//  Copyright © 2018 kynguyen. All rights reserved.
//

import UIKit
class OgeniiController: knTabController {
    // https://ogenii.com
    // https://itunes.apple.com/us/app/ogenii/id1302692200?mt=8
    
    override func setupView() {
        let discover = knTabBarItem(icon: #imageLiteral(resourceName: "discover"), title: "Discover")
        let learn = knTabBarItem(icon: #imageLiteral(resourceName: "learn"), title: "Learn")
        learn.lock = true
        let setting = knTabBarItem(icon: #imageLiteral(resourceName: "setting"), title: "Settings")
        let notification = knTabBarItem(icon: #imageLiteral(resourceName: "notification"), title: "Notification")

        let red = UIViewController()
        red.view.backgroundColor = .red
        let green = UIViewController()
        green.view.backgroundColor = .green
        let blue = UIViewController()
        blue.view.backgroundColor = .blue
        let yellow = UIViewController()
        yellow.view.backgroundColor = .white

        setTabBar(items: [discover, learn, notification, setting])
        viewControllers = [red, green, blue, yellow]
    }
}
