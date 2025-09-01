//
//  ViewController.swift
//  Testidididi
//
//  Created by Nunu Nugraha on 29/08/25.
//

import UIKit

class ViewController: UIViewController {

    var car: Car?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("hello world")
        car?.start()
        car?.mogok()
    }
}
