import SwiftUI

// MARK: - Main View
struct ContentView: View {
    
    //Carousel Data: All destinations are verified as requested previously
    let destinations: [Destination] = [
        .init(city: "Dubai", imageName: "dubai", stats: "53K+ Visas on Atlys", isVerified: true),
        .init(city: "Malaysia", imageName: "malaysia", stats: "30K+ Visas processed", isVerified: true),
        .init(city: "Thailand", imageName: "thailand", stats: "22K+ Visas approved", isVerified: true)
    ]
    
    // State for Auto-Scrolling Carousel
    @State private var currentCardIndex = 0
    let timer = Timer.publish(every: 3.5, on: .main, in: .common).autoconnect()
    
    // Form States
    @State private var phoneNumber: String = ""
    @State private var selectedCountryCode: String = "+91"

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 30) {
                
                // MARK: Logo (FIXED: Centering, Spacing, Color, and Arrow placement)
                VStack(spacing: 5) { // Added back vertical gap (Point 2)
                    HStack(spacing: 0) {
                        Text("atlyś")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.black)
                        
                        // Arrow positioning fixed to match the screenshot (Point 4)
                        // Note: The custom asset "arrow" must be defined in your project assets.
                        Image("arrow")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.black)
                            .frame(width: 50, height: 16)
                            .offset(x: -35, y: -17) // Precise offset for the arrow
                    }
                    
                    // "visas on time" is now correctly centered (Point 1)
                    Text("visas on time")
                        .font(.system(size: 17, weight: .regular))
                        .foregroundColor(.blue) // Color changed to blue (Point 3)
                        .offset(x:-25,y: -5) // Minor vertical adjustment for aesthetic centering
                }
                
                // MARK: Carousel (Custom Scroll View)
                CarouselView(destinations: destinations, currentCardIndex: $currentCardIndex)
                    .frame(height: 380) // Fixed height for the carousel area
                
                // MARK: Heading
                Text("Get Visas\nOn Time")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10)
                
                // MARK: Phone Input
                phoneInputView
                    .padding(.horizontal)
                
                // MARK: Continue Button
                Button(action: {
                    // Action to continue
                    print("Continue tapped")
                }) {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(red: 0.5, green: 0.5, blue: 0.9)) // Soft Lavender/Purple
                        )
                }
                .padding(.horizontal)

                // MARK: Separator with Dividers
                HStack {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray.opacity(0.3))
                    
                    Text("or")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                        .padding(.horizontal, 10)
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray.opacity(0.3))
                }
                .padding(.horizontal)
                
                // MARK: Social/Auth Buttons
                SocialAuthButtonsView()
                
                // MARK: Footer Policy
                PolicyFooterView()
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 40)
            
        }
        // MARK: Auto-Scroll Logic: Managed by a separate component internally.
        .onReceive(timer) { _ in
            withAnimation(.easeInOut(duration: 0.5)) {
                // Advance the index, the CarouselView will handle the programmatic scroll
                currentCardIndex = (currentCardIndex + 1) % destinations.count
            }
        }
    }
    
    // MARK: - Sub-Views (Properties)
    
    var phoneInputView: some View {
        HStack {
            // Country Code Picker (Simulated)
            HStack {
                Text("🇮🇳") // Placeholder flag
                Text(selectedCountryCode)
                Image(systemName: "chevron.down")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.trailing, 8)
            .padding(.leading, 4)
            
            // Separator line (Simulated)
            Rectangle()
                .frame(width: 1, height: 20)
                .foregroundColor(Color.gray.opacity(0.4))
            
            // Phone Number Input
            TextField("Enter mobile number", text: $phoneNumber)
                .keyboardType(.numberPad)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 10)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

