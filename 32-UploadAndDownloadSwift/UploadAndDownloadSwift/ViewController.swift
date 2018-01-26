//
//  ViewController.swift
//  UploadAndDownloadSwift
//
//  Created by MACOS on 7/10/17.
//  Copyright © 2017 MACOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var imgv: UIImageView!
    
    @IBOutlet weak var tbl: UITableView!
    
    var imagepicker = UIImagePickerController();
    var arr : [String] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loaddata();
    }
    
    func loaddata() {
        
        let url = URL(string: "http://localhost/Ankit_Webservice/select_image.php");
        do
        {
            let data = try Data(contentsOf: url!);
            do
            {
                let dic = try JSONSerialization.jsonObject(with: data, options: []) as! [[String:Any]];
                
                arr.removeAll();
                //loop
                for item in dic
                {
                    arr.append(item["image"] as! String);
                }
            }
            catch{}
        }
            
        catch{}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnupload(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            imagepicker.delegate = self;
            imagepicker.sourceType = .photoLibrary;
            imagepicker.allowsEditing = false;
            self.present(imagepicker, animated: true, completion: nil);
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        imgv.image = info[UIImagePickerControllerOriginalImage] as? UIImage;
        self.dismiss(animated: true, completion: nil);
        
        let url = URL(string: "http://localhost/Ankit_Webservice/image.php");
        let img1 = imgv.image;
        let imgdata = UIImageJPEGRepresentation(img1!, 1.0);
        let base64 = imgdata?.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters);
        let param = String("image=\(base64!)")
        let dt = param?.data(using: String.Encoding.utf8)
        let len = param?.characters.count
        var request = URLRequest(url: url!);
        request.addValue(String(describing: len), forHTTPHeaderField: "Content-Length")
        request.httpMethod = "POST";
        request.httpBody = dt;
        let session = URLSession.shared;
        let datatask = session.dataTask(with: request, completionHandler: {(data1, res, err) in
            let str = String(data: data1!, encoding: String.Encoding.utf8);
            //print(str!);
            
            DispatchQueue.main.async {
                
                self.loaddata();
                self.tbl.reloadData();
            }
        })
        datatask.resume();
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath);
        
        let dic = arr[indexPath.row];
        
        //cell.cellviewtxt.text = "Sagar";
        
        //code for Display in imageview of cell
        
        if let url = NSURL(string: "http://localhost/Ankit_Webservice/\(dic)")
        {
            if let imageData = NSData(contentsOf: url as URL)
            {
                let str64 = imageData.base64EncodedData(options: .lineLength64Characters)
                let data: NSData = NSData(base64Encoded: str64 , options: .ignoreUnknownCharacters)!
                
                cell.imageView?.image = UIImage(data: data as Data);
            }
        }
        return cell;
        
    }
    
}

