//
//  LevelOneViewController.swift
//  jeu_memoire
//
//  Created by eleves on 2017-09-16.
//  Copyright © 2017 eleves. All rights reserved.
//

import UIKit
import AVFoundation

class LevelOneViewController: UIViewController {
    
    var arrayCard: [UIButton] = []
    var count: Int = 0;
    
    @IBOutlet weak var uiViewFelicitation: UIView!
    var player: AVAudioPlayer?
    
    @IBAction func actionButton1(_ sender: UIButton) {        
        animationFlipFromLeft(card: sender, image: "dog");
        compare(sender: sender)
    }
    
    @IBAction func actionButton2(_ sender: UIButton) {
        animationFlipFromLeft(card: sender, image: "rabbit");
        compare(sender: sender)
    }
    
    @IBAction func actionButton3(_ sender: UIButton) {
        animationFlipFromLeft(card: sender, image: "cat");
        compare(sender: sender)
    }
    
    @IBAction func actionButton4(_ sender: UIButton) {
        animationFlipFromLeft(card: sender, image: "rabbit");
        compare(sender: sender)
    }
    
    @IBAction func actionButton5(_ sender: UIButton) {
        animationFlipFromLeft(card: sender, image: "dog");
        compare(sender: sender)
    }
    
    @IBAction func actionButton6(_ sender: UIButton) {
        animationFlipFromLeft(card: sender, image: "cat");
        compare(sender: sender)
    }
    
    private func retournImage(named: String) -> UIImage{
        return UIImage(named: named)!
    }
    
    private func animationFlipFromLeft(card: UIButton, image: String){
        card.setBackgroundImage(retournImage(named: image), for: .normal)
        UIView.transition(with: card, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    
    private func animationFlipFromRight(card: UIButton, image: String){
        card.setBackgroundImage(retournImage(named: image), for: .normal)
        UIView.transition(with: card, duration: 0.5, options: .transitionFlipFromRight, animations: nil){ (true) in
            self.clearArray();
        }
    }
    
    private func animationScaleUp(){
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.uiViewFelicitation.transform = CGAffineTransform(scaleX: 2, y: 2)
        }) { (true) in
            self.animationScaleDown()
        }
    }
    
    private func animationScaleDown(){
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.uiViewFelicitation.transform = CGAffineTransform(scaleX: 1, y: 1)
        }) { (true) in
            
        }
    }
    
    private func clearArray(){
        self.arrayCard = [];
    }
    
    private func compare(sender: UIButton){
        arrayCard.append(sender)
        if arrayCard.count == 2 {
            if arrayCard[0].tag == arrayCard[1].tag{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8, execute: {
                    self.arrayCard[0].isHidden = true;
                    self.arrayCard[1].isHidden = true;
                    self.clearArray();
                    self.count += 1;
                    if(self.count == 3){
                        self.uiViewFelicitation.isHidden = false;
                        self.view.bringSubview(toFront: self.uiViewFelicitation);
                        self.animationScaleUp()
                        
                       // self.playSoundFelicitation()
                    }
                })
            }else{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                    self.animationFlipFromRight(card: self.arrayCard[0], image: "back")
                    self.animationFlipFromRight(card: self.arrayCard[1], image: "back")
                })
            }
        }
    }
    
    func playSoundFelicitation(){
        guard let url = Bundle.main.url(forResource: "applause", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.uiViewFelicitation.isHidden = true;
        self.uiViewFelicitation.transform = CGAffineTransform(scaleX: 0, y: 0)
        
                // Do any additional setup after loading the view.     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
