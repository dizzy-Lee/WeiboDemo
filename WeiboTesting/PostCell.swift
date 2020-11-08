//
//  PostCell.swift
//  WeiboDemo
//
//  Created by 李祎帆 on 2020/11/2.
//

import SwiftUI

struct PostCell: View {
    
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack{
                post.avatarImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(
                        PostVIPBadge(vip: post.vip)
                            .offset(x: 16, y: 16)
                    )
                VStack(alignment:.leading, spacing: 5){
                    Text(post.name)
                        .font(Font.system(size: 16))
                        .foregroundColor(Color.orange)
                        .lineLimit(1)
                    Text(post.date)
                        .font(Font.system(size: 11))
                        .foregroundColor(Color.gray)
                        .lineLimit(1)
                }
                if !post.isFollowed {
                    Spacer()
                    Button(action: {
                        print("Click follow button")
                    }){
                        Text("关注")
                            .font(Font.system(size: 14))
                            .foregroundColor(Color.orange)
                            .frame(width: 50, height: 26)
                            .overlay(
                                RoundedRectangle(cornerRadius: 13)
                                    .stroke(Color.orange, lineWidth: 1)
                            )
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
            }
            Text(post.text)
                .font(Font.system(size:17))
            if !post.images.isEmpty {
                PostImageCell(images: post.images, width: UIScreen.main.bounds.width - 30)
            }
            Divider()
            HStack(spacing: 0) {
                Spacer()
                PostCellToolbarButton(image: "message",
                                      text: post.commentCountText,
                                      color: .black) {
                    print("Click comment button")
                }
                Spacer()
                PostCellToolbarButton(image: "heart",
                                      text: post.likeCountText,
                                      color: .black) {
                    print("Click like button")
                }
                Spacer()
            }
            Rectangle()
                .padding(.horizontal, -15)
                .frame(height: 10)
                .foregroundColor(Color(red: 238 / 255, green: 238 / 255, blue: 238 / 255))
        }
        .padding(.horizontal, 15)
        .padding(.top, 15)
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: postList.list[5])
    }
}
