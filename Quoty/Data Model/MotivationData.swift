//
//  MotivationData.swift
//  Quoty
//
//  Created by Venkatesh on 03/08/20.
//  Copyright © 2020 Venkatesh. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol MotivationDataDelegate {
    func getMotivation(motivation: String)
}

struct MotivationData {
    
    func networking(){
    let url = "https://api.quotable.io/random"
    getData(url: url)
    }
    var delegate : MotivationDataDelegate?
    
    func getData(url: String){
        if let url = URL(string: url){
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (motivationData, response, error) in
                if error != nil{
                    print("Error decoding Motivation Data")
                    return
                }else{
                    if   let safeData = motivationData{
                        do{
                             let json = try JSON(data: safeData)
                            if  let motivation = json["content"].string{
                                self.delegate?.getMotivation(motivation: motivation)
                            }
                            
                        }catch{
                            print("Error in Motivation Data")
                        }
                       
                    }
                }
            }
            task.resume()
        }
    }
}
