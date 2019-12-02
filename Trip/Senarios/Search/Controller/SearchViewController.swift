//
//  SearchViewController.swift
//  Trip
//
//  Created by Mustafa on 12/1/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import BEMCheckBox

class SearchViewController: UIViewController {
    weak var currentViewController : UIViewController?
    
    @IBOutlet weak var advanSearchChk: BEMCheckBox!
    @IBOutlet weak var searchChk: BEMCheckBox!
    @IBOutlet weak var bigView: UIView!
    let v  = SearchNormalViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentViewController = self.storyboard?.instantiateViewController(withIdentifier: "SearchNormalViewController")
        self.currentViewController?.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChild(self.currentViewController!)
       // self.bigView.addSubview(self.currentViewController!.view)
        self.addSubview(subView: self.currentViewController!.view, toView: self.bigView)
        super.viewDidLoad()
        
        
     

        // Do any additional setup after loading the view.
    }
    
    @IBAction func chechSearch(_ sender: BEMCheckBox) {
        
        if sender.tag == 1 {
            advanSearchChk.on = false
            let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "SearchNormalViewController")
                   newViewController!.view.translatesAutoresizingMaskIntoConstraints = false
                   self.cycleFromViewController(oldViewController: self.currentViewController!, toViewController: newViewController!)
                   self.currentViewController = newViewController
                 
              } else {
            searchChk.on = false
            let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "SearchAdvancedViewController")
                  newViewController!.view.translatesAutoresizingMaskIntoConstraints = false
                  self.cycleFromViewController(oldViewController: self.currentViewController!, toViewController: newViewController!)
                  self.currentViewController = newViewController
                  
              }
        
        
    }
    
    func addSubview(subView:UIView, toView parentView:UIView) {
        parentView.addSubview(subView)
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["subView"] = subView
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subView]|",
                                                                 options: [], metrics: nil, views: viewBindingsDict))
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subView]|",
                                                                 options: [], metrics: nil, views: viewBindingsDict))
        
        
        
    }
    
    
    func cycleFromViewController(oldViewController: UIViewController, toViewController newViewController: UIViewController) {
        oldViewController.willMove(toParent: nil)
        self.addChild(newViewController)
        self.addSubview(subView: newViewController.view, toView:self.bigView!)
        newViewController.view.alpha = 0
        newViewController.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.5, animations: {
            newViewController.view.alpha = 1
            oldViewController.view.alpha = 0
        },
                       completion: { finished in
                        oldViewController.view.removeFromSuperview()
                        oldViewController.removeFromParent()
                        newViewController.didMove(toParent: self)
        })
    }
    
}
