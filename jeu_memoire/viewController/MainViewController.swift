//
//  MainViewController.swift
//  jeu_memoire
//
//  Created by Fabio dos Santos Estrela on 2017-09-16.
//  Copyright © 2017 Fabio dos Santos Estrela. All rights reserved.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {

    //-- Session code of variable
    
    //-- Variable pour l'interface
    @IBOutlet weak var uiButtonPlay: UIButton!
    @IBOutlet weak var uiImageAnimation1: UIImageView!
    @IBOutlet weak var uiImageAnimation2: UIImageView!
    @IBOutlet weak var uiImageAnimation3: UIImageView!
    @IBOutlet weak var uiImageAnimation4: UIImageView!
    
    //-- Variable pour le tableau des animaux
    var animalNameList1: [String]!
    var animalNameList2: [String]!
    
    //-- Variable pour le audio
    var playerBackground: AVAudioPlayer?
    
    //-----------------------------------
    
    
    //-- Session code of animations fade
    
    private func fadeInImage1(){
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
            self.uiImageAnimation1.alpha = 0
        }) { (true) in
            self.fadeOutImage1()
        }
    }
    
    private func fadeInImage2(){
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
            self.uiImageAnimation2.alpha = 0
        }) { (true) in
            self.fadeOutImage2()
        }
    }
    
    private func fadeInImage3(){
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
            self.uiImageAnimation3.alpha = 0
        }) { (true) in
            self.fadeOutImage3()
        }
    }
    
    private func fadeInImage4(){
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
            self.uiImageAnimation4.alpha = 0
        }) { (true) in
            self.fadeOutImage4()
        }
    }
    
    private func fadeOutImage1(){
        uiImageAnimation1.image = retournImage(named: animalNameList1[retournRandomNumber(flag: 1)])
        
        UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseIn, animations: {
            self.uiImageAnimation1.alpha = 1
        }) { (true) in
            self.fadeInImage1()
        }
    }
    
    private func fadeOutImage2(){
        uiImageAnimation2.image = retournImage(named: animalNameList2[retournRandomNumber(flag: 2)])
        
        UIView.animate(withDuration: 1.5, delay: 0.3, options: .curveEaseIn, animations: {
            self.uiImageAnimation2.alpha = 1
        }) { (true) in
            self.fadeInImage2()
        }
    }
    
    private func fadeOutImage3(){
        uiImageAnimation3.image = retournImage(named: animalNameList2[retournRandomNumber(flag: 2)])
        
        UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseIn, animations: {
            self.uiImageAnimation3.alpha = 1
        }) { (true) in
            self.fadeInImage3()
        }
    }
    
    private func fadeOutImage4(){
        uiImageAnimation4.image = retournImage(named: animalNameList1[retournRandomNumber(flag: 1)])
        
        UIView.animate(withDuration: 1.5, delay: 0.3, options: .curveEaseIn, animations: {
            self.uiImageAnimation4.alpha = 1
        }) { (true) in
            self.fadeInImage4()
        }
    }
    
    //-----------------------------------
    
    
    //-- Session code of animations scale
    
    private func animationScaleUp()
    {
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseIn, .allowUserInteraction], animations: {
            self.uiButtonPlay.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }) { (true) in
            self.animationScaleDown()
        }
    }
    
    private func animationScaleDown()
    {
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseInOut, .allowUserInteraction], animations: {
            self.uiButtonPlay.transform = CGAffineTransform(scaleX: 1, y: 1)
        }) { (true) in
            self.animationScaleUp()
        }
    }
    
    //-----------------------------------
    
    
    private func retournRandomNumber(flag: Int) -> Int{
        if flag == 1 {
           return Int(arc4random_uniform(UInt32(animalNameList1.count)))
        }
        return Int(arc4random_uniform(UInt32(animalNameList2.count)))
    }
    
    private func retournImage(named: String) -> UIImage{
        return UIImage(named: named)!
    }
    
    //-- Session code init sounds of game
    
    func initSound()
    {
        guard let urlBackground = Bundle.main.url(forResource: "background", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            playerBackground = try AVAudioPlayer(contentsOf: urlBackground)
            playerBackground?.setVolume(0.7, fadeDuration: 0)
            playerBackground?.play()
            
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initSound()

        animationScaleUp()
        
        animalNameList1 = ["dog", "cat", "rabbit", "turtle", "giraffe"]
        animalNameList2 = ["hippo", "monkey", "squirrel", "mouse", "leopard"]
        
        fadeOutImage1()
        fadeOutImage2()
        fadeOutImage3()
        fadeOutImage4()
        
     }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
