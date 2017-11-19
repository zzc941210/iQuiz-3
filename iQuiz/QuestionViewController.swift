//
//  QuestionViewController.swift
//  customCell
//
//  Created by zichu zheng on 11/17/17.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    
    var totalQNumber = 0
    var currentQnumber = 0
    var questions = ["Q1", "Q2"]
    var answers = [["A11", "A12"], ["A21", "A22"]]
    var correctAnswers = [1, 2]
    var userScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let QuestionString  = questions[currentQnumber]
        let answer1String = answers[currentQnumber][0]
        let answer2String = answers[currentQnumber][1]
        let answer3String = answers[currentQnumber][2]
        let answer4String = answers[currentQnumber][3]
        
        
        questionLabel.text = QuestionString
        answerButton1.setTitle(answer1String, for: .normal)
        answerButton2.setTitle(answer2String, for: .normal)
        answerButton3.setTitle(answer3String, for: .normal)
        answerButton4.setTitle(answer4String, for: .normal)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as? AnswerViewController
        nextVC?.totalQNumber = totalQNumber
        nextVC?.currentQnumber = currentQnumber
        nextVC?.questions = questions
        nextVC?.answers = answers
        nextVC?.correctAnswers = correctAnswers
        nextVC?.userScore = userScore
        
        if (segue.identifier == "firstSelect") {
            nextVC?.userSelect = 0;
        } else if (segue.identifier == "secondSelect") {
            nextVC?.userSelect = 1;
        } else if (segue.identifier == "thirdSelect") {
            nextVC?.userSelect = 2;
        } else if (segue.identifier == "fourthSelect") {
            nextVC?.userSelect = 3;
        }
    }
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


