//
//  FirstViewController.swift
//  Swift6WKWebView1
//
//  Created by 井戸春希 on 2021/03/04.
//

import UIKit

class FirstViewController: UIViewController {

    var type : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func youtube(_ sender: Any){
        
        type = 1
        performSegue(withIdentifier: "next", sender: nil)
        
    }
    
    
    @IBAction func doushisha(_ sender: Any) {
        
        type = 2
        performSegue(withIdentifier: "next", sender: nil)
        
    }
    
    
    @IBAction func Amazon(_ sender: Any) {
        
        type = 3
        performSegue(withIdentifier: "next", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "next"{
            let next = segue.destination as! ViewController
            next.type = self.type
        }
    }
}
