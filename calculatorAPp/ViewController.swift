//
//  ViewController.swift
//  calculatorAPp
//
//  Created by Eyüphan Akkaya on 11.05.2023.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var resultTextField: UITextField!
    @IBOutlet weak var sayiTextField: UITextField!
    var workings:String = ""
    override func viewDidLoad() {
    
        super.viewDidLoad()
        sayiTextField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sayiTextField.resignFirstResponder()
    }
    
    func clearAll(){
        workings = ""
        sayiTextField.text = ""
        resultTextField.text = ""
    }

    @IBAction func temizleTiklandi(_ sender: Any) {
        clearAll()
    }
    func degerEkle(value:String){
        workings = workings + value
        sayiTextField.text = workings
    }
    
    @IBAction func sayiUcTiklandi(_ sender: Any) {
        degerEkle(value: "3")
    }
    @IBAction func sayiBirTiklandi(_ sender: Any) {
        degerEkle(value: "1")
        
    }
    @IBAction func yuzdeTiklandi(_ sender: Any) {
        degerEkle(value: "%")
    }
    
    @IBAction func bolmeTiklandi(_ sender: Any) {
        degerEkle(value: "/")
        
        
    }
    
    @IBAction func toplaTiklandi(_ sender: Any) {
        degerEkle(value: "+")
    }
    @IBAction func sayiYediTiklandi(_ sender: Any) {
        degerEkle(value: "7")
        
    }
    
    @IBAction func sayiSekizTiklandi(_ sender: Any) {
        degerEkle(value: "8")
    }
    @IBAction func sayiDokuzTiklandi(_ sender: Any) {
        degerEkle(value: "9")
    }
    
    @IBAction func sayiDortTiklandi(_ sender: Any) {
        degerEkle(value: "4")
    }
    
    @IBAction func sayiBesTiklandi(_ sender: Any) {
        degerEkle(value: "5")
    }
    
    @IBAction func sifirTiklandi(_ sender: Any) {
        degerEkle(value: "0")
    }
    @IBAction func cikarTiklandi(_ sender: Any) {
        degerEkle(value: "-")
    }
    @IBAction func sayiAltiTiklandi(_ sender: Any) {
        degerEkle(value: "6")
    }
    
    @IBAction func virgulTiklandi(_ sender: Any) {
        degerEkle(value: ",")
    }
    
    @IBAction func sonucTiklandi(_ sender: Any) {
        let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
        let expression = NSExpression(format: checkedWorkingsForPercent)
        let result = expression.expressionValue(with: nil, context: nil) as? Double
        let resultString = formatResult(result: result!)
        resultTextField.text = resultString
        
    }
    
    func formatResult (result:Double)-> String{
        
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", result)
        }else {
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func silTiklandi(_ sender: Any) {
        if(!workings.isEmpty) {
            workings.removeLast()
            sayiTextField.text = workings
        }
        
    }
    @IBAction func carpTiklandi(_ sender: Any) {
        degerEkle(value: "*")
    }
    @IBAction func sayiIkiTiklandi(_ sender: Any) {
        degerEkle(value: "2")
    }
    
    func toplamaYap(value:String){
        workings = workings + value
    }
}

