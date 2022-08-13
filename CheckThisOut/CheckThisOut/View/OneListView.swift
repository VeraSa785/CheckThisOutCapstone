//
//  OneListView.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 8/10/22.
//

import SwiftUI

struct OneListView: View {
    
//    let tasks = testDataTasks
    var task: Tasks
//    @ObservedObject var viewModel = TasksViewModel()
    
    var body: some View {
        ZStack {
//            BackgroundView()
            
            VStack {
                
                HStack {
                    
                    Button {
//                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.backward")
                            .font(.system(size: 18.0, weight: .bold))
                            .foregroundColor(Color(.black))
                            .padding(.leading, 20)
                    }
                        
                    
                    Spacer()
                    Text("Task List")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .padding(.leading, -41)
                    Spacer()
                } // end of Hstack
                .overlay {
                    HStack {
                        
                        Spacer()
                        Button {
//                            AuthViewModel.shared.signout()
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                                .font(.system(size: 18.0, weight: .bold))
                                .foregroundColor(Color(.black))
                        }
                        .padding(.trailing, 20)
                    }
                } // end of HStack overlay
                .padding(.top)
                
                ScrollView{
                    VStack(alignment: .leading)  {

                        TaskView(task: Tasks(ownerUiD: task.ownerUiD, taskTitle: task.taskTitle, completed: task.completed))
                            .padding(.bottom, 5)
                        
                        TaskView(task: Tasks(ownerUiD: task.ownerUiD, taskTitle: task.taskTitle, completed: task.completed))
                            .padding(.bottom, 5)
                        
                        TaskView(task: Tasks(ownerUiD: task.ownerUiD, taskTitle: task.taskTitle, completed: task.completed))
                            .padding(.bottom, 5)
 
                    }
                        
                        
                        
                    

                }// end of ScrollView
//                    .padding(.trailing, 8)
                
                Button {
    //                viewModel.showCreateListView = true
                } label: {
                        Text("Add New Task")
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                        .frame(width: 140, height: 20)
                        .padding()
                        .border(Color.black, width: 3)

                }
                .background(Color("Purple"))
                .padding(20)
                
            }
        }
    }
     
}

struct OneListView_Previews: PreviewProvider {
    static var previews: some View {
        OneListView(task: task02)
    }
}


//    
//    let user: AppUser
//    
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    
////    @ObservedObject var viewModel = ListViewModel()
//    
////    @Environment(\.presentationMode) var mode
//    
//    var body: some View {
//        
//        ZStack {
//            
//            BackgroundView()
//            
//            VStack {
//                HStack {
//                    
//                    Spacer()
//                    Button {
//                        presentationMode.wrappedValue.dismiss()
//                    } label: {
//                        Text("Back")
//                            .foregroundColor(Color(.systemGray))
//                        Spacer()
//                    }
//                    .padding()
//                } // End of HStack
//                
//                
//                    
//                .overlay {
//                    HStack {
//                        Spacer()
//                        Text("Name of the List")
//                            .font(.system(size: 24))
//                            .fontWeight(.bold)
//                        Spacer()
//                        } //End of HStack
//                    
//                }
//  
//
//                ScrollView {
//                    Text("I am a task!")
//                    
//                }
//                
//            } // End of VStack
//            
//            
//            
////            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
////            Button {
////                mode.wrappedValue.dismiss()
////            } label: {
////                HStack {
////                    Text("Already have an account?")
////                        .font(.system(size: 14))
////                    Text("Sign In")
////                        .font(.system(size: 14, weight: .semibold))
////                }
////                .foregroundColor(.black)
////            }
////            .padding(.bottom,16)
//            
//        }
//        
//        
//    }
//}
//
//struct OneListView_Previews: PreviewProvider {
//    static var previews: some View {
//        OneListView(user: appUser01)
//    }
//}

