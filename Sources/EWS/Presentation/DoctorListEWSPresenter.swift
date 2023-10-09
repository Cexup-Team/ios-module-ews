//
//  File.swift
//  
//
//  Created by Iqbal Nur Haq on 22/05/23.
//

import Foundation
import Combine
import Core


public class DoctorListEWSPresenter<ListEWSUseCase: UseCase, HistoryEWSUseCase: UseCase>: ObservableObject
where
ListEWSUseCase.Request == Any, ListEWSUseCase.Response == [DoctorListEWSModel],
HistoryEWSUseCase.Request == Any, HistoryEWSUseCase.Response == [DoctorHistoryEWSModel]
{
    
    private var cancellables: Set<AnyCancellable> = []
    
    private let _listEWSUseCase: ListEWSUseCase
    private let _historyEWSUseCase: HistoryEWSUseCase
    
    @Published public var list: [DoctorListEWSModel] = []
    @Published public var errorMessage: String = ""
    @Published public var isLoading: Bool = false
    @Published public var isError: Bool = false

    
    @Published public var historyList: [DoctorHistoryEWSModel] = []
    @Published public var historyErrorMessage: String = ""
    @Published public var historyIsLoading: Bool = false
    @Published public var historyIsError: Bool = false
    @Published public var historyIsEndRequest: Bool = false
    @Published public var historyPageListOrder: Int = 0

    
    public init(listEWSUseCase: ListEWSUseCase, historyEWSUseCase: HistoryEWSUseCase) {
        _listEWSUseCase = listEWSUseCase
        _historyEWSUseCase = historyEWSUseCase
    }
    
    public func getList(request: ListEWSUseCase.Request?) {
        isLoading = true
        _listEWSUseCase.execute(request: request)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.isError = true
                    self.isLoading = false
                case .finished:
                    self.isLoading = false
                }
            }, receiveValue: { list in
                self.list = list
                self.isLoading = false
            })
            .store(in: &cancellables)
    }
    
    public func getHistoryList(request: HistoryEWSUseCase.Request?) {
        guard var resultNew = request as? [String:Any] else { return }
        resultNew["page"] = historyPageListOrder
        isLoading = true
        _historyEWSUseCase.execute(request: resultNew)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.historyErrorMessage = error.localizedDescription
                    self.historyIsError = true
                    self.historyIsLoading = false
                case .finished:
                    self.historyIsLoading = false
                }
            }, receiveValue: { list in
                if list.count < 10 {
                    self.historyIsEndRequest = true
                }else{
                    self.historyPageListOrder += 1
                }
                self.historyList.append(contentsOf: list)
            })
            .store(in: &cancellables)
    }
}

