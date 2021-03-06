//
//  PostListView.swift
//  WeiboTesting
//
//  Created by 李祎帆 on 2020/11/4.
//

import SwiftUI

struct PostListView: View {
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        List {
            ForEach(postList.list) { post in
                ZStack {
                    PostCell(post: post)
                    NavigationLink(destination: PostDetailView(post: post)) {
                        EmptyView()
                    }
//                    .hidden()
                }
                .listRowInsets(EdgeInsets())
            }
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PostListView()
                .navigationBarTitle("推荐")
                .navigationBarHidden(false)
        }
    }
}
