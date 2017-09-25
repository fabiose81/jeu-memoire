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
    
    @IBOutlet weak var uiImageAnimation1: UIImageView!
    @IBOutlet weak var uiImageAnimation2: UIImageView!
    @IBOutlet weak var uiImageAnimation3: UIImageView!
    @IBOutlet weak var uiImageAnimation4: UIImageView!
    
    var arrayOfAnimalNames: [String]!
    
    private func fadeInImage1(){
        UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseOut, animations: {
            self.uiImageAnimation1.alpha = 0
        }) { (true) in
            self.fadeOutImage1()
        }
    }
    
    private func fadeInImage2(){
        UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseOut, animations: {
            self.uiImageAnimation2.alpha = 0
        }) { (true) in
            self.fadeOutImage2()
        }
    }
    
    private func fadeInImage3(){
        UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseOut, animations: {
            self.uiImageAnimation3.alpha = 0
        }) { (true) in
            self.fadeOutImage3()
        }
    }
    
    private func fadeInImage4(){
        UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseOut, animations: {
            self.uiImageAnimation4.alpha = 0
        }) { (true) in
            self.fadeOutImage4()
        }
    }
    
    private func fadeOutImage1(){
        uiImageAnimation1.image = retournImage(named: arrayOfAnimalNames[retournRandomNumber()])
        
        UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseIn, animations: {
            self.uiImageAnimation1.alpha = 1
        }) { (true) in
            self.fadeInImage1()
        }
    }
    
    private func fadeOutImage2(){
        uiImageAnimation2.image = retournImage(named: arrayOfAnimalNames[retournRandomNumber()])
        
        UIView.animate(withDuration: 1.5, delay: 0.3, options: .curveEaseIn, animations: {
            self.uiImageAnimation2.alpha = 1
        }) { (true) in
            self.fadeInImage2()
        }
    }
    
    private func fadeOutImage3(){
        uiImageAnimation3.image = retournImage(named: arrayOfAnimalNames[retournRandomNumber()])
        
        UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseIn, animations: {
            self.uiImageAnimation3.alpha = 1
        }) { (true) in
            self.fadeInImage3()
        }
    }
    
    private func fadeOutImage4(){
        uiImageAnimation4.image = retournImage(named: arrayOfAnimalNames[retournRandomNumber()])
        
        UIView.animate(withDuration: 1.5, delay: 0.3, options: .curveEaseIn, animations: {
            self.uiImageAnimation4.alpha = 1
        }) { (true) in
            self.fadeInImage4()
        }
    }
    
    private func retournRandomNumber() -> Int{
        return Int(arc4random_uniform(UInt32(arrayOfAnimalNames.count)))
    }
    
    private func retournImage(named: String) -> UIImage{
        return UIImage(named: named)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        arrayOfAnimalNames = ["dog", "cat", "rabbit", "turtle", "giraffe", "hippo", "monkey", "squirrel", "mouse", "leopard"]
        
        fadeOutImage1()
        fadeOutImage2()
        fadeOutImage3()
        fadeOutImage4()
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
