//
//  TaskView.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 8/10/22.
//

import SwiftUI

struct TaskView: View {
    
    var task: Tasks
    
//    @ObservedObject var viewModel: TasksViewModel

    var body: some View {

        HStack {
            Image(systemName: "squareshape")
                .font(.system(size: 18.0, weight: .bold))
            Text(task.taskTitle)
//            Text("Hello I am a Task!")
                .foregroundColor(.black)
                .font(.system(size: 20))
                .fontWeight(.light)

            } // end of Hstack
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)

}
        
    }

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(task: task01)
    }
}





//import SwiftUI
//
//struct TasksView: View {
//
//    var task: Tasks
//
//    @ObservedObject var viewModel: TasksViewModel
//
//    var body: some View {
//
//        Text("Hello I am a Task!")
//        HStack {
//
//            Button {
//                if task.completed {
//                    viewModel.uncompleteTask(taskId: task.documentID ?? "")
//                } else {
//                    viewModel.completeTask(taskId: task.documentID ?? "")
//                }
//            } label: {
//                Image(systemName: task.completed ? "checkmark.square.fill" : "square")
//                    .resizable()
//                    .frame(width: 25, height: 25)
//                    .foregroundColor(Color(.black))
//            }
//
//            VStack(alignment: .leading, spacing: 5) {
//                Text(task.taskTitle)
//                    .font(.system(size: 20))
//                    .fontWeight(.bold)
//
//                    } // end of Hstack
////
////                }
////            } // end of Vstack
////            .padding(.leading,10)
////
////            Spacer()
////
////            Button {
////                viewModel.deleteList(listId: list.documentID ?? "")
////            } label: {
////                Image(systemName: "x.circle")
////                    .foregroundColor(.purple)
//////                    .foregroundColor(Color(.black))
////                    .frame(width: 22, height: 22)
////
////            }
////
////        } // end of Hstack
////        .padding(15)
////        .frame(width: UIScreen.main.bounds.size.width - 25, height: 90)
////        .background(Color("Purple"))
//////        .border(.black, width: 4)
////
//    }
//}
//
//struct TasksView_Previews: PreviewProvider {
//    static var previews: some View {
//        TasksView(task: task01, viewModel: TasksViewModel())
//    }
//}
//}
