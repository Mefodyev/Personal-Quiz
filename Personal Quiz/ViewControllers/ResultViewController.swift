//
//  ResultViewController.swift
//  Personal Quiz
//
//  Created by 18992227 on 31.05.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    // 1. Массив ответов
    // 2. Определить наиболее часто встречаемый тип животного
    // 3. Отобразить результат
    // 4. Избавиться от кнопки Back
    
    //MARK: Variables
    var answers: [Answer] = []
    
    //MARK: Outlets
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Выводит в консоль массив ответов
        print(answers)
        //Отображают на экране посчитанные функцией animalTypeFinder() значения
        typeLabel.text = "Вы - \(animalTypeFinder().rawValue)"
        descriptionLabel.text = "\(animalTypeFinder().definition)"
    }
}

//MARK: Local Extensions

extension ResultViewController {
    private func animalTypeFinder() -> AnimalType {
        
        var resultedAnimal = AnimalType(rawValue: "L")
        
        var dogCounter = 0
        var rabbitCounter = 0
        var catCounter = 0
        var turtleCounter = 0
        var arrayOfCounters: [Int] = []
        
        for (_, type) in answers.enumerated() {
            
            switch type.type {
            case AnimalType.dog:
                dogCounter += 1
            case AnimalType.rabbit:
                rabbitCounter += 1
            case AnimalType.turtle:
                turtleCounter += 1
            case AnimalType.cat:
                catCounter += 1
            }
        }
        
        arrayOfCounters.append(dogCounter)
        arrayOfCounters.append(catCounter)
        arrayOfCounters.append(rabbitCounter)
        arrayOfCounters.append(turtleCounter)
        var newSortedArray = arrayOfCounters.sorted(by: >)
        
        print("This is sorted array: \(newSortedArray)")
        
        print(newSortedArray[0])
        
        //Функция - рандомайзер, если какие-то животные в отсортированном массиве у юзера имеют одинаковый вес, всё решает Его Величество Рандом
        if newSortedArray[0] == newSortedArray[1] {
            newSortedArray[0] = newSortedArray[Int.random(in: 0...1)]
        } else if newSortedArray[0] == newSortedArray[1] && newSortedArray[1] == newSortedArray[2] {
            newSortedArray[0] = newSortedArray[Int.random(in: 0...2)]
        }

        print("Updated first point position is \(newSortedArray[0])")

        
        switch newSortedArray[0] {
        case dogCounter:
            resultedAnimal = AnimalType.dog
        case catCounter:
            resultedAnimal = AnimalType.cat
        case rabbitCounter:
            resultedAnimal = AnimalType.rabbit
        case turtleCounter:
            resultedAnimal = AnimalType.turtle
        default:
            print("Unknown first index in \(newSortedArray) array")
        }

        print(resultedAnimal ?? 0)
        
        print("Dog is selected \(dogCounter) times")
        print("Cat is selected \(catCounter) times")
        print("Rabbit is selected \(rabbitCounter) times")
        print("Turtle is selected \(turtleCounter) times")
        
        return resultedAnimal ?? AnimalType.init(rawValue: "L")!
    }
    
}
