//
//  ViewController.swift
//  Bambi
//
//  Created by Azure Chen on 2016/1/16.
//  Copyright © 2016年 WednesdayCC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dotImageView = DotImageView()
        dotImageView.image = UIImage(named: "Vernazza")
        dotImageView.transfer()
        
        self.view.addSubview(dotImageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

