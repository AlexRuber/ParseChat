//
//  ChatViewController.swift
//  ParseChat
//
//  Created by Mihai Ruber on 2/21/18.
//  Copyright © 2018 Mihai Ruber. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Variables
    var PFArray = [PFObject]()
    let chatMessage = PFObject(className: "Message")
    let query = PFQuery(className: "Message")
    
    // Outlets
    @IBOutlet weak var chatMessageField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Auto size row height based on cell autolayout constraints
        tableView.rowHeight = UITableViewAutomaticDimension
        // Provide an estimated row height. Used for calculating scroll indicator
        tableView.estimatedRowHeight = 50
        
        // Run a Scheduled timer every second
        //Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.onTimer), userInfo: nil, repeats: true)

        tableView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Outlet Functions
    @IBAction func sendButtonPressed(_ sender: Any) {
       
        chatMessage["user"] = PFUser.current()
        
        chatMessage["text"] = chatMessageField.text ?? ""
        chatMessage.saveInBackground { (success, error) in
            if success {
                self.chatMessageField.text = ""
                print("The message was saved!")
            } else if let error = error {
                print("Problem saving message: \(error.localizedDescription)")
            }
        }
    }
    
    func onTimer() {
        // Add code to be run periodically
        
        query.findObjectsInBackground()
        query.includeKey("user")
        print(query)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         if let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as? ChatCell {
            if let user = chatMessage["user"] as? PFUser {
                // User found!
                cell.usernameLabel.text = user.username
            } else {
                cell.usernameLabel.text = "default (no user)"
            }
            
            return cell
         }
        
        return UITableViewCell()
    }
    


}
