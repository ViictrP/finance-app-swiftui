import SwiftUI

struct CreditCardStackCarousel: View {
    var width = UIScreen.main.bounds.width - (40 + 60)
    var height = UIScreen.main.bounds.height / 2
    @State var swiped = 0
    @State var items: [StackItem]
    
    var body: some View {
        
        VStack{
            
            ZStack{
                // since its zstack it overlay one on another so reversed....
                
                ForEach(items.reversed()) { item in
                    
                    HStack{
                        
                        ZStack{
                            
                            Rectangle()
                                .strokeBorder(Color.white.opacity(0.1),lineWidth: 1)
                                .background(Rectangle().foregroundColor(Color("main")))
                                .frame(width: width, height: getHeight(index: item.id))
                                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                // Little Shadow...
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 1)
                            
                            Image("creditcard-pattern1")
                                .frame(width: width, height: getHeight(index: item.id))
                                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                .opacity(0.045)
                            
                            // Read More Button...

                            Content(card: item)
                                .frame(width: width, height: getHeight(index: item.id))
                        }
                        .offset(x: item.id - swiped < 3 ? CGFloat(item.id - swiped) * 30 : 60)
                        
                        Spacer(minLength: 0)
                    }
                    // Content Shape For Drag Gesture...
                    .contentShape(Rectangle())
                    .padding(.horizontal,20)
                    // gesture...
                    .offset(x: item.offset)
                    .gesture(DragGesture().onChanged({ (value) in
                        withAnimation{onScroll(value: value.translation.width, index: item.id)}
                    }).onEnded({ (value) in
                        withAnimation{onEnd(value: value.translation.width, index: item.id)}
                    }))
                }
            }
            // max height...
            .frame(height: height)
        }
    }
    
    func getHeight(index : Int)->CGFloat{
        
        // two card = 80
        // all other are 80 at background....
        
        // automatic height and offset adjusting...
        
        return height - (index - swiped < 3 ? CGFloat(index - swiped) * 40 : 80)
    }
    
    func onScroll(value: CGFloat,index: Int){
        if value < 0{
            
            // Left Swipe...
            
            if index != items.last!.id{
                
                items[index].offset = value
            }
        }
        else{
            
            // Right Swipe....
            
            // Safe Check...
            if index > 0{
                
                if items[index - 1].offset <= 20{
                    
                    items[index - 1].offset = -(width + 40) + value
                }
            }
        }
    }
    
    func onEnd(value: CGFloat,index: Int){
        let impactMed = UIImpactFeedbackGenerator(style: .medium)
        if value < 0{
            
            if -value > width / 2 && index != items.last!.id{
                
                items[index].offset = -(width + 100)
                swiped += 1
                impactMed.impactOccurred()
            }
            else{
                
                items[index].offset = 0
                
            }
        }else{
            
            if index > 0{
                
                if value > width / 2{
                    
                    items[index - 1].offset = 0
                    swiped -= 1
                    impactMed.impactOccurred()
                }
                else{
                    
                    items[index - 1].offset = -(width + 100)
                    
                }
            }
        }
        
        
    }
    
    static func toStackItems(creditCards: [CreditCard]) -> [StackItem] {
        var index = 0
        return creditCards.map { (creditCard) -> StackItem in
            let item = StackItem(id: index, creditCard: creditCard, offset: 0)
            index += 1
            return item
        }
    }
}

struct CreditCardStackCarousel_Previews: PreviewProvider {
    static var previews: some View {
        CreditCardStackCarousel(items: [
            StackItem(id: 0, creditCard: CreditCard(id: 1, name: "Nubank", closeDay: 10, number: "5966", limit: 4250, availableLimit: 4250.96), offset: 0),
            StackItem(id: 1, creditCard: CreditCard(id: 1, name: "Nubank", closeDay: 10, number: "5966", limit: 4250, availableLimit: 4250.96), offset: 0),
            StackItem(id: 2, creditCard: CreditCard(id: 1, name: "Nubank", closeDay: 10, number: "5966", limit: 4250, availableLimit: 4250.96), offset: 0),
            StackItem(id: 3, creditCard: CreditCard(id: 1, name: "Nubank", closeDay: 10, number: "5966", limit: 4250, availableLimit: 4250.96), offset: 0),
            StackItem(id: 4, creditCard: CreditCard(id: 1, name: "Nubank", closeDay: 10, number: "5966", limit: 4250, availableLimit: 4250.96), offset: 0)
        ])
    }
}

struct Content : View {
    
    var card : StackItem
    
    var body: some View{
        let creditCard = card.creditCard
        
        VStack{
            
            // You can display all details
            // I'm displaying only read button....
            Spacer(minLength: 0)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("valor disponível")
                        .font(.headline)
                        .foregroundColor(Color.white.opacity(0.5))
                    
                    Text("R$ \(creditCard.availableLimit)".replacingOccurrences(of: ",", with: "").replacingOccurrences(of: ".", with: ","))
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("\(creditCard.name)")
                            .font(.title)
                            .foregroundColor(.white)
                        
                        HStack(alignment: .bottom, spacing: 10) {
                            Text("\(creditCard.number)")
                                .font(.system(size: 22))
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                            
                            Spacer(minLength: 0)
                            
                            VStack {
                                Text("fechamento")
                                    .font(.headline)
                                    .foregroundColor(Color.white.opacity(0.5))
                                
                                Text("dia \(creditCard.closeDay)")
                                    .font(.headline)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                            }
                        }
                        
                    }
                    
                    Spacer()
                    
                    
                    
                }
            }
            .padding()
            .padding(.bottom,10)
        }
        
    }
}

// Carousel Model Book Data...

struct StackItem: Identifiable {
    var id: Int
    var creditCard: CreditCard
    var offset : CGFloat
}
