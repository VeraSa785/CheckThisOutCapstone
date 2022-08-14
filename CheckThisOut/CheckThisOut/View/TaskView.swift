//
//  TaskView.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 8/10/22.
//

import SwiftUI

struct TaskView: View {
    
    @State var task: Tasks
    @ObservedObject var viewModel: TasksViewModel
    
//    @State var taskTitle: String
    @State var documentID: String? = ""
    //    @Binding var taskTitle: String
    
    let user: AppUser
    var onCommit:(Tasks) -> (Void) = { _ in } //tutorial
    var body: some View {
        
        HStack {
            Button {
                if task.completed {
                    viewModel.uncompleteTask(taskId: task.documentID ?? "")
//                    task.completed = false toggle to db
                } else {
                    viewModel.completeTask(taskId: task.documentID ?? "")
//                    task.completed = true toggle to db
                }
            } label: {
                Image(systemName: task.completed ? "squareshape.fill" : "squareshape")
                //                        .resizable()
                //                        .frame(width: 25, height: 25)
                    .foregroundColor(Color(.black))
                    .font(.system(size: 18.0, weight: .bold))
                    .onTapGesture {
                        self.task.completed.toggle()
                    }
            }
            
            
            //            Image(systemName: "squareshape")
            //                .font(.system(size: 18.0, weight: .bold))
            //            Text(task.taskTitle)
            //            TextField("Enter the task title", text: $task.taskTitle, onCommit: {self.onCommit(self.task)})
            
            
//      new      TextField("Enter the task title", text: $task.taskTitle)
            
//                TextField("Enter the task title", text: $task.taskTitle)
            
            TextField("Enter the task title", text: $task.taskTitle, onCommit: {self.onCommit(self.task)})
//            TextField("Enter the task title", text: $task.taskTitle, onCommit: {
//                viewModel.uploadTask(task: Tasks(taskTitle: task.taskTitle, completed: false))
//            })
            
//                .onSubmit {
//                    print("Submiting")
//                    viewModel.uploadTask(task: Tasks(taskTitle: task.taskTitle, completed: false))
////
////
////
////                    //                    task.taskTitle = $task.taskTitle
//////                    viewModel.updateTask(taskId: task.documentID ?? "", task: Tasks(taskTitle: task.taskTitle, completed: false))
////
//                }
//                .foregroundColor(.black)
//                .font(.system(size: 20))
            //                .fontWeight(.light)
            
        } // end of Hstack
        .frame(maxWidth: .infinity, alignment: .leading)
        //                .padding(.leading)
        .padding(.bottom, 5)
        .padding(.leading, 38)
        
    }
    
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        //        TaskView(task: task01, viewModel: viewModel)
        TaskView(task: task01, viewModel: TasksViewModel(list: list01), user: appUser01)
    }
}
