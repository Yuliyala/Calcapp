//
//  ViewController.swift
//  Calculator
//
//  Created by Yuliya Lapenak on 12/23/22.
//

import UIKit

class MainViewController: UIViewController {
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 90, weight: .thin)
        label.textColor = .white
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mainStackView = MainStackView()
    
    private let calculationModel = CalculationModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstrains()
        mainStackView.delegate = self
    }
    
    private func setupViews() {
        view.backgroundColor = .black
        
        view.addSubview(mainStackView)
        view.addSubview(resultLabel)
    }
}

extension MainViewController: MainStackViewProtocol {
    
    func tapNumberButton(tag: Int) {
        calculationModel.setNumber(number: tag)
        resultLabel.text = calculationModel.getCurrentNumber()
    }
    
    func tapActionButton(tag: Int) {
        
        switch tag {
        case 10:
            calculationModel.addDotValue()
            resultLabel.text = calculationModel.getCurrentNumber()
        case 11:
            resultLabel.text = calculationModel.getResult()
        case 12:
            resultLabel.text =  calculationModel.setOperations(operation: .addition)
        case 13:
            resultLabel.text =  calculationModel.setOperations(operation: .subtraction)
        case 14:
            resultLabel.text = calculationModel.setOperations(operation: .multiplication)
        case 15:
            resultLabel.text =  calculationModel.setOperations(operation: .division)
        case 16:
            calculationModel.setPercentNumber()
            resultLabel.text = calculationModel.getCurrentNumber()
        case 17:
            calculationModel.invertValue()
            resultLabel.text = calculationModel.getCurrentNumber()
        case 18:
            calculationModel.resetValue()
            resultLabel.text = "0"
        default:
            print("error tag")
        }
    }
}

extension MainViewController {
    
    private func setConstrains() {
        NSLayoutConstraint.activate([
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide .bottomAnchor, constant: -20),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mainStackView.heightAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 1.2) ,
            
            resultLabel.bottomAnchor.constraint(equalTo: mainStackView.topAnchor, constant: -10),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
        
        
    }
}

