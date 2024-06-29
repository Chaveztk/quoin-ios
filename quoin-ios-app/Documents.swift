import SwiftUI

struct DocumentView: View {
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            ScrollView {
//                Background()
                VStack {
                    HStack {
//                        Button(action: {
//                            // Add action for the back button
//                        }) {
//                            Image(systemName: "chevron.left")
//                                .font(.title)
//                                .foregroundColor(.black)
//                        }
//                        .padding(.leading, 20)
//                        Spacer() // Spacer before the text
                        
                        VStack {
                            Text("1 Canary Wharf")
                                .font(.headline)
                                .multilineTextAlignment(.center) // Align text in center
                                .padding(.horizontal) // Add padding for centering

                            Text("E14 5DR")
                                .font(.subheadline)
                                .multilineTextAlignment(.center) // Align text in center
                                .padding(.horizontal) // Add padding for centering
                        }
                        .frame(maxWidth: .infinity) // Ensure VStack takes full width

                        Spacer() // Spacer after the text
//                        Button(action: {
//                            // Add action for the plus button
//                        }) {
//                            Image(systemName: "plus")
//                                .font(.title)
//                                .foregroundColor(.black)
//                        }
//                        .padding(.trailing, 20)
                    }
                    .padding(.top, 20)
                    .padding(.horizontal)

                    Image(systemName: "doc.text")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .foregroundColor(.black)
                        .padding()

                    // Properties section
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Documents")
                            .font(.headline)
                            .padding(.leading, 20)

                        // Search bar
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            TextField("Search Documents", text: $searchText)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        .padding(.horizontal, 20)

                        // Property cards
                        VStack {
                            ForEach(0..<5) { index in
                                DocumentCardView(propertyName: "Rental Agreement \(index + 1)",
                                                 propertyAddress: "209 Upper tulse hill",
                                                 rent: "£1000.00",
                                                 term: "Expires: 1 Jan 24")
                                    .padding(.horizontal, 15)
                                    .padding(.top, 10)
                            }
                        }
                    }
                    .padding(.top, 20)
                }
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
            }
        }
    }
}

struct DocumentCardView: View {
    var propertyName: String
    var propertyAddress: String
    var rent: String
    var term: String

    var body: some View {
        HStack {
            Image(systemName: "doc.text")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.blue) // Example color, adjust as needed
                .frame(width: 30, height: 30)
//                .clipShape(Circle())
                .padding(.trailing, 10)
                .foregroundColor(.blue) // Example color, adjust as needed

            
            VStack(alignment: .leading) {
                Text(propertyName)
                    .font(.headline)
                    .truncationMode(.tail)
                    .lineLimit(1)
                Text(propertyAddress)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .truncationMode(.tail)
                    .lineLimit(1)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(rent)
                    .font(.subheadline)
                Text(term)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct DocumentView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentView()
    }
}
