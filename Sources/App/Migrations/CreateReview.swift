//
//  CreateReview.swift
//  
//
//  Created by Metin Atalay on 14.07.2022.
//

import Fluent

struct CreateReview: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("reviews")
            .id()
            .field("title", .string)
            .field("body", .string)
            .field("movie_id", .uuid, .references("movies", "id"))
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema("reviews").delete()
    }
}

