
import Foundation
import Fluent
import Vapor

final class Movie: Model, Content {
    
    static let schema = "movies" // table name
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "title")
    var title: String
    
    // hasMany - Movie has many reviews
    @Children(for: \.$movie)
    var reviews: [Review]
    
    init() {}
    
    init(id: UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
    
}
