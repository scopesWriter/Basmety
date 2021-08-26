//
//  MovieDetailsUseCase.swift
//  Cima+
//
//  Created by Kerolles Roshdi on 4/1/21.
//

import Foundation
import RxSwift
import Moya

class MovieDetailsUseCase {
    
    private let movieID: Int
    private let moviesRepository: MoviesRepository
    
    init(movieID: Int, moviesRepository: MoviesRepository) {
        self.movieID = movieID
        self.moviesRepository = moviesRepository
    }
    
    func getMovieDetails() -> Observable<MovieDetails> {
        moviesRepository.getMovieDetails(id: movieID)
    }
    
}



protocol MoviesRepository {
    func getMovieDetails(id: Int) -> Observable<MovieDetails>
}


class RepoImpl: MoviesRepository {
    
    let moviesProvider = MoyaProvider<MoviesService>()
    
    func getMovieDetails(id: Int) -> Observable<MovieDetails> {
        moviesProvider.rx
            .request(.movieDetails(id: id))
            .catchAppError()
            .map(MovieDetails.self)
            .asObservable()
    }
    
}
