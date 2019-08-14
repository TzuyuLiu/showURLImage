//
//  ViewController.swift
//  Top20Pictures
//
//  Created by 劉子瑜 on 2019/7/25.
//  Copyright © 2019 劉子瑜. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showImageView: UIImageView!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var rankSlider: UISlider!
    
    var top20photo = [Photos]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let urlString = "https://api.unsplash.com/photos/?client_id=068e0a8931a6aefa60acd3886ce5e6e278fb9d436e0d15368d9eca1e6c8acd5b&order_by=latest&per_page=20"
        
        
        if let url = URL(string: urlString){

            let task = URLSession.shared.dataTask(with: url) { (data, respose, error) in

            let decoder = JSONDecoder()

            decoder.dateDecodingStrategy = .iso8601

              if let data = data,let photoResults = try?
                decoder.decode([Photos].self, from: data)
              {
                for photo in photoResults {
                    //print(photo.urls.regular)
                    
                    let task2 = URLSession.shared.dataTask(with: photo.urls.regular) { (data, response, error) in
                        if let data = data{
                            DispatchQueue.main.async {
                                self.showImageView.image = UIImage(data: data)
                            }
                        }
                    }
                    
                    task2.resume()
                    
                    
                }
              } else {
                print("error")
                }

            }

            task.resume()
        }
        

    }
    
    func getImage(url: URL?) -> UIImage? {
        var image: UIImage?
        if let url = url{
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data{
                    image = UIImage(data: data)
                }
            }
            task.resume()
        }
        
        return image
    }
}

