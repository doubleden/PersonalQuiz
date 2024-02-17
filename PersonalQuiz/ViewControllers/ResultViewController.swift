//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 12.02.2024.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var descriptionAnimalLabel: UILabel!
    
    var answersChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        let animal = defineMostChosenAnimal(in: answersChosen)
        animalLabel.text = "Вы - \(animal.rawValue)"
        descriptionAnimalLabel.text = animal.definition
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func defineMostChosenAnimal(in answers: [Answer]) -> Animal {
        let animals = answers.map { $0.animal }.reduce(into: [:]) {
            $0[$1, default: 0] += 1
        }
        
        var mostChosenAnimal = animals.keys.first ?? .dog
        for (animal, quantity) in animals {
            if quantity >= (answers.count) / 2 {
                mostChosenAnimal = animal
                break
            }
        }
        
        return mostChosenAnimal
    }
}
