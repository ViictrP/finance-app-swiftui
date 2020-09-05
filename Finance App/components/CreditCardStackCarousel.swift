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
                            
                            Color("main")
                                .frame(width: width, height: getHeight(index: item.id))
                                .cornerRadius(25)
                                // Little Shadow...
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5)
                            
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
            StackItem(id: 0, creditCard: CreditCard(id: 1, name: "Nubank", closeDay: 10, number: "5966", limit: 4250, availableLimit: 4250), offset: 0),
            StackItem(id: 1, creditCard: CreditCard(id: 1, name: "Nubank", closeDay: 10, number: "5966", limit: 4250, availableLimit: 4250), offset: 0),
            StackItem(id: 2, creditCard: CreditCard(id: 1, name: "Nubank", closeDay: 10, number: "5966", limit: 4250, availableLimit: 4250), offset: 0),
            StackItem(id: 3, creditCard: CreditCard(id: 1, name: "Nubank", closeDay: 10, number: "5966", limit: 4250, availableLimit: 4250), offset: 0),
            StackItem(id: 4, creditCard: CreditCard(id: 1, name: "Nubank", closeDay: 10, number: "5966", limit: 4250, availableLimit: 4250), offset: 0)
        ])
    }
}

struct Content : View {
    
    var card : StackItem
    
    var body: some View{
        
        VStack{
            
            // You can display all details
            // I'm displaying only read button....
            Spacer(minLength: 0)
            
            HStack{
                
                Button(action: {}) {
                    
                    Text("Read Now")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical,5)
                        .padding(.horizontal,10)
                        .background(Color.gray)
                        .clipShape(Capsule())
                }
                
                Spacer(minLength: 0)
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
