//
//  ViewController.swift
//  HerOApp3
//
//  Created by moran levi on 28/06/2018.
//  Copyright © 2018 LeviMoran. All rights reserved.
//

import UIKit

struct cellData {
    let yearLbl: String
    let movieLbl: Int
}

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet private var tableView: UITableView!
    
    @IBOutlet private var titleActor: UINavigationItem!
    @IBOutlet private var imageActor: UIImageView!
    @IBOutlet private var nicknameLbl: UILabel!
    @IBOutlet private var YobLbl: UILabel!
    @IBOutlet private var powersLbl: UILabel!
    @IBOutlet private var originalActorLbl: UILabel!
    
    private var arrayOfCellData = [ActorData]()
    
    
    final let url = URL(string: "http://heroapps.co.il/employee-tests/ios/logan.json")
    
    public var actor:Actor? // defining an local variable
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJson()
        self.tableView.dataSource = self;
        self.tableView.delegate = self
        let nib = UINib(nibName: "ActorsCell", bundle: nil);   //TODO
        self.tableView.register(nib, forCellReuseIdentifier: "cell")
        
        imageActor.isUserInteractionEnabled = true
        self.imageActor.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(imageTapped)))
        
    }
    
    private func downloadJson(){
        guard let downloadUrl = url else {return} //make sure the url exist}
        URLSession.shared.dataTask(with: downloadUrl) { data, URLResponse,error in
            guard let data = data, error == nil, URLResponse != nil else{
                print("error decodable")
                return
            }
            print("good parsing")
            do{
                let decoder = JSONDecoder()
                let DownloadedActors = try decoder.decode(Actor.self, from: data)
                
                DispatchQueue.main.async {
                    self.actor = DownloadedActors
                    self.tableView.reloadData();
                    self.titleActor.title = self.actor?.data.name;
                }
            }catch{
                print("somethink worng after downloaded")
            }
            
            }.resume()
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = self.actor?.data.movies.count {
            return count
        }
        else{
            return 0;
        }
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ActorsCell
        
        cell?.yearLbl.text = "\(actor?.data.movies[indexPath.row].year ?? -1)"
        
        cell?.movieLbl.text = "\(actor?.data.movies[indexPath.row].name ?? "")"
        
        self.nicknameLbl.text = "Nickname:      " + "\(actor?.data.nickname ?? "")"
        self.originalActorLbl.text = "Original Actor:      " + "\(actor?.data.actorName ?? "")"
        self.YobLbl.text = "Year Born:           " + "           " + "           " + "\(actor?.data.dateOfBirth ?? -1)"
        self.powersLbl.text = "Powers:      " + "             " +   "\((actor?.data.powers) ?? [""])"
        
        
        
        getImage(url: (actor?.data.image)!, imageView: self.imageActor)
        self.imageActor.layer.cornerRadius = self.imageActor.frame.width/2
        self.imageActor.clipsToBounds = true
        
        return (cell)!
    }
    
    internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerText = UILabel()
        headerText.textColor = UIColor.white
        headerText.backgroundColor = UIColor.darkGray
        headerText.font = UIFont.boldSystemFont(ofSize: 22.0)
        headerText.adjustsFontSizeToFitWidth = true
        headerText.textAlignment = .center
        headerText.text = "Movies Played"
        headerText.sizeToFit()
        return headerText
    }
    
    internal func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    
    
    private func getImage(url: String, imageView: UIImageView){
        DispatchQueue.global(qos: .background).async {
            if let imageUrl = URL(string: url){
                do{
                    let imageData = try Data(contentsOf: imageUrl);
                    DispatchQueue.main.async {
                        imageView.image = UIImage(data: imageData, scale: 1.0);
                    }
                }
                catch{
                }
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "push"{
            let imageVC = segue.destination as! ImageViewController
            imageVC.pic = self.imageActor.image!
        }
    }
    
     @objc private func imageTapped(){
        print("image was tapped")
        
        self.performSegue(withIdentifier: "push", sender: self)
        
    }
    
    
    
}
    




