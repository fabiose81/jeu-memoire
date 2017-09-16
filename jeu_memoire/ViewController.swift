//
//  ViewController.swift
//  jeu_memoire
//
//  Created by eleves on 2017-09-13.
//  Copyright © 2017 eleves. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var uiButton1: UIButton!
    @IBOutlet weak var uiButton2: UIButton!
    @IBOutlet weak var uiButton3: UIButton!
    @IBOutlet weak var uiButton4: UIButton!
    @IBOutlet weak var uiButton5: UIButton!
    @IBOutlet weak var uiButton6: UIButton!
    
    @IBOutlet weak var uiImage1: UIImageView!
    
    var arrayCard: [UIButton] = []
    
   
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
        UIView.transition(with: card, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
    }
  
    
    private func compare(sender: UIButton){
        arrayCard.append(sender)
        if arrayCard.count == 2 {
            if arrayCard[0].tag == arrayCard[1].tag{
                 DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                    self.arrayCard[0].isHidden = true;
                    self.arrayCard[1].isHidden = true;
                })
            }else{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                  self.animationFlipFromRight(card: self.arrayCard[0], image: "back")
                  self.animationFlipFromRight(card: self.arrayCard[1], image: "back")
                })
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
               self.arrayCard = [];
            })
        }       
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.viewWithTag(4)?.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

