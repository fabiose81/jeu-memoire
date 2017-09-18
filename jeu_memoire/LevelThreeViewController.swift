//
//  LevelThreeViewController.swift
//  jeu_memoire
//
//  Created by eleves on 2017-09-16.
//  Copyright © 2017 eleves. All rights reserved.
//

import UIKit

class LevelThreeViewController: UIViewController {
    
    var arrayCard: [UIButton] = []
    var count: Int = 0;
    
    @IBOutlet weak var uiViewFelicitation: UIView!
    
    @IBAction func actionButton1(_ sender: UIButton) {
        animationFlipFromLeft(card: sender, image: "hippo");
        compare(sender: sender)
    }
    
    @IBAction func actionButton2(_ sender: UIButton) {
        animationFlipFromLeft(card: sender, image: "hippo");
        compare(sender: sender)
    }
    
    @IBAction func actionButton3(_ sender: UIButton) {
        animationFlipFromLeft(card: sender, image: "mouse");
        compare(sender: sender)
    }
    
    @IBAction func actionButton4(_ sender: UIButton) {
        animationFlipFromLeft(card: sender, image: "pig");
        compare(sender: sender)
        
    }
    
    @IBAction func actionButton5(_ sender: UIButton) {
        animationFlipFromLeft(card: sender, image: "cow");
        compare(sender: sender)
        
    }
    
    @IBAction func actionButton6(_ sender: UIButton) {
        animationFlipFromLeft(card: sender, image: "leopard");
        compare(sender: sender)
        
    }
    
    @IBAction func actionButton7(_ sender: UIButton) {
        animationFlipFromLeft(card: sender, image: "mouse");
        compare(sender: sender)
    }
    
    @IBAction func actionButton8(_ sender: UIButton) {
        animationFlipFromLeft(card: sender, image: "cow");
        compare(sender: sender)
    }
    
    @IBAction func actionButton9(_ sender: UIButton) {
        animationFlipFromLeft(card: sender, image: "squirrel");
        compare(sender: sender)
    }
    
    @IBAction func actionButton10(_ sender: UIButton) {
        animationFlipFromLeft(card: sender, image: "squirrel");
        compare(sender: sender)
    }
    
    @IBAction func actionButton11(_ sender: UIButton) {
        animationFlipFromLeft(card: sender, image: "leopard");
        compare(sender: sender)
    }
    
    @IBAction func actionButton12(_ sender: UIButton) {
        animationFlipFromLeft(card: sender, image: "pig");
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
                    if(self.count == 6){
                        self.uiViewFelicitation.isHidden = false;
                        self.view.bringSubview(toFront: self.uiViewFelicitation);
                    }
                })
            }else{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                    self.animationFlipFromRight(card: self.arrayCard[0], image: "back_3")
                    self.animationFlipFromRight(card: self.arrayCard[1], image: "back_3")
                })
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.uiViewFelicitation.isHidden = true;
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
