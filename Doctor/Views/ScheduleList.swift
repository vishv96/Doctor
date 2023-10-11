//
//  ScheduleList.swift
//  Doctor
//
//  Created by vishnu vijayan on 2023-10-09.
//

import SwiftUI

struct ScheduleList: View {
    
    let schedules: [Schedule]
    
    var body: some View {
        VStack (alignment: .leading){
            
            // MARK: -  Title
            HStack {
                Text("Upcoming Schedules")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.leading)
            
            // MARK: - Card List
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack{
                    ForEach(schedules, id: \.id) { schedule in
                        HStack{
                            Spacer(minLength: 16)
                            ScheduleCellView(schedule: schedule){_ in }
                            Spacer(minLength: 16)
                        }
                    }
                }
            }
        }
        .frame(maxHeight: UIScreen.main.bounds.height * 0.2)
       
    }
    
    
}

#Preview {
    ScheduleList(schedules: AppDataStore().upcommingSchedules)
}

struct ScheduleList_preview: PreviewProvider {
    static var store = AppDataStore()

    static var previews: some View {
        
        
        ScheduleList(schedules: store.upcommingSchedules)
            .padding(.horizontal)
            .previewLayout(.sizeThatFits)
           
    }
}
