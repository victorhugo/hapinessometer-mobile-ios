//
//  HomeViewController.swift
//  Happy
//
//  Created by Victor Hugo Pérez Alvarado on 5/31/16.
//  Copyright © 2016 nearsoft. All rights reserved.
//

import UIKit
import SVProgressHUD

enum Mood {
    case SAD, HAPPY, NEUTRAL
}

class HomeViewController: UIViewController, UIScrollViewDelegate {
    
    
    let animationLength = 1.5
    
    @IBOutlet weak var baseScroll: UIScrollView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        print("Heigth \(self.baseScroll.frame.height)")
        
        self.baseScroll.contentSize = CGSize(width: CGFloat(self.baseScroll.frame.width * 3), height:  self.baseScroll.frame.height)
        
        self.baseScroll.contentOffset = CGPoint(x: self.baseScroll.frame.width, y: 0.0)
        
        SVProgressHUD.setMinimumDismissTimeInterval(animationLength)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        var  mood:Mood?
        
        if (offset.x == 0){
            mood = Mood.SAD
                
                SVProgressHUD.showSuccessWithStatus("Feedback Sent")
            
        }else if(offset.x == (self.baseScroll.frame.width * 2)){
        
            mood = Mood.HAPPY
            SVProgressHUD.showSuccessWithStatus("Feedback Sent")
        }
        
        
        
        
        if let moodSelected = mood{
            
            UIView.animateWithDuration(0.5, animations: {
                self.baseScroll.alpha = 0.0
                }, completion: { (flag) in
                    
                 self.baseScroll.setContentOffset(CGPoint(x:self.baseScroll.frame.width, y:0.0), animated: false)
            })
            
            NSTimer.scheduledTimerWithTimeInterval(animationLength, target: self, selector: #selector(HomeViewController.makeTransition), userInfo: nil, repeats: false)
        }
    }
    
    func makeTransition(){
        UIView.animateWithDuration(0.5, animations: {
            self.baseScroll.alpha = 1.0
            }, completion: { (flag) in
                
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
