//
//  RatingView.swift
//  Bookworm
//
//  Created by Cathal Farrell on 13/05/2020.
//  Copyright © 2020 Cathal Farrell. All rights reserved.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int

    var label = ""

    var maximumRating = 5

    var offImage: Image?
    var onImage = Image(systemName: "star.fill")

    var offColor = Color.gray
    var onColor = Color.yellow

    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            ForEach(1..<maximumRating + 1) { number in
                self.image(for: number)
                    .foregroundColor(number > self.rating ? self.offColor : self.onColor)
                    .onTapGesture {
                        print("Tap this.")
                        self.rating = number
                    }
                    // Accessibility
                    .accessibility(label: Text("\(number == 1 ? "1 star" : "\(number) stars")"))
                    .accessibility(removeTraits: .isImage) //no need to say its an image
                    /*
                     Tell the system that each star is actually a button, so users know it can be tapped.
                     While we’re here, we can make VoiceOver do an even better job by adding a second trait,
                     .isSelected, if the star is already highlighted.
                     */
                    .accessibility(addTraits: number > self.rating ? .isButton : [.isButton, .isSelected])

            }
        }
    }

    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(5))
    }
}
