//
//  ViewController.swift
//  RGBToHexConverter
//
//  Created by AHMET HAKAN YILDIRIM on 25.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtRed: UITextField!
    
    
    @IBOutlet weak var txtGreen: UITextField!
    
    @IBOutlet weak var txtBlue: UITextField!
    
    @IBOutlet weak var txtResult: UILabel!
    
    @IBOutlet weak var btnConvert: UIButton!
    
    var secilenIndex : Int = 0
    
    
    @IBOutlet weak var lblSelectedColor: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        
        secilenIndex = sender.selectedSegmentIndex
        
        
        txtResult.text?.removeAll()
        
        txtRed.text?.removeAll()
        txtBlue.text?.removeAll()
        txtGreen.text?.removeAll()
        lblSelectedColor.backgroundColor = UIColor.white
        
        if secilenIndex == 0 {
            btnConvert.setTitle("RGB-HEX Çevir", for: UIControl.State.normal)
        }else {
            btnConvert.setTitle("HEX-RGB Çevir", for: UIControl.State.normal)
        }
        
        
    }
    @IBAction func btnConvertClicked(_ sender: UIButton) {
        
        if secilenIndex == 0{
            
            // rgb den hex e çevirme
            convertRgbToHex()
            
        }else {
            // hex den rgb e çevirme
            convertHexToRgb()
            
        }
    }
    
    func convertRgbToHex (){
        
        /*
         if let redValue = UInt8(txtRed.text!){
             if let greenValue = UInt8(txtGreen.text!){
                 if let blueValue = UInt8(txtBlue.text!){
                     // buraya kadar gelinirse kullanıcı değerleri düzgün bir şekilde girmiştir
                     
                     let redHex = String(format: "%2X", redValue)
                     let greenHex = String(format: "%2X", greenValue)
                     let blueHex = String(format: "%2X", blueValue)
                     
                     txtResult.text = "Hex Color : #\(redHex)\(greenHex)\(blueHex)"
                     
                     lblSelectedColor.backgroundColor = UIColor(
                     red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1
                     )
                     
                 }
             }
             
         }
         */
        
        guard let redValue = UInt8(txtRed.text!) else{return}
        guard let greenValue = UInt8(txtGreen.text!) else{return}
        guard let blueValue = UInt8(txtBlue.text!) else{return}
        
        let redHex = String(format: "%2X", redValue)
        let greenHex = String(format: "%2X", greenValue)
        let blueHex = String(format: "%2X", blueValue)
        
        txtResult.text = "Hex Color : #\(redHex)\(greenHex)\(blueHex)"
        
        lblSelectedColor.backgroundColor = UIColor(
        red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1
        )

        
        
    }
    
    func convertHexToRgb (){
        
        guard let redValue = UInt8(txtRed.text!, radix:16) else {return}
        guard let greenValue = UInt8(txtGreen.text!, radix:16) else {return}
        guard let blueValue = UInt8(txtBlue.text!, radix:16) else {return}
        
        
                    
                    txtResult.text = "Red : \(redValue) \n Green : \(greenValue) \n Blue : \(blueValue)"
                    lblSelectedColor.backgroundColor = UIColor(
                    red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1
                    )
    }
    
}
