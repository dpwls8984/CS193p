//
//  ContentView.swift
//  Memorize
//
//  Created by Yejin Kim on 4/17/24.
//

import SwiftUI

struct ContentView: View {
    //contentview: name of type
    //: View means "behaves like a..." -> this struct(ContentView) behaves like a View -> some thing you have to do(responsibility) / 어떻게 작동하는지 작성하라
    //var i: Int 에서 i는 struct이고 정수형, View is NOT a struct, view is a thing you can behave like, called a protocol
    
    
    // creating instances of structs / named parameters / parameter defaults
    // TupleView(bag of Lego)로 바꾸고 싶다면 @ViewBuilder 를 사용
    // View modifier scope
    
    var body: some View { //type--> the type of this variable has to be any struct in the world. which view? execute this code, see what it returns, use that.
        let emojis = ["👻", "😈", "☠️", "🎃", "🎃"]
        //Array<String> == [String]

        HStack{
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            } //for loop, indices 는 emojis.length() 와 같은 기능을 하는 듯 (배열의 길이만큼)
        }

        .foregroundStyle(.orange)
        .padding() //--> VStack 전체 요소에 영향을 미침


    } //--> Computed Property, is not stored somewhere. every time someone asks for the value of body, it runs this code.
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true //default is false
    
    //@State creating a pointer to isFaceUp there.
    //i cannot took this default value("= false"). if u have a var that has no value, any struct, that's not allowed.
    //"= false" 를 지웠을 땐 CardView에 argument가 없을 때 오류가 생기지만, 있으면 오류 X
    //"= true"라고 한다면 argument를 안넣어도 오류가 안남. 정의를 시켜주면 있든 없든 오류가 안나지만 정의를 안시켜두면 꼭 정의를 해야해서 argument가 없는 코드는 오류가 난다?
    
    //then can i change var isFaceUp to let isFaceUp? -> NOPE
    //default 값을 정의 안한다면 let을 써도 되지만, 값을 전달할 때는 문제가 생기므로 var. false or true라고 말하려면 var여야 함.
    //you can actually change somthing in a View. it starts out with its default value but then it can be changed when it's created.
    
    var body: some View {
        ZStack { //이 안에 있는 건 function, this func returns view
            //trailing closure syntax
            let base = RoundedRectangle(cornerRadius: 12) //type inference
            //let is a constant, it will never change bc Views are read-only BUT var means variable
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2) //this needed arguments
                Text(content).font(.largeTitle)
            } else {
                base //.fill 을 안해도 기본값으로 채워짐. 안에 색 혹은 스타일을 커스텀하고싶다면 따로 .fill로 만들면 됨.
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
        // Views are immutable. vars in Views themselves are immutable
        // @State means temporary states
        
    }
}


#Preview {
    ContentView()
}
