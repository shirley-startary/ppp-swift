//
//  configurationViewController.swift
//  perfectPaperPasswords
//
//  Created by Silvana on 08/02/20.
//  Copyright © 2020 Shirley. All rights reserved.
//

import UIKit

class configurationViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {

    var pickerSequenceKeyData = [String]()
    var valueSelected : String = "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    @IBOutlet weak var sequenceCharacterKeyPicker: UIPickerView!
    
    @IBOutlet weak var valueLabelPasscodeLength: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        configuration()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        valueLabelPasscodeLength.text = Int(sender.value).description

    }

    
    func configuration() {
        // configuracion del picker
        self.sequenceCharacterKeyPicker.delegate = self
        self.sequenceCharacterKeyPicker.dataSource = self
        pickerSequenceKeyData = [
            "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ","!#%+23456789:=?@ABCDEFGHJKLMNPRSTUVWXYZabcdefghijkmnopqrstuvwxyz",
            "!#$%&'()*+,-.23456789:;<=>?@ABCDEFGHJKLMNOPRSTUVWXYZ_abcdefghijkmnopqrstuvwxyz{|}~"]
        //Configuracion del stepper
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.minimumValue = 3
        stepper.maximumValue = 6
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerSequenceKeyData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerSequenceKeyData[row]
    }
//    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        // This method is triggered whenever the user makes a change to the picker selection.
//        // The parameter named row and component represents what was
//        valueSelected = pickerSequenceKeyData[row] as? String ?? ""
//
//    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        valueSelected = pickerSequenceKeyData[row] 
    }

}
