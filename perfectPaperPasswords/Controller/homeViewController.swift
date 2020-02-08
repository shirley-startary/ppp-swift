//
//  homeViewController.swift
//  perfectPaperPasswords
//
//  Created by Silvana on 02/02/20.
//  Copyright © 2020 Shirley. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {
    
    
    @IBOutlet weak var sequenceKey: UILabel!
    @IBOutlet weak var passcodeCharacter: UILabel!
    @IBOutlet weak var passcodeLength: UILabel!
    @IBOutlet weak var passcodeLabel: UILabel!
    @IBOutlet weak var firstPasscard: UILabel!
    
    override func viewDidLoad() {
          super.viewDidLoad()
        sequenceKey.text = generateSequenceKey()
//        print(getCharacterArrayFrom(passcodeCharacter.text ?? ""))
          // Do any additional setup after loading the view.
      }
    
    @IBAction func generatekey(_ sender: UIButton) {
        sequenceKey.text = generateSequenceKey()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "passCardSegue" {
            let cardView = segue.destination as! cardViewController
            let x =  getKeyFromBase64String(sequenceKey.text!)
          
                    let passwordLength = Int(self.passcodeLength.text!) ?? 0
                    let charactersArrayOfString = getCharacterArrayFrom(passcodeCharacter.text ?? "") ?? [""]
         
                   let card = generateCardArray(passwordLenght: passwordLength, charactersArrayOfString: charactersArrayOfString, sequenceKey: x!,numberOfCards: Int(firstPasscard.text!)!)
            cardView.card = card!
            
        }
    }
    
    @IBAction func generateCard(_ sender: UIButton) {
//        let x =  getKeyFromBase64String(sequenceKey.text!)
////        let y = getCypheredCounter128Bit(using: x!)
//        let passwordLength = Int(self.passcodeLength.text!) ?? 0
//        let charactersArrayOfString = getCharacterArrayFrom(passcodeCharacter.text ?? "") ?? [""]
////        print(getCellPasswordWithLenght(passwordLength, fromCharacterSet: charactersArrayofString, withKey: x!))
//       let card = generateCardArray(passwordLenght: passwordLength, charactersArrayOfString: charactersArrayOfString, sequenceKey: x!,numberOfCards: Int(firstPasscard.text!)!)
    }

}
