//
//  ActivityWebRequests.swift
//  NC3-Data-Final-Sample
//

import Foundation

let baseURLString = "http://127.0.0.1:3000"

enum ActivityErrors:Error{
    case serverError
    case badInputDataError
    case decodeError
}

func getAllActivities() async throws ->[Activity]{
    var request = URLRequest(url: URL(string: "\(baseURLString)")!)
    request.httpMethod = "GET"
    
    let (data, response) = try await URLSession.shared.data(for: request)
  
    guard let response = response as? HTTPURLResponse,
          response.statusCode == 200 else {
            throw ActivityErrors.serverError
          }
    
    let jsonDecoder = JSONDecoder()
    do{
        let result = try jsonDecoder.decode([Activity].self, from: data)
        return result
    }catch{
        throw ActivityErrors.decodeError
    }
}

func submitNew(activity:Activity) async throws -> [Activity]{
    var request = URLRequest(url: URL(string: "\(baseURLString)/addActivity")!)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let jsonEncoder = JSONEncoder()
    request.httpBody = try jsonEncoder.encode(activity)
    
    let (data, response) = try await URLSession.shared.data(for: request)
  
    guard let response = response as? HTTPURLResponse,
          response.statusCode == 200 else {
            throw ActivityErrors.serverError
          }
    
    let jsonDecoder = JSONDecoder()
    do{
        let result = try jsonDecoder.decode([Activity].self, from: data)
        return result
    }catch{
        throw ActivityErrors.decodeError
    }
    
}
