//
//  MainStackView.swift
//  Calculator
//
//  Created by Yuliya Lapenak on 12/23/22.
//

import UIKit

protocol MainStackViewProtocol: AnyObject {
    func tapNumberButton(tag: Int)
    func tapActionButton(tag: Int)
}

class MainStackView: UIStackView {
    
    private var stackViews = [UIStackView]()
    
    weak var delegate: MainStackViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupMainStackView()
        configure()
        stackViews.forEach {addArrangedSubview($0)}
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        axis = .vertical
        spacing = 10
        distribution = .fillEqually
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func createButton(title: String, tag: Int, color: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.tag = tag
        button.backgroundColor =  color
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 35, weight: .regular)
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(keyboardButtonTapped), for: .touchUpInside)
        return button
    }
    
    @objc private func keyboardButtonTapped(sender: UIButton ) {
        sender.tag < 10 ? delegate?.tapNumberButton(tag: sender.tag) : delegate?.tapActionButton(tag: sender.tag)
    }
    
    private func setupMainStackView() {
        let button0 = createButton(title: "0", tag: 0, color: .darkGray)
        let buttonDot = createButton(title: ",", tag: 10, color: .darkGray)
        let buttonEqual = createButton(title: "=", tag: 11, color: .orange)
        let firstStackView = UIStackView(subviews: [button0, buttonDot, buttonEqual])
        button0.widthAnchor.constraint(equalTo: firstStackView.widthAnchor, multiplier: 0.5).isActive = true
        buttonDot.widthAnchor.constraint(equalTo: buttonEqual.widthAnchor, multiplier: 1).isActive = true
        firstStackView.distribution = .fill
        
        
        let button1 = createButton(title: "1", tag: 1, color: .darkGray)
        let button2 = createButton(title: "2", tag: 2, color: .darkGray)
        let button3 = createButton(title: "3", tag: 3, color: .darkGray)
        let buttonPlus = createButton(title: "+", tag: 12, color: .orange)
        let secondStackView = UIStackView(subviews: [button1, button2, button3, buttonPlus])
        
        let button4 = createButton(title: "4", tag: 4, color: .darkGray)
        let button5 = createButton(title: "5", tag: 5, color: .darkGray)
        let button6 = createButton(title: "6", tag: 6, color: .darkGray)
        let buttonMinus = createButton(title: "-", tag: 13, color:.orange)
        let thirdStackView = UIStackView(subviews: [button4, button5, button6,buttonMinus])
        
        let button7 = createButton(title: "7", tag: 7, color: .darkGray)
        let button8 = createButton(title: "8", tag: 8, color: .darkGray)
        let button9 = createButton(title: "9", tag: 9, color: .darkGray)
        let buttonMulty = createButton(title: "*", tag: 14, color: .orange)
        let fourthStackView = UIStackView(subviews: [button7, button8, button9, buttonMulty])
        
        let buttonAC = createButton(title: "AC", tag: 18  , color: .lightGray)
        let buttonPlusMinus = createButton(title: "+/-", tag: 17, color: .lightGray)
        let buttonPercent = createButton(title: "%", tag: 16, color: .lightGray)
        let buttonDivide = createButton(title: "/", tag: 15, color: .orange)
        let fifthStackView = UIStackView(subviews: [buttonAC, buttonPlusMinus, buttonPercent, buttonDivide])
        
        stackViews = [fifthStackView, fourthStackView,  thirdStackView, secondStackView, firstStackView]
    }

}
