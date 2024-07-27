import SwiftUI

struct LoginScreen: View {

    @StateObject var viewModel = LoginScreenViewModel()
    
    @State var anamation:Bool = false

    
    var body: some View {

        NavigationView {
            VStack {
                //HeaderView
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, background: .pink)
                
                // login from
                
          
                Form{
              
                    if !viewModel.errorMessage.isEmpty {
                        Text (viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }else{
            
                        
                    }
                    
                    TextField("Email Address", text: $viewModel.email).textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization (.none)
                    

                    SecureField("Password", text: $viewModel.password).textFieldStyle(DefaultTextFieldStyle())
                    
                 
                   
                        
                    TLButton(title: "Login", background:anamation ? [.pink,.pink] : [.pink,.purple,.pink], action: {
                        //login
                  
                        viewModel.login()
                    }).frame(width:UIScreen.main.bounds.width * 0.8,height: anamation ? 40 : 50)
                    
                }.offset(y:-50).onAppear{
                    
                    withAnimation(.easeOut(duration: 0.7).repeatForever()) {
                        anamation.toggle()

                    }
                }
                
                VStack{

                    Text ("New around here?")
                    NavigationLink("Create An Account", destination: RegisterScreen())

                }.padding(.bottom,50)
                
                Spacer()
                
                
            }

        }

    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}



