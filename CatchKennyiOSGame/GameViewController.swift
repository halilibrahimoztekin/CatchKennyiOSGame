//
//  GameViewController.swift
//  CatchKennyiOSGame
//
//  Created by Bukefalos on 11.09.2021.
//

import UIKit

class GameViewController: UIViewController {
//    HighScore Text, HighScore İnt, İmageView
    
    var scoreNow : Int = 0
    let myHighScoreInt : Int = 0
    var time = 10
    var viewScreenW: CGFloat = 0.0
    var viewScreenH: CGFloat = 0.0
    let myScoreNow = UILabel()
    let timerSecond = UILabel()
    let kennyImage = UIImageView()
    let myHighScore = UILabel()
    var kennyX = 0
    var kennyY = 0
    var kennyW = 0
    var kennyH = 0
    var timer1 = Timer()
    var timer2 = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewScreenW  = view.frame.size.width
        viewScreenH  = view.frame.size.height
        mainFunc()
        
        
        kennyX = Int.random(in: 0..<Int(viewScreenW)-60)
        kennyY = Int.random(in: Int(myScoreNow.frame.maxY)..<Int(myHighScore.frame.minY))
        kennyDefFunc()
        timer1 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer),userInfo: nil,repeats: true)
        timer2 = Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(kennyRun),userInfo: nil,repeats: true)
        

        
        
        
        

        // Do any additional setup after loading the view.
    }
    
    @objc func kennyRun(timer2: Timer)
    {
        
     
        
        if time > 0 {
            kennyX = Int.random(in: 0..<Int(viewScreenW)-60)
            kennyY = Int.random(in: Int(myScoreNow.frame.maxY)..<Int(myHighScore.frame.minY))
            kennyImage.frame = CGRect(x: kennyX+84/2, y: kennyY-60/3, width: 60, height: 84)
        }
        
        
    }
    
    @objc func fireTimer(timer1: Timer)
    {
        if time > 0 {
            time -= 1
            timerSecond.text = ("Last: \(time)")
        }
        
        
    }
    
    
    func gestureKennyFunc( ){
        kennyImage.isUserInteractionEnabled = true
        let UIGestureRecongizerKenny = UITapGestureRecognizer(target: self, action: #selector(gesKenny))
        kennyImage.addGestureRecognizer(UIGestureRecongizerKenny)
        
    }
    @objc func gesKenny(){
    
    scoreNow += 1
    myScoreNow.text = "Score: \(scoreNow)"
    }
    
    func mainFunc( ){
        
        
        myLabelFunc()
        timerFunc()
        myHighFunc()
        gestureKennyFunc()
    
    
    }
    
    
    func kennyDefFunc (){
        
        kennyImage.image = UIImage(named: "Kenny")
        kennyImage.frame = CGRect(x: kennyX+84/2, y: kennyY-60/3, width: 60, height: 84)
        self.view.addSubview(kennyImage)
    }
    
    func timerFunc( ){
        
        timerSecond.text = "Last \(time) Sec."
        timerSecond.textAlignment = .center
        timerSecond.frame = CGRect(x: myScoreNow.frame.minX, y: myScoreNow.frame.maxY + 3, width: myScoreNow.frame.width, height: myScoreNow.frame.height)
        self.view.addSubview(timerSecond)
    }
    
    
    func myLabelFunc( ){
        
        myScoreNow.text = "Score: \(scoreNow)"
        myScoreNow.textAlignment = .center
        myScoreNow.frame = CGRect(x: viewScreenW*0.5-100/2, y: viewScreenH*0.12-50/2, width: 100, height: 50)
        self.view.addSubview(myScoreNow)
        print(viewScreenH)
        print(viewScreenW)
        print(myScoreNow.frame)
    }
    func myHighFunc( ){
        
        myHighScore.text = "High Score: \(myHighScoreInt)"
        myHighScore.textAlignment = .center
        myHighScore.frame = CGRect(x: viewScreenW*0.5-100/2, y: viewScreenH*0.97-50/2, width: 100, height: 50)
        self.view.addSubview(myHighScore)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
