//
//  DogAPIHelper.swift
//  DogAPITest3
//
//  Created by Yujia on 2022/2/6.
//  A00246407

import Foundation
import UIKit

struct DogAPIHelper{
    
//    private static let baseURL : String = "https://dog.ceo/api/breeds/list"
    private static let baseURL : String = "https://dog.ceo/api/breeds/"
    //private static let imageURL: String = "https://dog.ceo/api/breed/hound/images/random"
    private static let imageURL: String  = ""
    private static let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
//    static func fetch(url: String, endpoint: String, callback: @escaping (DogFetchResult) -> Void){
//        guard
//            let url = URL(string: url)
//        else{return}
//        let request = URLRequest(url: url)
//        let task = session.dataTask(with: request){ data, response, error in
//            if let data = data {
//                //print (data)
//                callback(.success(data))
//                
//            }else if let error = error {
//                callback(.failure(error))
//            }
//        }
//        task.resume()
//    }
    //end of fetch DogFetchResult

  
    //fetch dog list:
    static func fetchdog(callback: @escaping ([String]) -> Void){
        guard
            let url = URL(string: baseURL + "list")
        else{return}
        var newArray = [String]()
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            data, response, error in

            if let data = data {
                do{
                    let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                    guard
                        let jsonDictionary = jsonObject as? [AnyHashable: Any],
                        let dogType = jsonDictionary["message"] as? [String]
                    else {preconditionFailure("could not parse JSOn data")}

                    for i in 0..<dogType.count {
                       let item = dogType[i]
                        newArray.append(item)
                    }
//                    print(newArray[1])
                    OperationQueue.main.addOperation {
                        callback(newArray)
                        
                    }
                } catch let e {
                    print("error \(e)")
                }
            } else if let error = error {
                print("there was an error: \(error)")
            } else {
                print("something went wrong")
            }
        }
        task.resume()
    }//end of fetch dog list
    static func fetchImage(url: String, callback: @escaping ([String]) -> Void){
        
        guard
            let url = URL(string: url)
        else{return}
        
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            data, response, error in

            if let data = data {
                do{
                    let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                    guard
                        let jsonDictionary = jsonObject as? [AnyHashable: Any],
                        let dogImage = jsonDictionary["message"] as? [String]
                    else {preconditionFailure("could not parse JSOn data")}
      
                    OperationQueue.main.addOperation {
                        callback(dogImage)
                    }
                } catch let e {
                    print("error \(e)")
                }
            } else if let error = error {
                print("there was an error: \(error)")
            } else {
                print("something went wrong")
            }
        }
        task.resume()
    }//end of fetch dog list
}
