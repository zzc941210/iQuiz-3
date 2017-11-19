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
        urlTextField.text = questionURL

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as? ViewController
        nextVC?.questionURL = urlTextField.text!
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
