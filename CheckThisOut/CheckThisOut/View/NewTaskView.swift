//
//  NewTaskView.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 8/15/22.
//


import SwiftUI

struct NewTaskView: View {

    
    @State var task: Tasks
    @ObservedObject var viewModel: TasksViewModel

    let user: AppUser
    
    @Binding var inputTask: String
    @State var isTyping = false
    @State var taskTitle: String = ""

    var onCommitTask:(Tasks) -> (Void) = { _ in }
    var body: some View {

        HStack {
            TextField("Enter the task title", text: $task.taskTitle, onEditingChanged: { (changed)
                in
                if changed {
                    print("text edit has begun")
                } else {
                    print("committed the change")
                    if (task.documentID == nil || task.documentID!.isEmpty) {
                        if (task.taskTitle.isEmpty == false){
                        isTyping = false
                        viewModel.uploadTask(task: Tasks(taskTitle: task.taskTitle, completed: false))
                        }
                    } else {
                        isTyping = false
                        taskTitle = ""
                        viewModel.updateTask(taskId: task.documentID ?? "", task: Tasks(taskTitle: task.taskTitle, completed: false))
                    }
                    onCommitTask(task)
                }
//            onCommit: do {self.onCommitTask(self.task)}
             })
                .TaskTextFieldStyle()
                .onTapGesture (perform: {
                    isTyping = true
                })
                .limitInputLength(value: $task.taskTitle, length: 30)
            
                .overlay(
                    HStack {

                        Button {
                            if task.completed {
                                viewModel.uncompleteTask(taskId: task.documentID ?? "")
                                task.completed = false
                            } else {
                                viewModel.completeTask(taskId: task.documentID ?? "")
                                task.completed = true
                            }
                        } label: {
                            Image(systemName: task.completed ? "squareshape.fill" : "squareshape")
                            //                        .resizable()
                            //                        .frame(width: 25, height: 25)
                                .foregroundColor(Color(.black))
                                .font(.system(size: 18.0, weight: .bold))

                        }
                            .onTapGesture {
                                self.task.completed.toggle()
                            }

                        Spacer()

                    }
                        .padding(.horizontal, 30)
                        .foregroundColor(.black)

                )
//                .transition(.move(edge: .trailing))

            if isTyping {
                Button(action: {
                    viewModel.deleteTask(taskId: task.documentID ?? "")
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                })
                    .padding(.horizontal, 30)
                    .foregroundColor(.black)
            }

        }

    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            BackgroundView()
            NewTaskView(task: task01, viewModel: TasksViewModel(list: list01), user: appUser01, inputTask: .constant(""))
        }

    }
}


struct TaskTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20))
            .padding(.leading, 45)
            .padding(.horizontal)
            .frame(height: 25)
            .background(Color(.white))
//            .background(Color("Yellow"))
//            .cornerRadius(5)
//            .frame(width: 350)
//            .multilineTextAlignment(.leading)
//            .lineLimit(20)
    }
}

extension View {
    func TaskTextFieldStyle() -> some View {
        modifier(TaskTextFieldModifier())
    }
}
