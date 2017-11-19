//
//  TableViewCellMenu.swift
//  iQuiz
//
//  Created by zichu zheng on 11/7/17.
//  Copyright © 2017 zichu zheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBAction func settingPress(_ sender: Any) {
        let alert = UIAlertController(title: "Setting", message: "Setting goes here", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    var dataArray : NSArray = []
    var questions = ["Q1", "Q2"]
    var answers = [["A11", "A12", "A13", "A14"], ["A21", "A22", "A23", "A24"]]
    var correctAnswers = [2, 3]
    var questionURL = "file:///Users/zichuzheng/Desktop/questions.json"
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        
        cell.myImage.image = UIImage(named: ("\(indexPath.row % 3 + 1).jpg"))
        cell.myLabel.text = (dataArray[indexPath.row] as! [String : Any])["title"] as? String
        cell.descriptionLabel.text = (dataArray[indexPath.row] as! [String : Any])["desc"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        questions = []
        answers = []
        correctAnswers = []
        
        let thisSubjectArray = (dataArray[indexPath.row] as! [String : Any])["questions"] as! [Any]

        for eachQuestion in thisSubjectArray {
            let eachQuestionParse = eachQuestion as! [String : Any]
            questions.append(eachQuestionParse["text"] as! String)
            var thisOptionAnswers : [String] = []
            for eachOptionAnswer in (eachQuestionParse["answers"] as! [String]) {
                thisOptionAnswers.append(eachOptionAnswer)
            }
            answers.append(thisOptionAnswers)
            correctAnswers.append(Int(eachQuestionParse["answer"] as! String)! - 1)
        }
        performSegue(withIdentifier: "showQuestion", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        checkURL(questionURL)
    }
    
    func checkURL(_ myURL : String) {
        var request = URLRequest(url: URL(string: myURL)!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        session.dataTask(with: request) {data, response, err in
            // TODO: if 200 then do. Otherwise use local instead. Alert.
            self.dataArray = try! JSONSerialization.jsonObject(with: data!, options: []) as! NSArray
        }.resume()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showQuestion") {
            let nextVC = segue.destination as? QuestionViewController
            let totalQNumber = questions.count
            let currentQNumber = 0
            nextVC?.totalQNumber = totalQNumber
            nextVC?.currentQnumber = currentQNumber
            nextVC?.questions = questions
            nextVC?.answers = answers
            nextVC?.correctAnswers = correctAnswers
            nextVC?.userScore = 0
        } else if (segue.identifier == "showSetting") {
            let nextVC = segue.destination as? SettingViewController
            nextVC?.questionURL = questionURL
        }
    }
    
}

