//
//  ViewController.swift
//  FacebookTest
//
//  Created by Quynh on 27/08/2015.
//  Copyright (c) 2015 Quynh. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKShareKit
import FBSDKLoginKit
//import ParseFacebookUtils
import FBSDKShareKit
import Foundation

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
            // User is already logged in, do work such as go to next view controller.
        }
        else
        {
            let loginView : FBSDKLoginButton = FBSDKLoginButton()
            self.view.addSubview(loginView)
            loginView.center = self.view.center
            loginView.readPermissions = ["public_profile", "email", "user_friends"]
            loginView.delegate = self
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func GetFriendsHandler(sender: UIButton) {
        
        println("Facebook Access Token = \(FBSDKAccessToken.currentAccessToken())")
        
        
        //var friendsRequest : FBSDKGraphRequest = FBSDK
        
        // Get List Of Friends
//        var friendsRequest : FBRequest = FBRequest.requestForMyFriends()
//        friendsRequest.startWithCompletionHandler{(connection:FBRequestConnection!, result:AnyObject!, error:NSError!) -> Void in
//            var resultdict = result as NSDictionary
//            println("Result Dict: \(resultdict)")
//            var data : NSArray = resultdict.objectForKey("data") as NSArray
//            
//            for i in 0...data.count {
//                let valueDict : NSDictionary = data[i] as NSDictionary
//                let id = valueDict.objectForKey("id") as String
//                println("the id value is \(id)")
//            }
//            
//            var friends = resultdict.objectForKey("data") as NSArray
//            println("Found \(friends.count) friends")
//        }
    }
    
    // Facebook Delegate Methods
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
        println("User Logged In")
        
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                // Do work
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        println("User Logged Out")
    }
    
    func returnUserData() {
        
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                println("Error: \(error)")
            }
            else
            {
                println("fetched user: \(result)")
                let userName : NSString = result.valueForKey("name") as! NSString
                println("User Name is: \(userName)")
                let userEmail : NSString = result.valueForKey("email") as! NSString
                println("User Email is: \(userEmail)")
            }
        })
    }

}

