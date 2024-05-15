//
//  asyncImage.swift
//  TestingSwift
//
//  Created by ZinThant on 5/13/24.
//

import SwiftUI

let screenSize: CGRect = UIScreen.main.bounds
let botPadding: CGFloat = UIApplication.shared.windows.first!.safeAreaInsets.bottom
let topPadding: CGFloat = UIApplication.shared.windows.first!.safeAreaInsets.top

struct asyncImage: View {
    var body: some View {
        ZStack(content: {
            FootballbackgroundImage().opacity(0.6)
            VStack(content: {
                HStack(content: {
                    EachPlayer(url: "https://cdn.britannica.com/39/239139-050-49A950D1/French-soccer-player-Kylian-Mbappe-FIFA-World-Cup-December-10-2022.jpg", size: screenSize.width*0.2).offset(y:30)
                    Spacer()
                    EachPlayer(url: "https://football-tribe.com/asia/wp-content/uploads/sites/8/2018/01/kyaw-ko-ko.jpg", size: screenSize.width*0.2)
                    Spacer()
                    EachPlayer(url: "https://images.indianexpress.com/2023/12/Messi-World-Cup-.jpg", size: screenSize.width*0.2).offset(y:30)
                })
                Spacer()
                HStack(content: {
                    EachPlayer(url: "https://imageio.forbes.com/specials-images/imageserve/65d47bae988113674c790633/Real-Madrid-CF-v-Girona-FC---LaLiga-EA-Sports/960x0.jpg?format=jpg&width=960", size: screenSize.width*0.2)
                    Spacer()
                    EachPlayer(url: "https://images.ps-aws.com/c?url=https%3A%2F%2Fd2x51gyc4ptf2q.cloudfront.net%2Fcontent%2Fuploads%2F2023%2F06%2F28112930%2FPatrick-Vieira-Arsenal-2004.jpg", size: screenSize.width*0.2).offset(y:50)
                    Spacer()
                    EachPlayer(url: "https://static.onzemondial.com/8/2023/12/photo_article/866065/349739/1200-L-l-tonnante-premire-pour-messi-depuis-17-ans.jpg", size: screenSize.width*0.2)
                })
                Spacer()
                HStack(content: {
                    EachPlayer(url: "https://publish-p47754-e237306.adobeaemcloud.com/adobe/dynamicmedia/deliver/dm-aid--a868f75e-686f-4b46-ab6e-fdc2eba4f43d/_330190885296.app.png?preferwebp=true", size: screenSize.width*0.2).offset(y:-30)
                    Spacer()
                    EachPlayer(url: "https://e2.365dm.com/08/10/800x600/PaoloMaldini_1369005.jpg?20081023161130", size: screenSize.width*0.2)
                    Spacer()
                    EachPlayer(url: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2012/08/29/11/Carles-Puyol.jpg?width=1200", size: screenSize.width*0.2)
                    Spacer()
                    EachPlayer(url: "https://prod-media.beinsports.com/image/1680019556432_d25790e4-0acc-4b69-95cb-d27d1ce52560.jpg", size: screenSize.width*0.2).offset(y:-30)
                    
                })
                EachPlayer(url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYYpbaLprVQuN-IAZfu1RFMspW_YuNwO8Vl_4qpBi0PA&s", size: screenSize.width*0.2).padding(.top,50)
            }).padding(.bottom,botPadding).padding(.top,topPadding)
        })
    }
}

struct FootballbackgroundImage: View {
    var body: some View {
        Image("football_field")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
            .frame(width: screenSize.width, height: screenSize.height)
    }
}

struct EachPlayer:View {
    var url :String
    var size:CGFloat
    var body: some View {
        AsyncImage(url: URL(string: url), content: {returnedImage in returnedImage
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay( Circle().stroke(Color.red.opacity(0.9), lineWidth: 2))
            .frame(width: size, height: size)}, placeholder: {
                ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                .padding(40)
            })
    }
}

#Preview {
    asyncImage()
}
