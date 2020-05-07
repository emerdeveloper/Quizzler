//
//  PopupViewController.swift
//  Quizzler
//
//  Created by Emerson Javid Gonzalez Morales on 6/05/20.
//  Copyright © 2020 Emerson Javid Gonzalez Morales. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {

    @IBOutlet weak var labelScoreValue: UILabel!
    var score: String = ""
    var  modalHandlerDelegate: ModalHandler!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelScoreValue.text = score
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if sender.tag == 1 {
            // Safe rootViewController
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Home") as? HomeViewController
            {
                UIApplication.shared.keyWindow?.rootViewController = vc;
                
            }
        }
        modalHandlerDelegate.modalDismissed()
        dismiss(animated: true, completion: nil)
    }
}
