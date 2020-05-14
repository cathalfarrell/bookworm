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

    var starImage = Image(systemName: "star.fill")

    var offColor = Color.gray
    var onColor = Color.yellow

    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }

            ForEach(1..<maximumRating + 1) { number in
                self.starImage
                    .foregroundColor(number > self.rating ? self.offColor : self.onColor)
                    .onTapGesture {
                        print("Tap this.")
                        self.rating = number
                    }
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(3))
    }
}
