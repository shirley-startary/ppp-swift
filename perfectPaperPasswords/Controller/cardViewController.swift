//
//  cardViewController.swift
//  perfectPaperPasswords
//
//  Created by Silvana on 07/02/20.
//  Copyright © 2020 Shirley. All rights reserved.
//

import UIKit

class cardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //Variables
    var card = [[String]]()
    var infoCel = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView(collection: CardCollectionView)
        // Do any additional setup after loading the view.
//        print("estas son las \(card)")
        reducerCard()

    }
    
    func reducerCard (){
        for item1 in 0..<card.count {
            for item2 in 0..<card[0].count {
                if item1 == 0 && item2 == 0 {
                    print("00")
                    infoCel.append("")
                } else {
                    infoCel.append(card[item1][item2])
                }
            }
        }
    }
 
    //IBoutlet

    @IBOutlet weak var CardCollectionView: UICollectionView!
    
    //Function
    func setUpCollectionView(collection:UICollectionView){
        collection.delegate = self
        collection.dataSource = self
    }
    
    //System Function
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return infoCel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "passcodeCell", for: indexPath) as! cardCollectionViewCell
//        print(card[0][1])
      
        cell.passCodeLabel.text = infoCel[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screensize = UIScreen.main.bounds
        let widthValue = (screensize.width / 8) * 0.9
        return CGSize(width: widthValue, height: widthValue)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
    
}
