//
//  ViewController.swift
//  CalculadoraExamen
//
//  Created by Agustin on 10/5/17.
//  Copyright © 2017 SSRoman. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    var op1:Double!
    var op2:Double!
    var resultado:Double!
    var signo:Double!
    var memoria:Double!
    var operacion:String!

    @IBOutlet weak var operador: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    enum errores: Error {
        case mal
    }
    func obtenerOp1(_ sender: Any) {
        op1 = Double (operador.text!)
        aCero(Any)
    }
    
    func cociente (op1: Double, op2: Double) throws -> Double{
        if op2 == 0{
            throw errores.mal
        }
        var division = op1/op2
        return division
    }
    
    @IBAction func cero(_ sender: Any) {
        operador.text = (operador.text! + "0")
    }
    
    @IBAction func uno(_ sender: Any) {
        operador.text = (operador.text! + "1")
    }
    
    @IBAction func dos(_ sender: Any) {
        operador.text = (operador.text! + "2")
    }
    
    @IBAction func tres(_ sender: Any) {
        operador.text = (operador.text! + "3")
    }
    
    @IBAction func cuatro(_ sender: Any) {
        operador.text = (operador.text! + "4")
    }
    
    @IBAction func cinco(_ sender: Any) {
        operador.text = (operador.text! + "5")
    }
    
    @IBAction func seis(_ sender: Any) {
        operador.text = (operador.text! + "6")
    }
    
    @IBAction func siete(_ sender: Any) {
        operador.text = (operador.text! + "7")
    }
    
    @IBAction func ocho(_ sender: Any) {
        operador.text = (operador.text! + "8")
    }
    
    @IBAction func nueve(_ sender: Any) {
        operador.text = (operador.text! + "9")
    }
    
    @IBAction func coma(_ sender: Any) {
        operador.text = (operador.text! + ".")
    }
    
    @IBAction func suma(_ sender: Any) {
        operacion = "+"
        obtenerOp1(Any)
    }
    
    @IBAction func resta(_ sender: Any) {
        operacion = "-"
        obtenerOp1(Any)
    }
    
    @IBAction func multiplicacion(_ sender: Any) {
        operacion = "x"
        obtenerOp1(Any)
    }
    
    @IBAction func division(_ sender: Any) {
        operacion = "/"
        obtenerOp1(Any)
    }
    
    @IBAction func igual(_ sender: Any) {
        op2 = Double (operador.text!)
        switch operacion {
        case "+":
            resultado = op1 + op2
            operador.text = String(resultado)
        case "-":
            resultado = op1 - op2
            operador.text = String(resultado)
        case "x":
            resultado = op1 * op2
            operador.text = String(resultado)
        case "/":
            do{
                try resultado = cociente(op1: op1, op2: op2)
                operador.text = String(resultado)
            } catch{
                let alertController = UIAlertController(title: "No se puede dividir entre 0", message: "Introduzca divisor", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "Volver", style: .default, handler: nil)
                alertController.addAction(defaultAction)
                present(alertController, animated: true, completion: nil)
                
                operador.text = ""
            }
            
        default:
            
            operador.text = "No se pudo realizar"
            
            
        }
    }
    
    @IBAction func aCero(_ sender: Any) {
        operador.text=""
    }
    
    @IBAction func reset(_ sender: Any) {
        op1=0
        op2=0
        operacion=""
        operador.text=""
    }
    
    @IBAction func cambioSigno(_ sender: Any) {
        signo = Double (operador.text!)
        signo = -1 * signo
        operador.text = String (signo)
    }
    
    @IBAction func memoriaCero(_ sender: Any) {
        memoria=0
        operador.text=""
    }
    
    @IBAction func memoriaMas(_ sender: Any) {
        memoria = Double (operador.text!)
        operador.text = ""
    }
    
    @IBAction func memoriaResultado(_ sender: Any) {
        operador.text = String(memoria)
    }
    
}

