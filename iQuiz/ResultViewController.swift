//
//  ResultViewController.swift
//  customCell
//
//  Created by zichu zheng on 11/17/17.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var totalQNumber = 0
    var userScore = 0
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "Quiz done! \(userScore)/\(totalQNumber)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
