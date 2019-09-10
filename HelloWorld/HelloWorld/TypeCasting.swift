//
//  TypeCasting.swift
//  HelloWorld
//
//  Created by tang on 2019/9/10.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

class TypeCasting
{
    class MediaItem {
        var name: String
        init(name: String) {
            self.name = name
        }
        
        func description () -> String {
            return "[media item: \(name)]"
        }
        
        func fun1() {
            print("fun1")
        }
    }
    
    class Movie: MediaItem {
        var director: String
        init(name: String, director: String) {
            self.director = director
            super.init(name: name)
        }
        
        override func description() -> String {
            return "[media item: name - \(name), director - \(director)]"
        }
        
        func movieDescription() {
            print("a good movie")
        }
    }
    
    class Song: MediaItem {
        var artist: String
        init(name: String, artist: String) {
            self.artist = artist
            super.init(name: name)
        }
        
        override func description() -> String {
            return "[media item: name - \(name), artist - \(artist)]"
        }
        
        func songDescription() {
            print("a good song")
        }
    }
    
    func learn () {
        
        let library = [
            Movie(name: "ying", director: "zhang yi mou"),
            Movie(name: "ne zha", director: "jiao zi"),
            Song(name: "chen zao", artist: "zhang hui mei"),
            Song(name: "that girl", artist: "forigner")]
        
        for item in library {
            if item is Movie {
                print("found a movie:", item.description()) // 虽然item会被认为是MediaItem类，但仍然后调用自己的类Movie的description方法
                // item.fun2() item 被认为是MediaItem类型，不能调用fun2
            } else if item is Song {
                print("found a song:", item.description())
            }
        }
        
        for item in library {
            if let movie = item as? Movie {
                movie.movieDescription()
            } else if let song = item as? Song {
                song.songDescription()
            }
        }
        
        // any / any object
        
        var things = [Any]()
        things.append(0)
        things.append(0.0)
        things.append(42)
        things.append(3.14)
        things.append(-0.5)

        things.append( (3, 5) )

        things.append("hello")
        things.append(Movie(name: "ying", director: "zhang yi mou"))
        
        for item in things {
            
            switch item {
            case 0 as Int:
                print("integer 0")
            case 0 as Double:
                print ("double 0")
            case let someInt as Int:
                print("integer", someInt)
            case let someDouble as Double where someDouble > 0:
                print("positive double", someDouble)
            case is Double:
                print("double", item)
            case is String:
                print("string", item)
            case let movie as Movie:
                print("movie", movie.description())
            case let (x, y) as (Int, Int):
                print("(\(x), \(y))")
            
            default:
                print("other")
            }
            
        }

    }
}
