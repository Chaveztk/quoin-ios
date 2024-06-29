////
////  SideMenuRowView.swift
////  quoin-ios-app
////
////  Created by Chavez King on 12/06/2024.
////
//
//import Foundation
//
//import SwiftUI
//
//
//struct SideMenuRowView: View {
//    let option: SideMenuOptionModal
//    @Binding var selectedOption: SideMenuOptionModal?
//    
//    private var isSelected: Bool {
//        return selectedOption == option
//    }
//    
//    var body: some View {
//        HStack {
//            Image(systemName: option.systemImageName)
//                .imageScale(.small)
//            
//            Text(option.title)
//                .font(.subheadline)
//            
//            Spacer()
//        }
//        .padding(.leading)
//        .foregroundStyle(isSelected ? .blue : .primary)
//        .frame(width: 216, height: 44)
//        .background(isSelected ? .blue.opacity(0.15) : .clear)
//        .clipShape(RoundedRectangle(cornerRadius: 10))
//    }
//}
//
//
//
//#Preview {
//    SideMenuRowView(option: .dashboard, selectedOption: .constant(.dashboard))
//}
