//
//  Movie.swift
//  Tio
//
//  Created by Pedro Mancheno on 08/02/16.
//  Copyright © 2016 Tio. All rights reserved.
//

import Foundation

class Movie : Medium {
    
    let adult: Bool?
    let backdropPath: String
    let belongsToCollection: [Collection?]?
    let budget: Double?
    let genres: [Genre?]?
    let homepage: String?
    let id: UInt
    let imdbId: String?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String
    let productionCompanies: [ProductionCompany?]?
    let productionCountries: [Country?]?
    let releaseDateTimestamp: String
    let revenue: UInt?
    let runtime: UInt?
    let spokenLanguages: [Language?]?
    let status: String?
    let tagLine: String?
    let title: String
    let video: Bool?
    let voteAverage: Double?
    let voteCount: UInt?
    
    
    init(adult: Bool?,
        backdropPath: String,
        belongsToCollection: [Collection?]?,
        budget: Double?,
        genres: [Genre?]?,
        homepage: String?,
        id: UInt,
        imdbId: String?,
        originalLanguage: String?,
        originalTitle: String?,
        overview: String?,
        popularity: Double?,
        posterPath: String,
        productionCompanies: [ProductionCompany?]?,
        productionCountries: [Country?]?,
        releaseDateTimestamp: String,
        revenue: UInt?,
        runtime: UInt?,
        spokenLanguages: [Language?]?,
        status: String?,
        tagLine: String?,
        title: String,
        video: Bool?,
        voteAverage: Double?,
        voteCount: UInt?) {
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
    
    convenience init?(jsonData: Dictionary<String, AnyObject>) {
        guard let
            backdropPath = jsonData["backdrop_path"] as? String,
            id = jsonData["id"] as? UInt,
            posterPath = jsonData["poster_path"] as? String,
            releaseDateTimestamp = jsonData["release_date"] as? String,
            title = jsonData["title"] as? String else {
                return nil
        }
        
        let belongsToCollection = (jsonData["belongs_to_collection"] as? Array<Dictionary<String, AnyObject>>)?.map({Collection(jsonData: $0)}),
        adult = jsonData["adult"] as? Bool,
        budget = jsonData["budget"] as? Double,
        genres = (jsonData["genres"] as? Array<Dictionary<String, AnyObject>>)?.map({Genre(jsonData: $0)}),
        homepage = jsonData["homepage"] as? String,
        imdbId = jsonData["imdb_id"] as? String,
        originalLanguage = jsonData["original_language"] as? String,
        originalTitle = jsonData["original_title"] as? String,
        overview = jsonData["overview"] as? String,
        popularity = jsonData["popularity"] as? Double,
        productionCompanies = (jsonData["production_companies"] as? Array<Dictionary<String, AnyObject>>)?.map({ProductionCompany(jsonData: $0)}),
        productionCountries = (jsonData["production_countries"] as? Array<Dictionary<String, AnyObject>>)?.map({Country(jsonData: $0)}),
        revenue = jsonData["revenue"] as? UInt,
        runtime = jsonData["runtime"] as? UInt,
        spokenLanguages = (jsonData["spoken_languages"] as? Array<Dictionary<String, AnyObject>>)?.map({Language(jsonData: $0)}),
        status = jsonData["status"] as? String,
        tagLine = jsonData["tagline"] as? String,
        video = jsonData["video"] as? Bool,
        voteAverage = jsonData["vote_average"] as? Double,
        voteCount = jsonData["vote_count"] as? UInt
        
        self.init(adult: adult,
            backdropPath: backdropPath,
            belongsToCollection: belongsToCollection,
            budget: budget,
            genres: genres!,
            homepage: homepage,
            id: id,
            imdbId: imdbId,
            originalLanguage: originalLanguage,
            originalTitle: originalTitle,
            overview: overview,
            popularity: popularity,
            posterPath: posterPath,
            productionCompanies: productionCompanies,
            productionCountries: productionCountries,
            releaseDateTimestamp: releaseDateTimestamp,
            revenue: revenue,
            runtime: runtime,
            spokenLanguages: spokenLanguages,
            status: status,
            tagLine: tagLine,
            title: title,
            video: video,
            voteAverage: voteAverage,
            voteCount: voteCount)
    }
}

struct Genre {
    
    let id: UInt
    let name: String
    
    init(id: UInt, name: String) {
        self.name = name
        self.id = id
    }
    
    init?(jsonData: Dictionary<String, AnyObject>) {
        guard let name = jsonData["name"] as? String,
            id = jsonData["id"] as? UInt else {
                return nil
        }
        
        self.init(id: id, name: name)
    }
}

struct ProductionCompany {
    
    let name: String
    let id: UInt
    
    init(id: UInt, name: String) {
        self.name = name
        self.id = id
    }
    
    init?(jsonData: Dictionary<String, AnyObject>) {
        guard let name = jsonData["name"] as? String,
            id = jsonData["id"] as? UInt else {
                return nil
        }
        
        self.init(id: id, name: name)
    }
}

struct Country {
    
    let name: String
    let iso31661: String
    
    init(iso31661: String, name: String) {
        self.name = name
        self.iso31661 = iso31661
    }
    
    init?(jsonData: Dictionary<String, AnyObject>) {
        guard let name = jsonData["name"] as? String,
            iso31661 = jsonData["iso_3166_1"] as? String else {
                return nil
        }
        
        self.init(iso31661: iso31661, name: name)
    }
}

struct Language {
    
    let name: String
    let iso6391: String
    
    init(iso6391: String, name: String) {
        self.name = name
        self.iso6391 = iso6391
    }
    
    init?(jsonData: Dictionary<String, AnyObject>) {
        guard let name = jsonData["name"] as? String,
            iso6391 = jsonData["iso_639_1"] as? String else {
                return nil
        }
        
        self.init(iso6391: iso6391, name: name)
    }
}

struct Collection {
    
    let id: UInt
    let name: String
    let parts: Array<Movie>
    let posterPath: String
    
    init(id: UInt,
        name: String,
        parts: Array<Movie>,
        posterPath: String) {
        
            self.id = id
            self.name = name
            self.parts = parts
            self.posterPath = posterPath
    }
    
    init?(jsonData: Dictionary<String, AnyObject>) {
        guard let id = jsonData["id"] as? UInt,
            name = jsonData["name"] as? String,
            parts = (jsonData["parts"] as? Array<Dictionary<String, AnyObject>>)?.map({Movie(jsonData: $0)}) as? Array<Movie>,
            posterPath = jsonData["poster_path"] as? String else {
                return nil
        }
        
        self.init(id:id, name:name, parts:parts, posterPath:posterPath)
    }
}