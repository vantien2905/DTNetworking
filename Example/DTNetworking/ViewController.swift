//
//  ViewController.swift
//  DTNetworking
//
//  Created by vantien2905 on 08/07/2021.
//  Copyright (c) 2021 vantien2905. All rights reserved.
//

import UIKit
import DTNetworking

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Provider.shared.homeAPIService.getListCoin { (data) in
            print(data)
        } failure: { (error) in
            print(error)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

