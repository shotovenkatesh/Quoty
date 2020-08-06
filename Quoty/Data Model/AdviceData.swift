//
//  AdviceData.swift
//  Quoty
//
//  Created by Venkatesh on 03/08/20.
//  Copyright © 2020 Venkatesh. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol AdviceDataDelegate {
    func getAdvice(advice: String)
}

struct AdviceData{
    func networking(){
        let url = "https://api.adviceslip.com/advice"
        getData(url: url)
    }
    var delegate : AdviceDataDelegate?
    
    func getData(url:String){
        if let url = URL(string: url){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (adviceData, response, error) in
                if error != nil{
                    print("Error decoding advice data")
                    return
                }else{
                    if let safeData = adviceData{
                        do{
                            let json = try JSON(data: safeData)
                            if  let adviceData = json["slip"]["advice"].string{
                                self.delegate?.getAdvice(advice: adviceData)
                            }
                            
                        }catch{
                            return
                        }
                        
                    }
                }
            }
            task.resume()
        }
        
    }
}
