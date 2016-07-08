//
//  ViewController.swift
//  NSUserDefaults-storing-data
//
//  Created by Todd Cardoso on 2016-07-07.
//  Copyright © 2016 Todd Cardoso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var favLabel: UILabel!
    
    var people = [Person]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let color = NSUserDefaults.standardUserDefaults().valueForKey("color") as? String {
            favLabel.text = "Favorite Color: \(color)"
        } else {
            favLabel.text = "Pick a color:"
        }
        
        let personA = Person(first: "Wing", last: "Sun")
        let personB = Person(first: "Lady", last: "Gaga")
        let personC = Person(first: "Justin", last: "Trudeau")
        
        people.append(personA)
        people.append(personB)
        people.append(personC)
        
        let peopleData = NSKeyedArchiver.archivedDataWithRootObject(people)
        
        NSUserDefaults.standardUserDefaults().setObject(peopleData, forKey: "people")
        NSUserDefaults.standardUserDefaults().synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func red(sender: AnyObject) {
        favLabel.text = "Favorite Color: Red"
        NSUserDefaults.standardUserDefaults().setValue("Red", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
    }

    @IBAction func yellow(sender: AnyObject) {
        favLabel.text = "Favorite Color: Yellow"
        NSUserDefaults.standardUserDefaults().setValue("Yellow", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        if let loadedPeople = NSUserDefaults.standardUserDefaults().objectForKey("people") as? NSData {
            if let peopleArray = NSKeyedUnarchiver.unarchiveObjectWithData(loadedPeople) as? [Person] {
                
                for person in peopleArray {
                    print(person.firstName)
                }
            }
        }
        
        
    }

    @IBAction func blue(sender: AnyObject) {
        favLabel.text = "Favorite Color: Blue"
        NSUserDefaults.standardUserDefaults().setValue("Blue", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    
    
}

