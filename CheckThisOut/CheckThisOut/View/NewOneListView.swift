//
//  NewOneListView.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 8/15/22.
//

import SwiftUI

struct NewOneListView: View {
    
    var list: CheckList
    @ObservedObject var viewModel: TasksViewModel
    @Environment(\.presentationMode) var mode

    @State var presentAddNewItem = false
    @State var documentID: String? = ""

    @State var taskTitle: String = ""

    @State var inputTask: String = ""

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
                        
                    
//                    Spacer()
                    
                    Text(list.title)
                        .font(.system(size: 24))
                        .fontWeight(.bold)
//                        .padding(.leading, -41)
                        .frame(width: 290, alignment: .center)
//                        .border(Color.black, width: 3)
                        .multilineTextAlignment(.center)
                        .lineLimit(20)
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
//                            TaskView(task: taskViewModel, viewModel: viewModel, user: appUser01)
                            NewTaskView(task: taskViewModel, viewModel: viewModel,user: appUser01, inputTask: .constant(""))
                        }
                        

//                            .padding(.bottom, 5)
//                            .padding(.leading, 10)
//
                    }
                    
                    if presentAddNewItem {
                        
                        NewTaskView(task: Tasks(taskTitle: taskTitle, completed: false), viewModel: viewModel, user: appUser01, inputTask: .constant(""), onCommitTask: { task in
                            self.presentAddNewItem = false
                        })
                        
                        
//                        { task in
//                            self.presentAddNewItem.toggle()
//                        }
//                        { task in
                            
//                            self.viewModel.uploadTask(task: Tasks(taskTitle: "task.taskTitle", completed: false))
//                            self.presentAddNewItem.toggle()
                            
//                        }
                        
                        
//                        TaskView(task: Tasks(taskTitle: "", completed: false), viewModel: viewModel) { task in self.viewModel.uploadTask(task: Tasks(taskTitle: taskTitle, completed: false))
//                        }

                    }
                }// end of ScrollView
//                    .padding(.trailing, 8)
                

                
                Button (action: {self.presentAddNewItem.toggle()
//                    viewModel.uploadTask(task: Tasks(taskTitle: taskTitle, completed: false))
//                    viewModel.showpresentAddNewItem = false
                }) {
                    
//                    Image(systemName: "plus.circle.fill")
//                    .resizable()
//                    .frame(width: 20, height: 20)
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
                
            }
        }
    }
     
}

struct NewOneListView_Previews: PreviewProvider {
    static var previews: some View {
        NewOneListView(list: list01)
    }
}
