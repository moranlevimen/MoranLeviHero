//
//  Actors.swift
//  HerOApp3
//
//  Created by moran levi on 28/06/2018.
//  Copyright © 2018 LeviMoran. All rights reserved.
//

import UIKit
struct Actor: Decodable {
    let success: Bool
    let errorCode: Int
    let message: String
    let data: ActorData
    init(success:Bool,errorCode:Int,message:String,data:ActorData) {
        self.success = success;
        self.errorCode = errorCode;
        self.message = message;
        self.data = data
    }
}

struct Movies: Decodable {
    let name: String
    let year: Int
    init(name:String,year:Int) {
        self.name = name;
        self.year = year;
    }
}

struct ActorData: Decodable {
    let name: String
    let nickname: String
    let image: String
    let dateOfBirth: Int
    let powers: [String]
    let actorName: String
    let movies: [Movies]
    init(name:String,nickname:String,image:String,dateOfBirth:Int,powers:[String],actorName:String,movies:[Movies]) {
        self.name = name;
        self.nickname = nickname;
        self.image = image;
        self.dateOfBirth = dateOfBirth;
        self.powers = powers;
        self.actorName = actorName;
        self.movies = movies
    }
}
