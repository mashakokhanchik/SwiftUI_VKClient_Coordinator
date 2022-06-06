//
//  FeedsView.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 24.05.2022.
//

import SwiftUI

struct NewsView: View {
    
    // MARK: - Body vew
    
    var body: some View {
        NavigationView {
            VStack {
                Image("DFL")
                TextBuilder {
                    Text("Dr. Drake Remore, a character played by Joe Tribiani in Days of Our Lives, returns to life according to the script. The revival will take place in an unusual way, the doctor will become a man with a female brain in his head. The brain of another heroine who has just passed away will be transplanted into the doctor's head.")
                    }
                Spacer()
            }
            .navigationTitle("News")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

}

// MARK: - Screen content view

struct FeedsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
