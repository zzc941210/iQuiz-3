//
//  SettingViewController.swift
//  customCell
//
//  Created by zichu zheng on 11/18/17.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var urlTextField: UITextField!
    var questionURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UserDefaults.standard.synchronize()
        urlTextField.text = UserDefaults.standard.string(forKey: "myUrl")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var appDefaults : [String : String] = [:]
        appDefaults["myUrl"] = urlTextField.text!
        UserDefaults.standard.register(defaults: appDefaults)
        UserDefaults.standard.synchronize()
    }
}
