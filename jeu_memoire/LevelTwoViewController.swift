//
//  LevelTwoViewController.swift
//  jeu_memoire
//
//  Created by eleves on 2017-09-16.
//  Copyright © 2017 eleves. All rights reserved.
//

import UIKit

class LevelTwoViewController: UIViewController {

    var arrayCard: [UIButton] = []
    
    
    @IBAction func actionButton1(_ sender: UIButton) {
        animationFlipFromLeft(card: sender, image: "giraffe");
        compare(sender: sender)
    }
    
    @IBAction func actionButton2(_ sender: UIButton) {
        animationFlipFromLeft(card: sender, image: "turtle");
        compare(sender: sender)
    }
    
    @IBAction func actionButton3(_ sender: UIButton) {
        animationFlipFromLeft(card: sender, image: "monkey");
        compare(sender: sender)
    }
    
    @IBAction func actionButton4(_ sender: UIButton) {
        animationFlipFromLeft(card: sender, image: "turtle");
        compare(sender: sender)
    }
    
    @IBAction func actionButton5(_ sender: UIButton) {
        animationFlipFromLeft(card: sender, image: "bee");
        compare(sender: sender)
    }
    
    @IBAction func actionButton6(_ sender: UIButton) {
        animationFlipFromLeft(card: sender, image: "bee");
        compare(sender: sender)
    }
    
    @IBAction func actionButton7(_ sender: UIButton) {
        animationFlipFromLeft(card: sender, image: "giraffe");
        compare(sender: sender)
    }
    
    @IBAction func actionButton8(_ sender: UIButton) {
        animationFlipFromLeft(card: sender, image: "monkey");
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
                    self.animationFlipFromRight(card: self.arrayCard[0], image: "back_2")
                    self.animationFlipFromRight(card: self.arrayCard[1], image: "back_2")
                })
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                self.arrayCard = [];
            })
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
