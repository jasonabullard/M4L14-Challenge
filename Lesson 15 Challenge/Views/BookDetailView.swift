//
//  BookDetailView.swift
//  Lesson 15 Challenge
//
//  Created by Jason Bullard on 1/16/22.
//

import SwiftUI

struct BookDetailView: View {
    
    @Binding public var book: Book
    
    @EnvironmentObject var model: BookModel
    
    var body: some View {
        
        VStack (alignment: .center, spacing: 0) {
            
            VStack {
                Text("Read Now!")
                    .font(.title2)
                    .padding(.bottom, 20)
                
                NavigationLink {
                    PageTabView(book: $book)
                } label: {
                    Image("cover\(book.id)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .padding([.horizontal, .bottom], 40)
            }
            
            VStack {
                Text("Mark for later!")
                    .bold()
                
                Button {
                    model.updateFavourite(book: &book)
                } label: {
                    
                    Image(systemName: book.isFavourite == true ? "star.fill" : "star")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.yellow)
                }
            }
            .padding(.bottom, 40)
            
            VStack {
                Text("Rate \(book.title)")
                    .bold()
                    .padding(.bottom)
                
                Picker("", selection: $book.rating) {
                    ForEach(1...5, id: \.self) {index in
                        Text(String(index)).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 40)
            }
        }
        .padding()
        .navigationTitle(book.title)
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView(book: .constant(Book()))
    }
}
