//
//  Movie.swift
//  Tio
//
//  Created by Pedro Mancheno on 08/02/16.
//  Copyright © 2016 Tio. All rights reserved.
//

import Foundation

class Movie : Medium {
    
    let adult: Bool
    let backdropPath: String
    let belongsToCollection: Array<Collection>?
    let budget: Double
    let genres: Array<Genres>
    let homepage: String
    let id: UInt
    let imdbId: UInt
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let productionCompanies: Array<ProductionCompany>
    let productionCountries: Array<Country>
    let releaseDateTimestamp: String
    let revenue: UInt
    let runtime: UInt
    let spokenLanguages: Array<Language>
    let status: String
    let tagLine: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: UInt
    
    
    init(adult: Bool,
        backdropPath: String,
        belongsToCollection: Array<Collection>?,
        budget: Double,
        genres: Array<Genres>,
        homepage: String,
        id: UInt,
        imdbId: UInt,
        originalLanguage: String,
        originalTitle: String,
        overview: String,
        popularity: Double,
        posterPath: String,
        productionCompanies: Array<ProductionCompany>,
        productionCountries: Array<Country>,
        releaseDateTimestamp: String,
        revenue: UInt,
        runtime: UInt,
        spokenLanguages: Array<Language>,
        status: String,
        tagLine: String,
        title: String,
        video: Bool,
        voteAverage: Double,
        voteCount: UInt) {
            self.adult = adult
            self.backdropPath = backdropPath
            self.belongsToCollection = belongsToCollection
            self.budget = budget
            self.genres = genres
            self.homepage = homepage
            self.id = id
            self.imdbId = imdbId
            self.originalLanguage = originalLanguage
            self.originalTitle = originalLanguage
            self.overview = overview
            self.popularity = popularity
            self.posterPath = posterPath
            self.productionCompanies = productionCompanies
            self.productionCountries = productionCountries
            self.releaseDateTimestamp = releaseDateTimestamp
            self.revenue = revenue
            self.runtime = runtime
            self.spokenLanguages = spokenLanguages
            self.status = status
            self.tagLine = tagLine
            self.title = title
            self.video = video
            self.voteAverage = voteAverage
            self.voteCount = voteCount
            
            super.init(localId: 1)
    }
}

struct Genres {
    
    let id: UInt
    let name: String
}

struct ProductionCompany {
    
    let name: String
    let id: UInt
}

struct Country {
    
    let name: String
    let iso31661: String
}

struct Language {
    
    let name: String
    let iso6391: String
}

struct Collection {
    
    let movies: Array<Movie>
}