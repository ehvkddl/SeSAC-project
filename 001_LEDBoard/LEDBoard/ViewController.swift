//
//  ViewController.swift
//  LEDBoard
//
//  Created by do hee kim on 2023/07/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    
    @IBOutlet var colorPicker: UIColorWell!
    @IBOutlet var randomColorButton: UIButton!
    @IBOutlet var returnButton: UIButton!
    
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        designComponent()
    }

    @IBAction func tapGestureTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        
        textField.isHidden = textField.isHidden ? false : true
        randomColorButton.isHidden = randomColorButton.isHidden ? false : true
        returnButton.isHidden = returnButton.isHidden ? false : true
        colorPicker.isHidden = colorPicker.isHidden ? false : true
    }
    
    @IBAction func textFieldKeyboardTapped(_ sender: UITextField) {
        returnBtnClicked(returnButton)
    }
    
    @IBAction func returnBtnClicked(_ sender: UIButton) {
        view.endEditing(true)
        
        setLabel()
        
        guard let color = colorPicker.selectedColor else { return }
        resultLabel.textColor = color
    }
    
    @IBAction func randomColorBtnClicked(_ sender: UIButton) {
        resultLabel.textColor = generateRandomColor()
        colorPicker.selectedColor = nil
    }
    
    func generateRandomColor() -> UIColor {
        var redValue: CGFloat
        var greenValue: CGFloat
        var blueValue: CGFloat
        
        repeat {
            redValue = CGFloat(drand48())
            greenValue = CGFloat(drand48())
            blueValue = CGFloat(drand48())
        } while redValue == 0 && greenValue == 0 && blueValue == 0
        
        let randomColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        
        return randomColor
    }
    
    func setLabel() {
        resultLabel.text = textField.text
    }
    
}

extension ViewController {
    func designComponent() {
        view.backgroundColor = .black
        
        designReturnBtn(button: returnButton)
        designRandomColorBtn(button: randomColorButton)
        designResultLabel(label: resultLabel)
    }
    
    func designReturnBtn(button: UIButton) {
        button.tintColor = .black

        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 5
    }
    
    func designRandomColorBtn(button: UIButton) {
        button.tintColor = .black
    }
    
    func designResultLabel(label: UILabel) {
        label.font = .systemFont(ofSize: 80, weight: .bold)
        label.text = "외치기!!!!"
        
        label.textAlignment = .center
        label.textColor = generateRandomColor()
        
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
    }
}
