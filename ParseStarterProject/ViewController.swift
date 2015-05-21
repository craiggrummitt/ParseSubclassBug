//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func goPin(sender: AnyObject) {
        var customObject = CustomObject()
        customObject.testString = "I am Test"
        customObject.pinInBackgroundWithBlock { (response:Bool, error:NSError?) -> Void in
            self.messageLabel.text = "Object Pinned"
        }
    }
    
    @IBAction func goRetrieve(sender: AnyObject) {
        let query = PFQuery(className:CustomObject.parseClassName())
        query.fromLocalDatastore()
        query.findObjectsInBackgroundWithBlock({
            (objects:[AnyObject]?, error: NSError?) in
            if let error = error {
                self.messageLabel.text = "Error in retrieving object"
                // There was an error
            } else {
                self.messageLabel.text = "Objects retrieved"
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        //We have an object!
                        println("We have a PFObject, now to cast as CustomObject: \(object)")
                        
                        if let object = object as? CustomObject {
                            println("We have a casted CustomObject: \(object)")
                            println(object.testString)
                            self.messageLabel.text = "Object Retrieved and cast as Custom Object"
                            
                        } else {
                            println("Couldn't cast it to CustomObject, sorry!")
                            self.messageLabel.text = "Object Retrieved - couldn't cast as Custom Object"
                        }
                    }
                }
            }
        })

    }

    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

