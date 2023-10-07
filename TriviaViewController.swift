//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Ivan Morales on 10/6/23.
//

import UIKit

class TriviaViewController: UIViewController {

    @IBOutlet weak var numberOfQuestion: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var questionAskedLabel: UILabel!
    @IBOutlet weak var tapFirstOptionButton: UIButton!
    @IBOutlet weak var tapSecondOptionButton: UIButton!
    @IBOutlet weak var tapThirdOptionButton: UIButton!
    @IBOutlet weak var tapFourthOptionButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    @IBAction func tapFirstOption(_ sender: Any) {
        checkAnswer(selectedAnswerIndex: 0)
    }
    @IBAction func tapSecondOption(_ sender: Any) {
        checkAnswer(selectedAnswerIndex: 1)
    }
    @IBAction func tapThirdOption(_ sender: Any) {
        checkAnswer(selectedAnswerIndex: 2)
    }
    @IBAction func tapFourthOption(_ sender: Any) {
        checkAnswer(selectedAnswerIndex: 3)
    }
    var currentQuestionIndex = 0
    var correctAnswerCount = 0
    
    struct Question {
            let text: String
            let options: [String]
            let correctAnswerIndex: Int
        }
    var questions: [Question] = [
            Question(
                text: "Which movie has the yellow Horse who wants to be free?",
                options: ["Five Night's at Freddy's", "Pokemon: Pikachu's Trip", "Spirit: Stallion of Cimarron", "Teenage Mutant Ninja Turtles"],
                correctAnswerIndex: 2
            ),
            Question(
                text: "Which movie has an evil Teddy bear as its villain?",
                options: ["Toy Story 1", "Toy Story 2", "Toy Story 3", "Toy Story 4"],
                correctAnswerIndex: 2
            ),
            Question(
                text: "Which movie is a prequel to the series Jujutsu Kaisen?",
                options: ["Jujutsu Kaisen 0", "Jujutsu Kaisen: Prequel", "Kaisen Jujutsu 0", "Jujuon Dabeat 0"],
                correctAnswerIndex: 0
            ),
            Question(
                text: "In which movie did Anakin Skywalker become Lord Vader",
                options: ["Phantom Menace", "Revenge of the Sith", "Attack of the Clones", "A New Hope"],
                correctAnswerIndex: 1
            )
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestion()
        // Do any additional setup after loading the view.
    }
    func loadQuestion() {
            let currentQuestion = questions[currentQuestionIndex]
            
            numberOfQuestion.text = "Question \(currentQuestionIndex + 1)/\(questions.count)"
            categoryLabel.text = "Genre: Movies"
            questionAskedLabel.text = currentQuestion.text
        tapFirstOptionButton.setTitle(currentQuestion.options[0], for: .normal)
        tapSecondOptionButton.setTitle(currentQuestion.options[1], for: .normal)
        tapThirdOptionButton.setTitle(currentQuestion.options[2], for: .normal)
        tapFourthOptionButton.setTitle(currentQuestion.options[3], for: .normal)
        
        restartButton.isHidden = true
        }
        
    func showResult() {
            numberOfQuestion.text = "Results"
            categoryLabel.text = "Genre: Movies"
            questionAskedLabel.text = "You got \(correctAnswerCount) out of \(questions.count) correct!"
            
        restartButton.isHidden = false;
        }
    func checkAnswer(selectedAnswerIndex: Int) {
            let currentQuestion = questions[currentQuestionIndex]
            
            if selectedAnswerIndex == currentQuestion.correctAnswerIndex {
                correctAnswerCount += 1
            }
            
            currentQuestionIndex += 1
            
            if currentQuestionIndex < questions.count {
                loadQuestion()
            } else {
                showResult()
            }
        }
    
    @IBAction func restartFeature(_ sender: Any) {
        currentQuestionIndex = 0
        correctAnswerCount = 0
        loadQuestion()
        restartButton.isHidden = true
    }
}
