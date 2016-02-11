//
//  ViewController.swift
//  FinalCalculator
//
//  Created by Malhotra,Prankur on 2/10/16.
//  Copyright © 2016 Malhotra,Prankur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var regular:RegularCalc!
   
    var scientific:ScientificViewController!
    
    var appDelegate:AppDelegate!
    
    var operation:String!
    var type:Type!

    @IBOutlet weak var scilabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        let vc0 = RegularCalc(nibName: "regular", bundle: nil)
        
        self.addChildViewController(vc0)
        self.scrollView.addSubview(vc0.view)
        vc0.didMoveToParentViewController(self)
        
        let vc1 = ScientificViewController(nibName: "scientific", bundle:nil)
        
        var frame1 = vc1.view.frame
        frame1.origin.x = self.view.frame.size.width-50
        vc1.view.frame = frame1
        
        self.addChildViewController(vc1)
        self.scrollView.addSubview(vc1.view)
        vc1.didMoveToParentViewController(self)

        
      self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 2,0);
        
        let appDelegate=UIApplication.sharedApplication().delegate as! AppDelegate

        appDelegate.regularViewController = vc0
        appDelegate.scientificController = vc1
        appDelegate.baseViewController = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    enum Type:String{
        case REG="regular"
        case SCI="SCI"
    }


}

