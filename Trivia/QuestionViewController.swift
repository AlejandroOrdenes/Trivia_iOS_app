//
//  QuestionViewController.swift
//  Trivia
//
//  Created by Alejandro O. on 26-09-21.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var TrueButton: UIButton!
    @IBOutlet weak var FalseButton: UIButton!
    
    private var questionViewModel: QuestionViewModel!
    
    var categoryID: Int?
    
    override func viewDidLoad() {
        questionViewModel = QuestionViewModel(service: QuestionsService())
        getQuestions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            getQuestions()
    }
    
    func getQuestions() {
         
        questionViewModel.getQuestionsServ() {
            self.QuestionLabel.reloadInputViews()
        }
           
    }


   

    
//    private func getQuestions() {
//            questionViewModel.getQuestions(completion: ) { [weak self] in
//                guard let strongSelf = self else { return }
//
//                if strongSelf.questionViewModel.areQuestionsAvailable() {
//                    strongSelf.setCurrentQuestion()
//                }
//
//            }
//        }
    
    @IBAction func trueQuestion(_ sender: UIButton) {
        let result = validateCurrentQuestion(answer: "true")
        sendResultMessage(for: result)
    }
    
    @IBAction func wrongQuestion(_ sender: UIButton) {
        let result = validateCurrentQuestion(answer: "false")
        sendResultMessage(for: result)
    }
    
    private func updateQuestion() {
        
        setQuestion(question: questionViewModel.getNextQuestion())
        
      
    }
    
    private func setCurrentQuestion() {
        setQuestion(question: questionViewModel.getCurrentQuestion())
    }
    
    private func setQuestion(question: String) {
        
        QuestionLabel.text = question
       
    }
    
    private func validateCurrentQuestion(answer: String) -> Bool {
        questionViewModel.validateCurrentQuestion(answer: answer)
    }
    
    private func sendResultMessage(for result: Bool) {
        let message = result ? "Respuesta correcta" : "Respuesta incorrecta"
        
        let alert = UIAlertController(title: "respuesta", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in self.updateQuestion()
            
        }))
        
        self.present(alert, animated: true)
    }
    
    
}




