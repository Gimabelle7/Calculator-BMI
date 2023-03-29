//
//  CalculateViewController.swift
//  Calculator BMI
//
//  Created by Gimabelle Garcia vasquez on 28/3/23.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heigthLabel: UILabel!
    @IBOutlet weak var weigthLabel: UILabel!
    @IBOutlet weak var heigthSlider: UISlider!
    @IBOutlet weak var weigthSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func heigthSliderChange(_ sender: UISlider) {
    let heigth = (String( format: "%.2f", sender.value))
        heigthLabel.text = " \(heigth)m"
    }
    
    @IBAction func weigthSliderChange(_ sender: UISlider) {
    let weigth = (String( format: "%.0f", sender.value))
        weigthLabel.text = " \(weigth)kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let heigth = heigthSlider.value
        let weigth = weigthSlider.value
        
        calculatorBrain.calculateBMI(height: heigth, weight: weigth)
        performSegue(withIdentifier: "goToResult", sender: self)
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getVMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
            
        }
    }

}
