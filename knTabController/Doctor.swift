//
//  MainController.swift
//  knTabController
//
//  Created by Ky Nguyen Coinhako on 4/20/18.
//  Copyright © 2018 kynguyen. All rights reserved.
//

import UIKit

class DoctorController: knTabController {

    override func setupView() {
        let home = knTabBarItem(icon: #imageLiteral(resourceName: "home"), title: "Home")
        let appointment = knTabBarItem(icon: #imageLiteral(resourceName: "appointment"), title: "Appointment")
        let add = knTabBarItem(icon: #imageLiteral(resourceName: "add"), title: "")
        add.lock = true
        add.itemHeight = 66
        let doctors = knTabBarItem(icon: #imageLiteral(resourceName: "doctors"), title: "Doctors")
        let porfolio = knTabBarItem(icon: #imageLiteral(resourceName: "user"), title: "Porfolio")

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

        setTabBar(items: [home, appointment, add, doctors, porfolio])
        viewControllers = [red, green, blue, yellow, gray]
        normalColor = .red
    }
}
