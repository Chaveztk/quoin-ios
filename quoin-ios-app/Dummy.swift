import SwiftUI


struct DummyView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Background()
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        
//                        VStack {
//                            Text("Robinscroft Mews")
//                                .font(.headline)
//                                .multilineTextAlignment(.center)
//                                .padding(.horizontal)
//                                .fontWeight(.bold)
//
//                            
//                            Text("Annual General Meeting")
//                                .font(.subheadline)
//                                .multilineTextAlignment(.center)
//                                .padding(.horizontal)
//                                .fontWeight(.bold)
//                                .foregroundColor(.gray)
//
//                        }
//                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        HStack(alignment: .top, spacing: 120) {
                            VStack(spacing: 20) {
                                PropertyDetails(imageName: "calendar", text: "Wed, Aug 14")
                                PropertyDetails(imageName: "location", text: "Pub")
                            }
                            .fontWeight(.bold)

                            
                            VStack(spacing: 20) {
                                PropertyDetails(imageName: "clock", text: "10:00")
                                PropertyDetails(imageName: "textformat", text: "Meeting")
                            }
                            .fontWeight(.bold)

                        }
                        .padding(.top, 60)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)

                        
                        // Attendees Section
                        VStack(alignment: .leading) {
                            Text("Attendees")
                                .font(.headline)
                                .padding(.bottom, 10)
                                .fontWeight(.bold)

                            
                            HStack(spacing: 10) {
                                ForEach(0..<5) { index in
                                    Image("joe")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .cornerRadius(100) // Apply corner radius to the ZStack
                                        .frame(width: 35, height: 35)
                                        .clipShape(Circle())
                                        .padding(.trailing, -20) // Added padding to the right
                                    
                                }
                                ZStack {
                                    Circle()
                                        .foregroundColor(Color.gray.opacity(0.7)) // Apply opacity to gray color
                                        .frame(width: 40, height: 40)
                                    
                                    Text("+5")
                                        .foregroundColor(.white)
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                }
                                .aspectRatio(contentMode: .fit)
                                .padding(.trailing, -20)
                                
                            }
                            .padding(.bottom, 20)


                        }
                        .padding(.horizontal)
                        .padding(.top, 20)
                        
                        // Description Section
                        VStack(alignment: .leading) {
                            Text("Description")
                                .font(.headline)
                                .padding(.bottom, 5)
                                .fontWeight(.bold)

                            
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sit amet dapibus velit, in malesuada velit.")
                                .padding(.bottom, 10)

                        }
                        
                        .padding(.horizontal)
                        
                        // Image Section
                        Image("meeting")
                            .resizable()
                            .frame(maxWidth: .infinity, maxHeight: 170)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .padding()
                        
                        
                        
                        
                        VStack(alignment: .leading) {
                            Text("Address")
                                .font(.headline)
                                .padding(.bottom, 5)
                                .fontWeight(.bold)

                            
                            Text("Robinscrot Mews SE10 8DN")
                        }
                        
                        .padding(.horizontal)
                    }
                }
            }
//            .navigationBarTitle("Dummy View") // Example navigation bar title
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black) // Customize the color if needed
                                .fontWeight(.bold)
                        }
                    }
                }
                
                
                
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    VStack {
                        Text("Robinscroft Mews")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .fontWeight(.bold)

                        
                        Text("Annual General Meeting")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)

                    }
                    .padding(.leading, 45)
                    .frame(maxWidth: .infinity, alignment: .center)

                    
                }
                
            }
        }
    }
}



struct Dummy_Previews: PreviewProvider {
    static var previews: some View {
        DummyView()
    }
}
