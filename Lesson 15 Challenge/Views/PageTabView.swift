//
//  PageTabView.swift
//  Lesson 15 Challenge
//
//  Created by Jason Bullard on 1/16/22.
//

import SwiftUI

struct PageTabView: View {
    
    @Binding public var book: Book
    
    var body: some View {
        
        TabView (selection: $book.currentPage) {
            
            ForEach(0..<book.content.count) { index in
                
                VStack {
                    ScrollView(showsIndicators: false) {
                        Text(book.content[index])
                            .tag(index)
                            .padding(.bottom, 30)
                    }
                    
                    Text(String(index+1))
                }
                .padding(.horizontal, 20)
            }
            
        }
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical)
        
    }
}

struct PageTabView_Previews: PreviewProvider {
    static var previews: some View {
        PageTabView(book: .constant(Book()))
    }
}
