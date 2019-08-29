//
//  GetDataFromApi.swift
//  EpicuriousClone
//
//  Created by Tringapps on 29/08/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import Foundation
class GetDataFromApi {
    class func getJsonArrayFromApi<T: Decodable>(fromUrl url:String, dispatchGroup:DispatchGroup, completion:@escaping (T)->Void) {
        dispatchGroup.enter();
        let urlObject = URL(string: url)
        URLSession.shared.dataTask(with: urlObject!) {(data, response, error) in
            do {
                guard let data = data else{return}
                let jsonArray = try JSONDecoder().decode(T.self, from: data)
                completion(jsonArray);

            } catch {
                print("Error in Fetching Data: \(error)")
            }
            print("Network Request Is Completed")
            dispatchGroup.leave();
            }.resume()
    }

    class func getJsonArrayFromFile<T: Decodable>(fromFile urlObject:URL, dispatchGroup:DispatchGroup, completion:@escaping (T)->Void) {
        dispatchGroup.enter();
        URLSession.shared.dataTask(with: urlObject) {(data, response, error) in
            do {
                guard let data = data else{return}
                let jsonArray = try JSONDecoder().decode(T.self, from: data)
                completion(jsonArray);

            } catch {
                print("Error in Fetching Data: \(error)")
            }
            print("Network Request Is Completed")
            dispatchGroup.leave();
            }.resume()
    }
}
