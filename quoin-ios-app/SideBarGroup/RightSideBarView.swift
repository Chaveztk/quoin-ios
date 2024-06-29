////
////  RightSideBarView.swift
////  quoin-ios-app
////
////  Created by Chavez King on 12/06/2024.
////
//
//import Foundation
//
//
//
//
//import SwiftUI
//
//struct ContentView: View {
//  
//  
//  @State private var showMenu: Bool = false
//  
//  
//  var body: some View {
//    NavigationView {
//      
//      ZStack {
//        
//        Color.mint.ignoresSafeArea(.all, edges: .all)
//        
//        VStack {
//          Text("ContentView")
//            .padding()
//            .font(.title)
//            .foregroundColor(.white)
//        }
//        
//        GeometryReader { _ in
//          
//          HStack {
//            Spacer()
//            
//            SideMenuView()
//              .offset(x: showMenu ? 0 : UIScreen.main.bounds.width)
//              .animation(.easeInOut(duration: 0.4), value: showMenu)
//          }
//          
//        }
//        .background(Color.black.opacity(showMenu ? 0.5 : 0))
//        
//      }
//      
//      .navigationBarTitleDisplayMode(.inline)
//      .toolbar {
//        
//        Button {
//          self.showMenu.toggle()
//        } label: {
//          
//          if showMenu {
//            
//            Image(systemName: "xmark")
//              .font(.title)
//              .foregroundColor(.red)
//            
//          } else {
//            Image(systemName: "text.justify")
//              .font(.title)
//              .foregroundColor(.red)
//          }
//          
//        }
//      }
//    }
//  }
//}
//
//
//
//
////
////  SideMenuView.swift
////  SideMenuDemo
////
////  Created by David Razmadze on 11/3/21.
////
//
//import SwiftUI
//
//struct SideMenuView: View {
//  
//  var body: some View {
//    VStack {
//      Text("Settings")
//        .font(.title)
//        .foregroundColor(.white)
//      
//      Divider()
//        .frame(width: 200, height: 2)
//        .background(Color.white)
//        .padding(.horizontal, 16)
//      
//
//      
//      Spacer()
//    }
//    .padding(32)
//    .background(Color.black)
//    .edgesIgnoringSafeArea(.bottom)
//  }
//  
//}
//
////struct SideMenuView_Previews: PreviewProvider {
////  static var previews: some View {
////    SideMenuView()
////  }
////}
//
//
//struct ContentView_Previews: PreviewProvider {
//  static var previews: some View {
//    ContentView()
//  }
//}
//
//
//
//
