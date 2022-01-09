//
//  FirebaseUser+Extensions.swift
//  iSocialNet
//
//  Created by Miyo on 24/12/21.
//

import FirebaseAuth
import Firebase

extension User {
    func toiUser() -> iUser {
        let user = iUser(id: self.uid, name: self.displayName ?? "", imagePath: nil, email: self.email)
        return user
    }
}

extension Encodable {
    func data(using encoder: JSONEncoder = .init()) throws -> Data { try encoder.encode(self) }
    func string(using encoder: JSONEncoder = .init()) throws -> String { try data(using: encoder).string! }
    func dictionary(using encoder: JSONEncoder = .init(), options: JSONSerialization.ReadingOptions = []) throws -> [String: Any] {
        try JSONSerialization.jsonObject(with: try data(using: encoder), options: options) as? [String: Any] ?? [:]
    }
}

extension Data {
    func decodedObject<D: Decodable>(using decoder: JSONDecoder = .init()) throws -> D {
        try decoder.decode(D.self, from: self)
    }
}

extension Sequence where Element == UInt8 {
    var string: String? { String(bytes: self, encoding: .utf8) }
}
