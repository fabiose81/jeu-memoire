//
//  MainViewController.swift
//  jeu_memoire
//
//  Created by eleves on 2017-09-16.
//  Copyright © 2017 eleves. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var uiButtonPlay: UIButton!
    
    
    private func fadeIn(){
        UIView.animate(withDuration: 0.3, delay: 0.4, options: .curveEaseOut, animations: {
            self.uiButtonPlay.alpha = 0
        }) { (true) in
            self.fadeOut()
        }
    }
    
    private func fadeOut(){
        UIView.animate(withDuration: 0.3, delay: 0.4, options: .curveEaseIn, animations: {
            self.uiButtonPlay.alpha = 1
        }) { (true) in
            self.fadeIn()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.bringSubview(toFront: self.uiButtonPlay)
        //fadeIn()
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
