//
//  LevelOneViewController.swift
//  jeu_memoire
//
//  Created by Fabio dos Santos Estrela on 2017-09-16.
//  Copyright © 2017 Fabio dos Santos Estrela. All rights reserved.
//

import UIKit
import AVFoundation

class LevelOneViewController: UIViewController {
    
    @IBOutlet weak var uiButtonPlay: UIButton!
    @IBOutlet weak var uiViewFelicitation: UIView!
    
    var animalNameList: [String]!
    var animalNameListRandom = [String]()
    
    var arrayCard: [UIButton] = []
    var arrayCardSelected = [String]()
   
    var countFinishCards: Int = 0;
    
    var playerFlipCard: AVAudioPlayer?
    var playerFelicitation: AVAudioPlayer?
    var playerBoing: AVAudioPlayer?
    var playerPop: AVAudioPlayer?
    
    
    //-- Session code action when card is selected
    
    @IBAction func actionCard(_ sender: UIButton)
    {
        
        if arrayCardSelected.count == 2 {
           return
        }
        
        playerFlipCard?.play()
        
        sender.isEnabled = false;
        sender.adjustsImageWhenDisabled = false;
        
        let image: String = animalNameListRandom[sender.tag];
        
        arrayCardSelected.append(image)
        arrayCard.append(sender)

        animationFlipFromLeft(card: sender, image: image);
        compare(sender: sender)
        
    }
    
    //--------------------------------
    
    //-- Session code go to next level
    
    @IBAction func nextLevel(_ sender: UIButton)
    {
        playerFelicitation?.stop()
        playerFlipCard?.stop()
        playerBoing?.stop()
        playerPop?.stop()
        performSegue(withIdentifier: "level2", sender: nil)
    }
    
    //--------------------------------
    
    private func retournImage(named: String) -> UIImage
    {
        return UIImage(named: named)!
    }
    
    //-- Session code of animations flip
    
    private func animationFlipFromLeft(card: UIButton, image: String)
    {
        
        card.setBackgroundImage(retournImage(named: image), for: .normal)
        UIView.transition(with: card, duration: 0.5, options: .transitionFlipFromLeft, animations: nil){ (true) in
           
        }
    }
    
    private func animationFlipFromRight(card: UIButton, image: String)
    {
        card.setBackgroundImage(retournImage(named: image), for: .normal)
        UIView.transition(with: card, duration: 0.5, options: .transitionFlipFromRight, animations: nil){ (true) in
            card.isEnabled = true;
            self.clearArray();
        }
    }
    
    //--------------------------------
    
    
    //-- Session code of animations scale
    
    private func animationScaleUp()
    {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.uiViewFelicitation.transform = CGAffineTransform(scaleX: 2, y: 2)
        }) { (true) in
            self.animationScaleDown()
        }
    }
    
    private func animationScaleDown()
    {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.uiViewFelicitation.transform = CGAffineTransform(scaleX: 1, y: 1)
        }) { (true) in
             self.buttonPlayAnimationScaleUp()
        }
    }
    
    private func buttonPlayAnimationScaleUp()
    {
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseIn, .allowUserInteraction], animations: {
            self.uiButtonPlay.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }) { (true) in
            self.buttonPlayAnimationScaleDown()
        }
    }
    
    private func buttonPlayAnimationScaleDown()
    {
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseInOut, .allowUserInteraction], animations: {
            self.uiButtonPlay.transform = CGAffineTransform(scaleX: 1, y: 1)
        }) { (true) in
            self.buttonPlayAnimationScaleUp()
        }
    }
    
    //--------------------------------
    
    
    //-- Session code of animations horizontal Move
    
    private func animationMoveRight(countAnimation: Int)
    {
            UIView.animate(withDuration: 0.05, delay: 0, options: .curveEaseOut, animations: {
                self.arrayCard[0].frame.origin.x = self.arrayCard[0].frame.origin.x + 10
                self.arrayCard[1].frame.origin.x = self.arrayCard[1].frame.origin.x + 10
            }) { (true) in
                let _countAnimation = countAnimation + 1
                if _countAnimation < 11 {
                     self.animationMoveLeft(countAnimation: _countAnimation)
                }else{
                    self.animationFlipFromRight(card: self.arrayCard[0], image: "cloud")
                    self.animationFlipFromRight(card: self.arrayCard[1], image: "cloud")
                }
            }
    }
    
    private func animationMoveLeft(countAnimation: Int)
    {
        UIView.animate(withDuration: 0.05, delay: 0, options: .curveEaseOut, animations: {
           self.arrayCard[0].frame.origin.x = self.arrayCard[0].frame.origin.x - 10
           self.arrayCard[1].frame.origin.x = self.arrayCard[1].frame.origin.x - 10
        }) { (true) in
            self.animationMoveRight(countAnimation: countAnimation)
        }
    }
    
    //--------------------------------
    
    
    //-- Session code compare cards selected
    
    private func compare(sender: UIButton)
    {
        if arrayCardSelected.count == 2 {
            if arrayCardSelected[0] == arrayCardSelected[1]{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8, execute: {
                    self.arrayCard[0].isHidden = true;
                    self.arrayCard[1].isHidden = true;
                    
                    self.clearArray();
                    self.countFinishCards += 1;
                    if(self.countFinishCards == 4){
                        self.uiViewFelicitation.isHidden = false;
                        self.view.bringSubview(toFront: self.uiViewFelicitation);
                        self.animationScaleUp()
                        
                        self.playerFelicitation?.play()
                    }else{
                        self.playerPop?.play();
                    }
                })
            }else{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    self.playerBoing?.play()
                    self.animationMoveRight(countAnimation: 1)
                })
            }
        }
    }
    
    //--------------------------------
    
 
    //-- Session code init sounds of game
    
    func initSound()
    {
        guard let urlFlipCard = Bundle.main.url(forResource: "flipcard", withExtension: "mp3") else { return }
        guard let urlFelicitation = Bundle.main.url(forResource: "applause", withExtension: "wav") else { return }
        guard let urlBoing = Bundle.main.url(forResource: "boing", withExtension: "wav") else { return }
        guard let urlPop = Bundle.main.url(forResource: "poppyup", withExtension: "aiff") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            playerFlipCard = try AVAudioPlayer(contentsOf: urlFlipCard)
            playerFelicitation = try AVAudioPlayer(contentsOf: urlFelicitation)
            playerBoing = try AVAudioPlayer(contentsOf: urlBoing)
            playerPop = try AVAudioPlayer(contentsOf: urlPop)
        
        } catch let error {
            print(error.localizedDescription)
        }
    }

    //--------------------------------
    
    func randomAnimals()
    {
        let numberOfAnimals = animalNameList.count
        for _ in 0..<numberOfAnimals {
            let randomNumber = Int(arc4random_uniform(UInt32(animalNameList.count)))
            animalNameListRandom.append(animalNameList[randomNumber])
            animalNameList.remove(at: randomNumber)
        }
    }
    
    private func clearArray()
    {
        self.arrayCard = [];
        self.arrayCardSelected = [];
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        initSound()
        playerFlipCard?.setVolume(0, fadeDuration: 0)
        playerFlipCard?.play()
        playerFlipCard?.stop()
        playerFlipCard?.setVolume(1.0, fadeDuration: 0)
        
        uiViewFelicitation.transform = CGAffineTransform(scaleX: 0, y: 0)
        animalNameList = ["dog", "cat", "rabbit", "turtle", "dog", "cat", "rabbit", "turtle"]
        randomAnimals()        
    }

}
