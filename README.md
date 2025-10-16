Visa Onboarding & Carousel Screen (SwiftUI)

This SwiftUI implementation delivers a modern and engaging welcome/onboarding screen featuring a custom, auto-scrolling 3D-effect carousel for showcasing featured travel destinations, seamlessly integrated with a mobile number login flow.

Mark:- Key Features

Custom 3D Carousel (CarouselView): Implements a horizontal, scrollable list of destinations with a dynamic scaling and depth effect. Cards that are further from the center are scaled down, creating an immersive 3D-like perspective.

Auto-Scrolling: The carousel automatically cycles through destination cards every 3.5 seconds, managed by a built-in SwiftUI Timer.

Mobile-First Authentication: Includes a clean, bordered input field for country code and mobile number, along with standard social login options (Google, Apple, Email).

Modular Architecture: The UI is broken down into highly reusable components (VisaCardView, CarouselView, AuthButton, PolicyFooterView).

Mark:- Component Breakdown

The application is structured into several distinct components for maintainability and clarity:

Component

Description

Destination

Data model for each carousel card, including city name, image asset reference, visa statistics, and a verification flag.

ContentView

The main container view, responsible for the overall layout (Logo, Carousel, Login Form) and managing application state, including the carousel's auto-scroll index and phone input.

CarouselView

Implements the custom horizontal ScrollView and uses GeometryReader to calculate the dynamic scale and position of each VisaCardView to achieve the 3D depth effect.

VisaCardView

The visual card element, featuring a background image, a dark overlay gradient, destination text, statistics badge, and a top-right verification checkmark.

SocialAuthButtonsView

A horizontal stack of social and email login buttons.

AuthButton

A reusable helper component for rendering a standardized, bordered social login button using either system SFSymbols or custom assets.

Mark:- Design & Implementation Details

Carousel Logic

The core of the carousel effect is within CarouselView:

It uses an inner ScrollViewReader to programmatically scroll to the currentCardIndex.

The getScale helper function calculates the distance of each card's center (proxy.frame(in: .global).midX) from the screen's center, applying a smaller scale factor (minScale: 0.85) to cards that are further away.

The use of a negative cardSpacing (-40) creates a visual overlap, further enhancing the continuous carousel look.

Assets Dependency

The application relies on the following image assets, which must be present in the project's Asset Catalog:

dubai

malaysia

thailand

arrow (Used in the atlyś logo)

google

apple

If these assets are missing, the application will compile but fail to display the relevant images/icons, resulting in a runtime warning or empty view placeholders.
