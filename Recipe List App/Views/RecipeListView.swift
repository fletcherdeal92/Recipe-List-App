//
//  ContentView.swift
//  Recipe List App
//
//  Created by Fletcher Deal on 10/13/21.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        // MARK: Navigation
        NavigationView {
            
            VStack(alignment: .leading) {
                Text("All Recipes")
                    .bold()
                    .padding(.top, 40)
                    .font(.largeTitle)
                ScrollView {
                    LazyVStack (alignment: .leading) {
                        ForEach (model.recipes) { r in
                            
                            NavigationLink {
                                RecipeDetailView(recipe: r)
                            } label: {
                                HStack {
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(7)
                                    Text(r.name)
                                        .foregroundColor(.black)
                                }
                                
                            }
                        }
                    }
                }
                .navigationBarHidden(true)
            }
            .padding(.leading)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let myEnvObj = RecipeModel()
    static var previews: some View {
        RecipeListView()
            .environmentObject(myEnvObj)
    }
}
