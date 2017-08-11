//
//  ViewController.swift
//  Multithreading
//
//  Created by Tanja Keune on 8/10/17.
//  Copyright © 2017 SUGAPP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.activityIndicator.stopAnimating()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func image1Button(_ sender: Any) {
        updateImage(button: 1)
    }

    @IBAction func image2Button(_ sender: Any) {
        updateImage(button: 2)
    }
    
    @IBAction func image3Button(_ sender: Any) {
        updateImage(button: 3)
    }
    
    func updateImage(button: Int) {
        self.activityIndicator.startAnimating()
        var imageURL = URL(string: "")
        
        switch button {
        case 1:
            imageURL = URL(string: "http://www.spyderonlines.com/images/squirrel_tail_furry_tree_85739.jpg")
        case 2:
            imageURL = URL(string: "http://www.spyderonlines.com/images/austin_texas_river_rocks_beach_trees_reflection_58986.jpg")
        case 3:
            imageURL = URL(string: "http://www.spyderonlines.com/images/macro_grasshopper_dandelion_dew_drops_light_95873.jpg")
            
        default:
            print("Never read the images")
            break
        }
        
        //Asynchronous
        
        DispatchQueue.global(qos: DispatchQoS.userInitiated.qosClass).async {
        
            let fetch = NSData(contentsOf: imageURL! as URL)
            DispatchQueue.main.async {
                if let imageData = fetch {
                    self.activityIndicator.stopAnimating()
                    self.imageView.image = UIImage(data: imageData as Data)
                }
            }
        }
    }
}

