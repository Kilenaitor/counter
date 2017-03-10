//
//  ViewController.swift
//  counter
//
//  Created by Kyle Minshall on 3/9/17.
//  Copyright © 2017 tmg. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    
    var counter = 0;
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapped))
        self.view.addGestureRecognizer(tapGestureRecognizer)
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPressed))
        self.view.addGestureRecognizer(longPressRecognizer)
        
        let twoFingerPress = UITapGestureRecognizer(target: self, action: #selector(ViewController.twoTap))
        twoFingerPress.numberOfTouchesRequired = 2
        self.view.addGestureRecognizer(twoFingerPress)
        
        let threeFingerPress = UITapGestureRecognizer(target: self, action: #selector(ViewController.threeTap))
        threeFingerPress.numberOfTouchesRequired = 3
        self.view.addGestureRecognizer(threeFingerPress)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tapped(sender: UITapGestureRecognizer) {
        counter += 1
        updateLabel()
    }

    func longPressed(sender: UILongPressGestureRecognizer) {
        if sender.state == UIGestureRecognizerState.began {
            let refreshAlert = UIAlertController(title: "Clear the counter?", message: "Are you sure you want to reset the counter back to zero?", preferredStyle: .alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (action: UIAlertAction!) in
                self.counter = 0
                self.updateLabel()
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                // Do nothing
            }))
            
            present(refreshAlert, animated: true, completion: nil)
        }
    }
    
    func twoTap(sender: UITapGestureRecognizer) {
        counter += 2
        updateLabel()
    }
    
    func threeTap(sender: UITapGestureRecognizer) {
        counter += 3
        updateLabel()
    }

    
    func updateLabel() {
        self.textLabel.text = "\(counter)"
    }
}

