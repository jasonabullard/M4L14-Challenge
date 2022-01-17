//
//  BookCardView.swift
//  Lesson 15 Challenge
//
//  Created by Jason Bullard on 1/16/22.
//

import SwiftUI

struct BookCardView: View {
    
    @Binding public var book: Book
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(6)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
            
            VStack (alignment: .leading) {
                
                HStack (alignment: .center) {
                    Text(book.title)
                        .font(.title2)
                        .bold()
                    
                    Spacer()
                    
                    if (book.isFavourite == true) {
                        
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.yellow)
                        
                    }
                }
                .padding(.bottom, 4)
                
                Text(book.author)
                    .italic()
                
                Image("cover\(book.id)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .padding()
            
            
        }
        .padding()
        
    }
}

struct BookCardView_Previews: PreviewProvider {
    static var previews: some View {
        BookCardView(book: .constant(Book()))
    }
}
