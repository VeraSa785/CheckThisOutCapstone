//
//  TaskView.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 8/10/22.
//

import SwiftUI

struct TaskView: View {
    
    @State var task: Tasks
    //    @ObservedObject var viewModel: TasksViewModel
    //    @State var taskTitle: String = ""
    //    @Binding var taskTitle: String
    
    var body: some View {
        
        //            Button {
        //                if list.completed {
        //                    viewModel.unCompleteList(listId: list.documentID ?? "")
        //                } else {
        //                    viewModel.completeList(listId: list.documentID ?? "")
        //                }
        //            } label: {
        //                Image(systemName: list.completed ? "checkmark.square.fill" : "square")
        //                    .resizable()
        //                    .frame(width: 25, height: 25)
        //                    .foregroundColor(Color(.black))
        //            }
        
        //        Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
        
        HStack {
            Button {
                //                if task.completed {
                //                    viewModel.uncompleteTask(taskId: task.documentID ?? "")
                //                } else {
                //                    viewModel.completeTask(taskId: task.documentID ?? "")
                //                }
            } label: {
                Image(systemName: task.completed ? "squareshape.fill" : "squareshape")
                //                        .resizable()
                //                        .frame(width: 25, height: 25)
                    .foregroundColor(Color(.black))
                    .font(.system(size: 18.0, weight: .bold))
            }
            //            Image(systemName: "squareshape")
            //                .font(.system(size: 18.0, weight: .bold))
            //            Text(task.taskTitle)
            TextField("Enter the task title", text: $task.taskTitle)
                .foregroundColor(.black)
                .font(.system(size: 20))
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
        TaskView(task: task01)
    }
}
