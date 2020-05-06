//
//  HomeViewController.swift
//  Quizzler
//
//  Created by Emerson Javid Gonzalez Morales on 6/05/20.
//  Copyright © 2020 Emerson Javid Gonzalez Morales. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func typeQuestionPressed(_ sender: UIButton) {
        /*let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "TrueFalseQuestion") as? ViewController
        UIApplication.shared.keyWindow?.rootViewController = viewController;*/
        
        if sender.tag == 0 {
            // Safe rootViewController
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TrueFalseQuestion") as? ViewController
            {
                UIApplication.shared.keyWindow?.rootViewController = vc;
            }
        } else {
            // Safe rootViewController
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Multichoice") as? MultichoiceViewController
            {
                UIApplication.shared.keyWindow?.rootViewController = vc;
            }
        }
    }
}
