//
//  File.swift
//  
//
//  Created by Metin Atalay on 14.07.2022.
//

import Foundation
import Vapor
import Fluent
import FluentPostgresDriver

final class Actor: Model, Content {
    
    static let schema = "actors"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Siblings(through: MovieActor.self, from: \.$actor, to: \.$movie)
    var movies: [Movie]
    
    init() {}
    
    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
    
    
}

