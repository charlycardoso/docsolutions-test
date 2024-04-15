//
//  LoginModel.swift
//  Pruebatecnica
//
//  Created by Carlos Cardoso on 15/04/24.
//

import Foundation

// MARK: - LoginModel
struct LoginModel: Codable {
    let transactionID: String
    let body: Body
    let encryptedBody, securityData: JSONNull?
    let isOK: Bool
    let messages: JSONNull?
    let responseCode: Int

    enum CodingKeys: String, CodingKey {
        case transactionID = "TransactionId"
        case body = "Body"
        case encryptedBody = "EncryptedBody"
        case securityData = "SecurityData"
        case isOK = "IsOK"
        case messages = "Messages"
        case responseCode = "ResponseCode"
    }
}

// MARK: - Body
struct Body: Codable {
    let userLoginData: UserLoginData
    let jwtExpireTimeOfflineMinutes: Int
    let token: String

    enum CodingKeys: String, CodingKey {
        case userLoginData = "UserLoginData"
        case jwtExpireTimeOfflineMinutes = "JWTExpireTimeOfflineMinutes"
        case token = "Token"
    }
}

// MARK: - UserLoginData
struct UserLoginData: Codable {
    let id: Int
    let username, name, fatherLastName, motherLastName: String
    let email, phoneNumber: String
    let metadata: [Metadatum]
    let securityLoginData: SecurityLoginData
    let currentFileID: Int

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case username = "Username"
        case name = "Name"
        case fatherLastName = "FatherLastName"
        case motherLastName = "MotherLastName"
        case email = "Email"
        case phoneNumber = "PhoneNumber"
        case metadata = "Metadata"
        case securityLoginData = "SecurityLoginData"
        case currentFileID = "CurrentFileId"
    }
}

// MARK: - Metadatum
struct Metadatum: Codable {
    let name, groupName, value: String

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case groupName = "GroupName"
        case value = "Value"
    }
}

// MARK: - SecurityLoginData
struct SecurityLoginData: Codable {
    let roles: [Role]
    let applications: [Application]

    enum CodingKeys: String, CodingKey {
        case roles = "Roles"
        case applications = "Applications"
    }
}

// MARK: - Application
struct Application: Codable {
    let id: Int
    let name: String
    let modules: [Module]

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case modules = "Modules"
    }
}

// MARK: - Module
struct Module: Codable {
    let id: Int
    let name: String
    let functions: [Role]

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case functions = "Functions"
    }
}

// MARK: - Role
struct Role: Codable {
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
    }
}

class JSONNull: Codable, Hashable {
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: ""))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
