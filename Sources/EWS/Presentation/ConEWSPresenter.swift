//
//  File.swift
//  
//
//  Created by Iqbal Nur Haq on 09/10/23.
//

import Foundation
import Combine
import Core


public class ConEWSPresenter<CurrentEWSUseCase: UseCase>: ObservableObject
where
CurrentEWSUseCase.Request == Any, CurrentEWSUseCase.Response == CurrentEWSModel
{
    
    private var cancellables: Set<AnyCancellable> = []
    
    private let _currentEWSUseCase: CurrentEWSUseCase
    
    @Published public var currentEWS: CurrentEWSModel?
    @Published public var currentErrorMessage: String = ""
    @Published public var currentIsLoading: Bool = false
    @Published public var currentIsError: Bool = false

    
    public init(currentEWSUseCase: CurrentEWSUseCase) {
        _currentEWSUseCase = currentEWSUseCase
    }
    
    public func getCurrentEWS(request: CurrentEWSUseCase.Request?) {
        currentIsLoading = true
        _currentEWSUseCase.execute(request: request)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.currentErrorMessage = error.localizedDescription
                    self.currentIsError = true
                    self.currentIsLoading = false
                case .finished:
                    self.currentIsLoading = false
                }
            }, receiveValue: { item in
                self.currentEWS = item
            })
            .store(in: &cancellables)
    }
}
