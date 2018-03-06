//
//  ViewController.swift
//  StarterProject
//
//  Created by Walinns Innovation on 28/02/18.
//  Copyright © 2018 Walinns Innovation. All rights reserved.
//

import UIKit
import WalinnsAPI_Swift
 


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        WalinnsApi.initialize(project_token:"Replace your PROJECT_TOKEN")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

