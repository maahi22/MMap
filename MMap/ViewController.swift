//
//  ViewController.swift
//  MMap
//
//  Created by Maahi on 27/04/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.performSegue(withIdentifier: "toTabBar", sender: self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

