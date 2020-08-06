//
//  JokeData.swift
//  Quoty
//
//  Created by Venkatesh on 03/08/20.
//  Copyright © 2020 Venkatesh. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol JokeDataDelegate {
    func getJoke(joke: String)
}

struct JokeData{
    
    var delegate : JokeDataDelegate?
    
    func networking(){
    let url = "https://icanhazdadjoke.com/slack"
    getData(url: url)
    }
    
    func getData(url: String){
        if let url = URL(string: url){
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(jokedata, urlResponse, error) in
                if error != nil{
                    print("Error fetching joke data")
                    return
                }else{
                    if let safeData = jokedata {
                        do{
                        let json = try JSON(data: safeData)
                            if  let joke =  json["attachments"][0]["fallback"].string{
                                self.delegate?.getJoke(joke: joke)
                            }
                            
                        }catch{
                            print("Error in decoding Joke daata")
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
