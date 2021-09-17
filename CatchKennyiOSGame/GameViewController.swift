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
    var myHighScoreInt : Int = 0
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
    var interval = 1.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewScreenW  = view.frame.size.width
        viewScreenH  = view.frame.size.height
        mainFunc()
        
        
        kennyX = Int.random(in: 0..<Int(viewScreenW)-60)
        kennyY = Int.random(in: Int(timerSecond.frame.maxY)..<Int(myHighScore.frame.minY))
        kennyDefFunc()
        
        timer1 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer),userInfo: nil,repeats: true)
        timer2 = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(kennyRun),userInfo: nil,repeats: true)

        
        
        
        

        // Do any additional setup after loading the view.
    }
    
    
    func mainFunc( ){
        
        
        myLabelFunc()
        timerFunc()
        myHighFunc()
        gestureKennyFunc()
        alertFunc()
        timerFunc()
    
    
    }
    
    func timeFunc( ){
        
       
        
        
    }
    
    @objc func kennyRun(timer2: Timer)
    {
        
     
        
        if time > 0 {
            kennyX = Int.random(in: 0..<Int(viewScreenW)-60)
            kennyY = Int.random(in: Int(timerSecond.frame.maxY+84)..<Int(myHighScore.frame.minY))
            kennyImage.frame = CGRect(x: kennyX, y: kennyY-84, width: 60, height: 84)
        }
        else if time <= 0 {
            
            kennyImage.isUserInteractionEnabled = false
            kennyImage.frame = CGRect(
                       x: self.view.frame.midX-84/2,
                       y: self.view.frame.midY-84/2,
                       width: 60,
                       height: 84)
            highScoreDef()
            myHighFunc()
            timer2.invalidate()
            if !timer2.isValid {
                alertFunc()
            }
            
            
            
            
            
        }
        
        
    }
    func highScoreDef( )
    {
        
        if scoreNow > myHighScoreInt {
            UserDefaults.standard.setValue(myHighScoreInt, forKey: "HighScore")
        }
        var storedHighScore = UserDefaults.standard.object(forKey: "HighScore")
        if storedHighScore as? Int != nil {
            myHighScoreInt = (storedHighScore as? Int)!
        }
        print(myHighScoreInt)
        
        
        
    }
    
    func alertFunc(){
        if self.time == 0 {
            let alertFinish = UIAlertController(title: "Zaman Doldu", message: "Tekrar Oynamak İster Misiniz?", preferredStyle: .alert)
            let alertActionOK = UIAlertAction(title: "Tekrar Oyna", style: .default) { UIAlertAction in
                print("OKEY")
                self.time = 30
                self.kennyImage.isUserInteractionEnabled = true
                self.timer2 = Timer.scheduledTimer(timeInterval: self.interval, target: self, selector: #selector(self.kennyRun),userInfo: nil,repeats: true)
                //TODO
            }
            
            alertFinish.addAction(alertActionOK)
            
            alertFinish.addAction(UIAlertAction(title: "Anasayfa", style: UIAlertAction.Style.cancel, handler: {action in  self.alertMainVC()}))
            self.present(alertFinish, animated: true, completion: nil)
        }
        
    }
    func alertMainVC()
    {
        
        performSegue(withIdentifier: "GameToMainVC", sender: nil)
        
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
    
  
    
    
    func kennyDefFunc (){
        
        kennyImage.image = UIImage(named: "Kenny")
        kennyImage.frame = CGRect(x: kennyX+84/2, y: kennyY-84, width: 60, height: 84)
        self.view.addSubview(kennyImage)
    }
    
    func timerFunc( ){
        
        timerSecond.text = "Last \(time) Sec."
        timerSecond.textAlignment = .center
        timerSecond.frame = CGRect(x: myScoreNow.frame.minX, y: myScoreNow.frame.maxY, width: myScoreNow.frame.width, height: myScoreNow.frame.height)
        self.view.addSubview(timerSecond)
        print(timerSecond.frame)
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
        myHighScore.frame = CGRect(x: viewScreenW*0.5-100/2, y: viewScreenH*0.97-50/2, width: 150, height: 50)
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
