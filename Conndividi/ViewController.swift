//
//  ViewController.swift
//  Conndividi
//
//  Created by Francesco Bordignon on 13/08/15.
//  Copyright (c) 2015 Francesco Bordignon. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func condividi(sender: UIButton) {
        
        let alert = UIAlertController(title: "Condividi con", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        alert.addAction(UIAlertAction(title: "Annulla", style: .Cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Twitter", style: .Default, handler: { (_) -> Void in
            
            if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){
            
            var twitter = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twitter.setInitialText("Iscriviti al canale")
            self.presentViewController(twitter, animated: true, completion: nil)
            }
            
        }))
        
        alert.addAction(UIAlertAction(title: "Facebook", style: .Default, handler: { (_) -> Void in
            
            if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook){
                
                var facebook = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
                facebook.setInitialText("Iscriviti al canale")
                self.presentViewController(facebook, animated: true, completion: nil)
                
            }else{
                
                let alert = UIAlertController(title: "Facebook non disponibile", message: "Puoi settare il account dalle impostazioni", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "Annulla", style: .Cancel, handler: nil))
                alert.addAction(UIAlertAction(title: "Impostazioni", style: .Default, handler: { (_) -> Void in
                    
                    if let url = NSURL(string: UIApplicationOpenSettingsURLString){
                        
                        UIApplication.sharedApplication().openURL(url)
                    }
                }))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
            }

}

