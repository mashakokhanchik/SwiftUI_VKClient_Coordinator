//
//  GroupsViewModel.swift
//  SwiftUI_VKClient
//
//  Created by Мария Коханчик on 29.05.2022.
//

import Foundation
import CoreData

class GroupsViewModel: ObservableObject {
    
    // MARK: - Properties
    
    let service: GroupsService
    let coreDataService: CoreDataService
    @Published var groups: [UserModel] = []
    
    // MARK: - Inits
    
    init(service: GroupsService, coreDataService: CoreDataService) {
        self.service = service
        self.coreDataService = coreDataService
    }
    
    // MARK: - Methods
    
    public func chooseLoad() {
        let groupsCoreData = coreDataService.getAllGroups()
        if groupsCoreData.isEmpty {
            self.fetch()
        } else {
            self.loadFromCoreData()
        }
    }
    
    func fetch() {
        service.getGroups { [weak self] groups in
            guard let self = self else { return }
            self.groups = self.fillGroupsArray(groups!)
        }
    }
    
    func loadFromCoreData() {
        let groupsCoreData = coreDataService.getAllGroups()
        self.groups = groupsCoreData.map { $0.convertGroupsCoreData() }
    }
    
    private func fillGroupsArray(_ groupsResponce: GroupsResponse) -> [UserModel] {
        var groupsArray: [UserModel] = []
        let groupsCount = groupsResponce.response.items.count
        let groups = groupsResponce.response.items
        
        for i in 0...groupsCount - 1 {
            coreDataService.saveGroup(groupName: (groups[i].title),
                                      groupImageUrl: (groups[i].photo50!))
        }
        let groupsCoreData = coreDataService.getAllGroups()
        groupsArray = groupsCoreData.map {$0.convertGroupsCoreData() }
        return(groupsArray)
    }
}
