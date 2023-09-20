//
//  APIMainClient.swift
//  MobileAppPromoFarras
//
//  Created by Farras on 20/09/23.
//

import Foundation

struct APIMainClient: MainClient {
    func fetchPromo(completion: @escaping ([Promo]) -> Void) {
        guard let apiUrl = URL(string: "https://content.digi46.id/promos") else { return }
        
        let session = URLSession.shared
        let task = session.dataTask(with: apiUrl) { (data, response, error) in
            if let error = error {
                print("Error fetching promo: \(error)")
                completion([])
            } else if let data = data {
                handlePromoData(data: data, completion: completion)
            } else {
                completion([])
            }
        }
        task.resume()
    }
    func handlePromoData(data: Data, completion: ([Promo]) -> Void) {
        do {
            let decoder = JSONDecoder()
            let responseData = try decoder.decode([Promo].self, from: data)
            completion(responseData)
        } catch {
            completion([])
            print("Error decoding JSON: \(error)")
        }
    }
}
