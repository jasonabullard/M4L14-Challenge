//
//  BookModel.swift
//  Lesson 15 Challenge
//
//  Created by Jason Bullard on 1/16/22.
//

import Foundation

final class BookModel: ObservableObject {
    
    @Published var books = [Book]()
    
    init() {
        
        // get books from local json file
        self.books = DataService.getLocalJsonData(forResource: "Data")
        
    }
    
    func updateFavourite(book: inout Book) {
        
        // get book index of passed in book
        if let bookIndex = self.books.firstIndex(where: { b in
            b.id == book.id
        }) {
            self.books[bookIndex].isFavourite = !book.isFavourite
        }
    }
    
}
