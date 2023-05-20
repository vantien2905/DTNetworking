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
        Provider.shared.homeAPIService.getUniversities(country: "Viet Nam", success: { data in
            data.forEach { item in
                print(item.name ?? "Empty")
            }
        }, failure: { error in
            print(error)
        })
        
        Provider.shared.homeAPIService.getEntries { object in
            object?.entries.enumerated().forEach { index, item in
                print("\(index) : \(item.Description ?? "")")
            }
        } failure: { error in
            print(error)
        }


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

