//
//  ViewController.swift
//  tmdb
//
//  Created by M1Dr05 on 30/11/20.
//

import UIKit
import NVActivityIndicatorView

class SplashVC: UIViewController {
    
    
    @IBOutlet weak var indicator: NVActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
    }
    
    private func initializeView(){
        indicator.color = Utils.COLORS.colorAccent
        indicator.startAnimating()
    }


}

