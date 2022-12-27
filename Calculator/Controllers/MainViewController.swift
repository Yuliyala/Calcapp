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
        label.font = .boldSystemFont(ofSize: 60)
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
            print("1111")
        case 11:
            resultLabel.text = calculationModel.getResult()
        case 12:
            calculationModel.setOperations(operation: .addition)
        case 13:
            calculationModel.setOperations(operation: .subtraction)
        case 14:
            calculationModel.setOperations(operation: .multiplication)
        case 15:
            calculationModel.setOperations(operation: .division)
        case 16:
            print("1111")
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
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide .bottomAnchor, constant: -10),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mainStackView.heightAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier:  1),
            
            resultLabel.bottomAnchor.constraint(equalTo: mainStackView.topAnchor, constant: -10),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
        
        
    }
}

