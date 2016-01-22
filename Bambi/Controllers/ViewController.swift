//
//  ViewController.swift
//  Bambi
//
//  Created by Azure Chen on 2016/1/16.
//  Copyright © 2016年 WednesdayCC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dotImageView: DotImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dotImageView.setDotImage(UIImage(named: "Lena"))
        dotImageView.setNeedsDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

