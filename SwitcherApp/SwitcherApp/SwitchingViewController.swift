//
//  SwitchingViewController.swift
//  SwitcherApp
//
//  Created by Oscar Miralles on 2022-10-03.
//  Student ID: 301250756
//
import UIKit

class SwitchingViewController: UIViewController {
    
    var blueViewController: UIKit.UIViewController?
    var yellowViewController: UIKit.UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blueViewController =
        storyboard?.instantiateViewController(withIdentifier: "Blue")
        as! BlueViewController
        
        yellowViewController =
        storyboard?.instantiateViewController(withIdentifier: "Yellow")
        as! YellowViewController
        
        if let blueViewUnW = blueViewController {
            blueViewUnW.view.frame = view.frame
        }
        switchViewController(from: nil, to: blueViewController)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
                
        if blueViewController != nil
            && blueViewController!.view.superview == nil {
            blueViewController = nil
        }
        if yellowViewController != nil
            && yellowViewController!.view.superview == nil {
            yellowViewController = nil
        }
    }
    
    private func switchViewController(from fromVC:UIViewController?,
                                          to toVC:UIViewController?) {
        if fromVC != nil {
            fromVC!.willMove(toParent: nil)
            fromVC!.view.removeFromSuperview()
            fromVC!.removeFromParent()
        }
        
        if toVC != nil {
            self.addChild(toVC!)
            self.view.insertSubview(toVC!.view, at: 0)
            toVC!.didMove(toParent: self)
        }
    }
    
    @IBAction func switchViews(sender: UIBarButtonItem) {
        // Create the new view controller, if required
        
        if yellowViewController?.view.superview == nil {
                if yellowViewController == nil {
                    yellowViewController =
                        storyboard?.instantiateViewController(withIdentifier: "Yellow")
                        as? YellowViewController
                }
            } else if blueViewController?.view.superview == nil {
                if blueViewController == nil {
                    blueViewController =
                        storyboard?.instantiateViewController(withIdentifier: "Blue")
                        as? BlueViewController
                }
            }

            // Switch view controllers
            if blueViewController != nil
                && blueViewController!.view.superview != nil {
                if let yellowViewUnW = yellowViewController {
                    yellowViewUnW.view.frame = view.frame
                }
                    switchViewController(from: blueViewController,
                                         to: yellowViewController)
            } else {
                if let blueViewUnW = yellowViewController {
                    blueViewUnW.view.frame = view.frame
                }
               switchViewController(from: yellowViewController,
                                     to: blueViewController)
            }
        }
}
