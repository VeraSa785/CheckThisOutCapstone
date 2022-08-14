//
//  OneListView.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 8/10/22.
//

import SwiftUI

struct OneListView: View {
    
    var list: CheckList
    @ObservedObject var viewModel: TasksViewModel
    @Environment(\.presentationMode) var mode
    
    @State var presentAddNewItem = false
    
    init(list: CheckList) {
        self.list = list
        self.viewModel = TasksViewModel(list: list)
    }
    
    var body: some View {
        ZStack {
//            BackgroundView()
            
            VStack {
                
                HStack {
                    
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.backward")
                            .font(.system(size: 18.0, weight: .bold))
                            .foregroundColor(Color(.black))
                            .padding(.leading, 20)
                    }
                        
                    
                    Spacer()
                    Text(list.title)
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
                        ForEach(viewModel.tasks) { taskViewModel in
                            TaskView(task: taskViewModel)
                        }

//                            .padding(.bottom, 5)
//                            .padding(.leading, 10)
//
//                        TaskView(task: Tasks(ownerUiD: task.ownerUiD, taskTitle: task.taskTitle, completed: task.completed))
////                            .padding(.bottom, 5)
//
//                        TaskView(task: Tasks(ownerUiD: task.ownerUiD, taskTitle: task.taskTitle, completed: task.completed))
////                            .padding(.bottom, 5)
 
                    }
                    
                    
//                    if viewModel.presentAddNewItem {
//                        BlankView()
//                        CreateTaskView(user: user, viewModel: viewModel)
                    
//                    if presentAddNewItem {
//
//                        TaskView(task: Tasks(ownerUiD: task.ownerUiD, taskTitle: "", completed: false))
//
//                    }
                    

                }// end of ScrollView
//                    .padding(.trailing, 8)
                

                
                Button (action: {self.presentAddNewItem.toggle()}) {
                    
                 HStack {
                        Text("Add New Task")
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                        .frame(width: 140, height: 20)
                        .padding()
                        .border(Color.black, width: 3)

                }
                }
                .background(Color("Purple"))
                .padding(20)
                
//                Button (action: {self.presentAddNewItem.toggle()}) {
////                    viewModel.showpresentAddNewItem = true
////                        Image(systemName: "plus.circle.fill")
////                        .resizable()
////                        .frame(width: width: 20, height: 20)
//
//                } label: {
//                        Text("Add New Task")
//                        .foregroundColor(.black)
//                        .font(.system(size: 20))
//                        .frame(width: 140, height: 20)
//                        .padding()
//                        .border(Color.black, width: 3)
//
//                }
//                .background(Color("Purple"))
//                .padding(20)
                
            }
        }
    }
     
}

struct OneListView_Previews: PreviewProvider {
    static var previews: some View {
        OneListView(list: list01)
    }
}
