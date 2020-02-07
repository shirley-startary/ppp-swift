//
//  cardViewController.swift
//  perfectPaperPasswords
//
//  Created by Silvana on 07/02/20.
//  Copyright © 2020 Shirley. All rights reserved.
//

import UIKit

class cardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView(collecion: CardCollectionView)
        // Do any additional setup after loading the view.
    }
    
    //Variables
    
    //IBoutlet

    @IBOutlet weak var CardCollectionView: UICollectionView!
    
    //Function
    func setUpCollectionView(collecion:UICollectionView){
        collecion.delegate = self
        collecion.dataSource = (self as! UICollectionViewDataSource)
        
    }
    
    //System Function
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 88
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "passcodeCell", for: indexPath)
        cell.backgroundColor = UIColor.orange
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screensize = UIScreen.main.bounds
        let widthValue = (screensize.width / 8) * 0.9
        return CGSize(width: widthValue, height: widthValue)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
}
