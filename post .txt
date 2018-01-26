//
//  ViewController.swift
//  PHPWebservicePOSTMethodSwift
//
//  Created by MAC OS on 26/06/2017.
//  Copyright © 2017 MAC OS. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var txtid: UITextField!
    
    @IBOutlet weak var txtfn: UITextField!
    
    @IBOutlet weak var txtag: UITextField!
    
    @IBOutlet weak var tbl: UITableView!
    
    
    var arr:[Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind();
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func bind()
    {
        let str = "http://localhost/Ankit_Webservice/select.php";
        //let strbody = "";
        
        let url = URL(string: str);
        
        let request = URLRequest(url: url!);
        
        //let strlen = strbody.characters.count;
        
        //let bodydata = strbody.data(using: String.Encoding.utf8);
        
        //request.httpBody = bodydata;
        
        //request.httpMethod = "POST";
        
        //request.addValue(String(strlen), forHTTPHeaderField: "Content-Length");
        
        let session = URLSession.shared;
        
        let task = session.dataTask(with: request, completionHandler: {(data1,res,err) in
            
            let result = String(data : data1!, encoding:String.Encoding.utf8);
            
            print(result!);
            
            DispatchQueue.main.async {
                do
                {
                    let brr = try JSONSerialization.jsonObject(with: data1!, options: []) as! [Any];
                    
                    self.arr.removeAll();
                    for i in brr
                    {
                        self.arr.append(i);
                    }
                    
                    self.tbl.reloadData();
                    print(self.arr);
                }
                catch{}
                
            }
        })
        task.resume();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btninsert(_ sender: Any) {
        
        let str = "http://localhost/Ankit_Webservice/insert_post.php";
        let strbody = "fname=\(txtfn.text!)&age=\(txtag.text!)";
        
        let url = URL(string: str);
        
        var request = URLRequest(url: url!);
        
        let strlen = strbody.characters.count;
        
        let bodydata = strbody.data(using: String.Encoding.utf8);
        
        request.httpBody = bodydata;
        
        request.httpMethod = "POST";
        
        request.addValue(String(strlen), forHTTPHeaderField: "Content-Length");
        
        let session = URLSession.shared;
        
        let task = session.dataTask(with: request, completionHandler: {(data1,res,err) in
            
            let result = String(data : data1!, encoding:String.Encoding.utf8);
            
            print(result!);
            
            DispatchQueue.main.async {
                
                self.bind();
                
            }
        })
        task.resume();
    }

    @IBAction func btnupdate(_ sender: Any) {
        
        let str = "http://localhost/Ankit_Webservice/update_post.php";
        let strbody = "sid=\(txtid.text!)&fname=\(txtfn.text!)&age=\(txtag.text!)";
        
        let url = URL(string: str);
        
        var request = URLRequest(url: url!);
        
        let strlen = strbody.characters.count;
        
        let bodydata = strbody.data(using: String.Encoding.utf8);
        
        request.httpBody = bodydata;
        
        request.httpMethod = "POST";
        
        request.addValue(String(strlen), forHTTPHeaderField: "Content-Length");
        
        let session = URLSession.shared;
        
        let task = session.dataTask(with: request, completionHandler: {(data1,res,err) in
            
            let result = String(data : data1!, encoding:String.Encoding.utf8);
            
            print(result!);
            
            DispatchQueue.main.async {
                
                self.bind();
                
            }
        })
        task.resume();
    }
    
    @IBAction func btndelete(_ sender: Any) {
        
        let str = "http://localhost/Ankit_Webservice/delete_post.php";
        let strbody = "sid=\(txtid.text!)";
        
        let url = URL(string: str);
        
        var request = URLRequest(url: url!);
        
        let strlen = strbody.characters.count;
        
        let bodydata = strbody.data(using: String.Encoding.utf8);
        
        request.httpBody = bodydata;
        
        request.httpMethod = "POST";
        
        request.addValue(String(strlen), forHTTPHeaderField: "Content-Length");
        
        let session = URLSession.shared;
        
        let task = session.dataTask(with: request, completionHandler: {(data1,res,err) in
            
            let result = String(data : data1!, encoding:String.Encoding.utf8);
            
            print(result!);
            
            DispatchQueue.main.async {
                
                self.bind();
                
            }
        })
        task.resume();
    }
    
    @IBAction func btnselect(_ sender: Any) {
        
        self.bind();
        /*
        let str = "http://localhost/Ankit_Webservice/select.php";
        let strbody = "";
        
        let url = URL(string: str);
        
        var request = URLRequest(url: url!);
        
        let strlen = strbody.characters.count;
        
        let bodydata = strbody.data(using: String.Encoding.utf8);
        
        request.httpBody = bodydata;
        
        request.httpMethod = "POST";
        
        request.addValue(String(strlen), forHTTPHeaderField: "Content-Length");
        
        let session = URLSession.shared;
        
        let task = session.dataTask(with: request, completionHandler: {(data1,res,err) in
            
            let result = String(data : data1!, encoding:String.Encoding.utf8);
            
            print(result!);
            
            DispatchQueue.main.async {
                do
                {
                    let brr = try JSONSerialization.jsonObject(with: data1!, options: []) as! [Any];
                    
                    self.arr.removeAll();
                    for i in brr
                    {
                        self.arr.append(i);
                    }
                    
                    self.tbl.reloadData();
                    print(self.arr);
                }
                catch{}
            }
        })
        task.resume();
         */
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arr.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "c1") as! first;
        
        let dic = arr[indexPath.row] as! [String:Any];
        
        cell.txid.text = dic["student_id"] as! String;
        cell.txfn.text = dic["f_name"] as! String;
        cell.txag.text = dic["age"] as! String;
        
        return cell;
    }
    
}

