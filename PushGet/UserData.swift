//
//  UserData.swift
//  PushGet
//
//  Created by Taisuke Fukuno on 2021/01/11.
//

import Foundation

class UserData : ObservableObject {
    static let shared = UserData()
    @Published var token = "deviceToken"
}
