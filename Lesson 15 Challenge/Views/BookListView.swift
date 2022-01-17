//
//  BookListView.swift
//  Lesson 15 Challenge
//
//  Created by Jason Bullard on 1/16/22.
//

import SwiftUI

struct BookListView: View {
    
    @EnvironmentObject private var model: BookModel
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                LazyVStack {
                    ForEach($model.books) { $book in
                        
                        NavigationLink {
                            BookDetailView(book: $book)
                        } label: {
                            BookCardView(book: $book)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                    }
                }
                
            }
            .navigationTitle("My Library")
            
        }
        .navigationViewStyle(.stack)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BookListView()
            .environmentObject(BookModel())
    }
}
