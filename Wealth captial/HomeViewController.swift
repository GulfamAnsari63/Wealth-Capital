//
//  HomeViewController.swift
//  Wealth captial
//
//  Created by Arshad on 17/12/24.
//
import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            // Welcome Label
            Text("Welcome User Name")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.black)
                .padding(.top, 16)
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity, alignment: .leading)  // Aligns to the left side
            
            Spacer() 
        }
        .background(Color.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}

