//
//  HomeViewController.swift
//  ACE-online
//
//  Created by Priyanshu Chouhan on 05/07/22.
//

import UIKit

class HomeViewController: UIViewController, SideMenuBarViewControllerDelegate {
    
    
    
    
    var sideMenuBarViewController: SideMenuBarViewController?
    
   
    @IBOutlet weak var leadingConstraintsForSideBar: NSLayoutConstraint!
    
    @IBOutlet weak var sideMenuBar: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        sideMenuBar.isHidden = true

        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "sideMenuSegue") {
            if let controller = segue.destination as? SideMenuBarViewController
            {
                self.sideMenuBarViewController = controller
                self.sideMenuBarViewController?.delegate = self
                
              
            }
        }
       }

    func hideSideMenu() {
        self.hideSideMenu()
        }

    private func hideSideMenuBar(){
        
        UIView.animate(withDuration: 0.1) {
            self.leadingConstraintsForSideBar.constant = 0
            self.view.layoutIfNeeded()
        } completion: { (status) in
            UIView.animate(withDuration: 0.1) {
                self.leadingConstraintsForSideBar.constant = -280
                self.view.layoutIfNeeded()
            } completion: { (status) in
                self.sideMenuBar.isHidden = true
                self.isSideMenuShow = false
            }
        }

        
        
        
        
    }
    @IBAction func sideMenuButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            self.leadingConstraintsForSideBar.constant = 10
            self.view.layoutIfNeeded()
        } completion: { (status) in
            UIView.animate(withDuration: 0.1) {
                self.leadingConstraintsForSideBar.constant = 0
                self.view.layoutIfNeeded()
            } completion: { (status) in
                self.sideMenuBar.isHidden = false
                self.isSideMenuShow = true
            }
       
        }
        
    }
    
    @IBAction func tappedOnBackView(_ sender: Any) {
        self.hideSideMenuBar()
    }
    
  private var isSideMenuShow = false
  
    private var beginPoint: CGFloat = 0.0
    
    private var difference: CGFloat = 0.0
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(isSideMenuShow){
            if let touch = touches.first{
                let location = touch.location(in: sideMenuBar)
                
                beginPoint = location.x
            }
            
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(isSideMenuShow){
            if let touch = touches.first{
                let location = touch.location(in: sideMenuBar)
                
                let differenceFromBeginPoint = beginPoint - location.x
                
                if(differenceFromBeginPoint > 0 && differenceFromBeginPoint < 280){
                    self.leadingConstraintsForSideBar.constant = -differenceFromBeginPoint
                    difference = differenceFromBeginPoint
                }
            }
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(isSideMenuShow){
            if let touch = touches.first{
                if(difference > 140){
                    UIView.animate(withDuration: 0.1) {
                        self.leadingConstraintsForSideBar.constant = -290
                        self.view.layoutIfNeeded()
                    } completion: { (status) in
                        self.sideMenuBar.isHidden = true
                        self.isSideMenuShow = false
                    }

                }
                else{
                    UIView.animate(withDuration: 0.1) {
                        self.leadingConstraintsForSideBar.constant = 0
                        self.view.layoutIfNeeded()
                    } completion: { (status) in
                        self.sideMenuBar.isHidden = false
                        self.isSideMenuShow = true
                    }
                    
                }
            }
            
        }
    }
}

