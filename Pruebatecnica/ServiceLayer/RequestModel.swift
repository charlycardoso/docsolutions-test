//
//  RequestModel.swift
//  Pruebatecnica
//
//  Created by Carlos Cardoso on 15/04/24.
//

import Foundation

struct RequestModel {

    let URLBase: String = "https://techhub.docsolutions.com/OnBoardingPre/WebApi/api/"
    let endPoint: EndPoints
    let httpMethod: HttpMethod = .POST
    var queryItems: [String:String]?
    var bodyItems: [String: [String:String]]?

    func getURL() -> String {
        return URLBase + endPoint.rawValue
    }

    enum HttpMethod: String {
        case POST
    }

    enum EndPoints: String {
        case login = "authentication/authentication"
        case results = "user/GetUsers "
        case registry = "user/RegisterUserRole"
    }
}
