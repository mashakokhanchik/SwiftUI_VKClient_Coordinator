//
//  PhotosWebView.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 29.05.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct PhotosWebView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: PhotosViewModel
    
    private let columns: [GridItem] = [
        GridItem.init(.flexible(minimum: 0, maximum: .infinity)),
        GridItem.init(.flexible(minimum: 0, maximum: .infinity)),
        GridItem.init(.flexible(minimum: 0, maximum: .infinity))
    ]
    
    // MARK: - Inits
    
    init(viewModel: PhotosViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Body view
    
    var body: some View {
        let photosArray = viewModel.photos//.chunked(into: 2)
        return VStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: columns, alignment: .center, spacing: 8) {
                    ForEach(photosArray.indices, id: \.self) { photo in
                        ZStack(alignment: .bottomTrailing) {
                            WebImage(url: URL(string: "\(photosArray)"))
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .center)
                        }
                    }
                }
            }
            .onAppear { viewModel.fetch() }
        }
//        return VStack {
//                        ScrollView {
//                            VStack(spacing: 20) {
//                                ForEach(photosArray.indices, id:\.self) { index in
//                                    HStack {
//                                        Spacer()
//                                        WebImage(url: URL(string: "\(photosArray[index])"))
//                                            .resizable()
//                                            .frame(width: 200, height: 200)
//                                            Spacer()
//                                    }
//                                }
//                            }
//                        }
//                    }
            //.onAppear { viewModel.fetch() }
            //.navigationTitle("Photos")
            //.navigationBarTitleDisplayMode(.inline)
//        return VStack {
//            ScrollView {
//                VStack(spacing: 16) {
//                    ForEach(photosArray.indices, id: \.self) { index in
//                        HStack {
//                            Spacer()
//                            WebImage(url: URL(string: (photosArray[index])))
//                                .resizable()
//                                .frame(width: 200, height: 200)
//                                .cornerRadius(10)
//                            Spacer()
//                        }
//                    }
//                }
//            }
//        return VStack {
//            ScrollView {
//                VStack(spacing: 16) {
//                    ForEach(photosArray.indices, id: \.self) { index1 in
//                        HStack {
//                            ForEach(photosArray[index1].indices, id: \.self) { index2 in
//                                HStack {
//                                    Spacer()
//                                        ZStack {
//                                            WebImage(url: URL(string: "\(photosArray[index1][index2])"))
//                                            .resizable()
//                                            .frame(maxWidth: 200, maxHeight: 200)
//                                            .cornerRadius(10)
//                                        LikeButton()
//                                            .position(x: 170, y: 170)
//                                        }
//                                    Spacer()
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//            .onAppear { viewModel.fetch() }
//            .navigationTitle("Photos")
//            .navigationBarTitleDisplayMode(.inline)
//        }
    }
    
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
