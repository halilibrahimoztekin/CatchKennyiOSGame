//
//  ViewController.swift
//  CatchKennyiOSGame
//
//  Created by Bukefalos on 11.09.2021.
//

import UIKit

class ViewController: UIViewController {
   
    var deger: Int =  0
    
    @IBOutlet weak var textscr: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let storedHighScore = UserDefaults.standard.object(forKey: "HighScore")
        if storedHighScore as? Int != nil {
            deger =  (storedHighScore as? Int)!
        }
       textscr.text = "\(deger)"
        print(deger)
        
      
    }

    
    
}

