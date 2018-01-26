//
//  ViewController.swift
//  PHPWebServiceSwift
//
//  Created by MAC OS on 6/23/17.
//  Copyright © 2017 MAC OS. All rights reserved.
//

import UIKit

class ViewController: UIViewController,URLSessionDelegate {

    @IBOutlet weak var txtid: UITextField!
    
    @IBOutlet weak var txtfn: UITextField!
    
    @IBOutlet weak var txtag: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnselect(_ sender: Any) {
        
        let str = "http://localhost/Ankit_Webservice/select.php";
        
        let url =  URL(string: str);
        
        let requet = URLRequest(url: url!);
        
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil);
        
        let task = session.dataTask(with: requet) { (data, responce, err) in
            
            let result = String(data: data!, encoding: String.Encoding.utf8);
            
            print(result!);
        }
        
        task.resume();
    }
    
    @IBAction func btninsert(_ sender: Any) {
        
        let str = "http://localhost/Ankit_Webservice/insert.php?fname=\(txtfn.text!)&age=\(txtag.text!)";
        
        let url = URL(string: str);
        
        let requet = URLRequest(url: url!);
        
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil);
        
        let task = session.dataTask(with: requet) { (data, responce, err) in
            
            let result = String(data: data!, encoding: String.Encoding.utf8);
            
            print(result!);
        }
        
        task.resume();
    }
    
    @IBAction func btnupdate(_ sender: Any) {
        
        let str = "http://localhost/Ankit_Webservice/update.php?sid=\(txtid.text)&fname=\(txtfn.text!)&age=\(txtag.text!)";
        
        let url = URL(string: str);
        
        let requet = URLRequest(url: url!);
        
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil);
        
        let task = session.dataTask(with: requet) { (data, responce, err) in
            
            let result = String(data: data!, encoding: String.Encoding.utf8);
            
            print(result!);
        }
        
        task.resume();
    }

    @IBAction func btndelete(_ sender: Any) {
        
        let str = "http://localhost/Ankit_Webservice/delete.php?sid=\(txtid.text)&fname=\(txtfn.text!)&age=\(txtag.text!)";
        
        let url = URL(string: str);
        
        let requet = URLRequest(url: url!);
        
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil);
        
        let task = session.dataTask(with: requet) { (data, responce, err) in
            
            let result = String(data: data!, encoding: String.Encoding.utf8);
            
            print(result!);
        }
        
        task.resume();
    }
}

