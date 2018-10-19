//
//  ViewController.swift
//  FetchResultExample
//
//  Created by anhxa100 on 10/18/18.
//  Copyright © 2018 anhxa100. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textFieldsave: UITextField!
    @IBOutlet weak var textFieldShow: UITextField!
    @IBOutlet weak var saveImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    @IBAction func save(_ sender: Any) {
        if textFieldsave.text != nil {
            
            let entity = Hero(context: AppDelegate.context) // tao entity theo kieu Hero
            entity.name = textFieldsave.text //thay doi name cho entity
            AppDelegate.saveContext()
            
        }
    }
    
    @IBAction func show(_ sender: Any) {
        do {
            if let entity = try AppDelegate.context.fetch(Hero.fetchRequest()) as? [Hero] {
                textFieldShow.text = entity.last?.name
            }
        } catch {
            print("Error")
        }
    }
    
}

