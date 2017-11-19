//
//  AnswerViewController.swift
//  customCell
//
//  Created by zichu zheng on 11/17/17.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var nextbuttonLayout: UIButton!
    @IBOutlet weak var donebuttonlayout: UIButton!
    
    var totalQNumber = 0
    var currentQnumber = 0
    var questions = ["Q1", "Q2"]
    var answers = [["A11", "A12"], ["A21", "A22"]]
    var correctAnswers = [1, 2]
    var userSelect = 0
    var userScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = "Question: " + questions[currentQnumber]
        answerLabel.text = "Correct answer: " + answers[currentQnumber][correctAnswers[currentQnumber]]
        if (userSelect == correctAnswers[currentQnumber]) {
            resultLabel.text = "Your answer is Correct"
            userScore += 1
        } else {
            resultLabel.text = "Your answer is Wrong"
        }
        
        if (currentQnumber == totalQNumber - 1) {
            nextbuttonLayout.isHidden = true
            donebuttonlayout.isHidden = false
        } else {
            nextbuttonLayout.isHidden = false
            donebuttonlayout.isHidden = true
        }
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if (segue.identifier == "nextProblem") {
            let nextVC = segue.destination as? QuestionViewController
            nextVC?.totalQNumber = totalQNumber
            nextVC?.currentQnumber = currentQnumber + 1
            nextVC?.questions = questions
            nextVC?.answers = answers
            nextVC?.correctAnswers = correctAnswers
            nextVC?.userScore = userScore
        } else if (segue.identifier == "doneProblem") {
            let nextVC = segue.destination as? ResultViewController
            nextVC?.totalQNumber = totalQNumber
            nextVC?.userScore = userScore
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

}
