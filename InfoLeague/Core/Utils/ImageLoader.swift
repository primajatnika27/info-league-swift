//
//  ImageLoader.swift
//  InfoLeague
//
//  Created by Prima Jatnika on 20/11/23.
//

import Foundation

struct ImageLoader {
    var session = URLSession.shared

    func loadItems(from url: URL) async throws -> Data {
        let (data, _) = try await session.data(from: url)
        return data
    }
}
