//
//  HomeScreenViewController.swift
//  RestaurantBookign
//
//  Created by Chirag Chaplot on 9/9/21.
//

import Foundation
import UIKit

class HomeScreenViewController:UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //self.setNavigationBar()
        self.title = "Reservations"
    }

    func addSome() {
        let nc = UINavigationController(rootViewController: self)
    }
    func setNavigationBar() {
            let screenSize: CGRect = UIScreen.main.bounds
            let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 64))
        navBar.barStyle = .default
            let navItem = UINavigationItem(title: "Chirag")
            let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(dissmissView))
            navItem.rightBarButtonItem = doneItem
            navBar.setItems([navItem], animated: false)
            self.view.addSubview(navBar)
        }

    @objc
        func dissmissView(){
            self.dismiss(animated: true, completion: nil)
        }
}
