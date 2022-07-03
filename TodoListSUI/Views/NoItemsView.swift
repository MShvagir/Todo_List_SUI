//
//  NoItemsView.swift
//  TodoListSUI
//
//  Created by Марина Швагирь on 03.07.2022.
//

import SwiftUI

struct NoItemsView: View {
    
    @State private var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
            Text("Oh no! There are no items 😔")
                    .font(.title3)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button and add a bunch to your todo list (:")
                    .padding(.bottom, 15)
                NavigationLink(destination: AddView(), label: {
                    Text("Add something 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.accentColor : Color.purple)
                        .cornerRadius(10)
                })
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? Color.accentColor.opacity(0.7) : Color.purple.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
            Animation
                .easeInOut(duration: 2.0)
                .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
    
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        NoItemsView()
                .navigationTitle("Title")
        }
    }
}
