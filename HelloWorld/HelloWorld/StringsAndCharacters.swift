//
//  StringsAndCharacters.swift
//  HelloWorld
//
//  Created by itang on 2019/8/3.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

// 字符串和字符
class StringsAndCharacters {
    
    // 字符串常量
    func learnStringIiterals () {
        var str1 = "hello"
        let str2 = "world"
        
        str1 = str1 + " " + str2
        print(str1)
        
        let quotation =
        """
        hello, everybody!

            I am very happy to see you.
            the old person said "one for all, all for one."

        Thanks!
        """
        print(quotation)
        print("--------------")
        let lineBreaks = """

        The string starts with a line breaks
        It alse end with a line breaks

        """
        print(lineBreaks)
        
        print("--------------")
        
        let linesWithIdentation = """
        The first base line.
            The second line with identation.
                The third line.
        The last line.
        """
        print(linesWithIdentation)
    }
    
    func learnSpecialIterals () {
        let wiseWords = "\"Imagination is more important tha knowledge\" - Einstein"
        let dollarSign = "\u{24}"
        let blackHeart = "\u{2665}"
        let sparkingHear = "\u{1F496}"
        print(wiseWords)
        print(dollarSign)
        print(blackHeart)
        print(sparkingHear)

        
        let breakLine = "helo!\nHi!"
        print(breakLine)
        let keepOrignal = #"helo!\nHi!"#
        print(keepOrignal)
        let breakLine2 = #"helo!\#nHi!"#
        print(breakLine2)

    }
    
    func learnEmptyString () {
        let emptyString1 = ""
        let emptyString2 = String()
        
        if emptyString1.isEmpty {
            print("emptyString1 is a empty string.")
        }
        
        if emptyString2.isEmpty {
            print("emptyString2 is a empty string, too.")
        }
    }
    
    func workWithCharaters () {
        for charater in "Dog!🐶" {
            print(charater)
        }
        
        let exclamationMask: Character = "!"
        let catCharacters: [Character] = ["c", "a", "t", exclamationMask, "🐱"]
        let catString = String(catCharacters)
        
        let a = "\u{03fe}"
        let b = "\u{03ff}"
        let c = "\u{0398}"
        let d = a + b
        
        print(d)
        print(c + "" + c)
        print("\u{03be}")

        print(catString)
        
        print("\u{1f4ff}" + "\u{1f436}")
        print("\u{1f441}" + "\u{1f441}")
        print("\u{1f40c}" + "\u{1f409}")
        print("\u{1f400}" + "\u{1f401}" + "\u{1f402}" + "\u{1f403}" + "\u{1f404}")
        print("\u{1f029}" + "\u{1f409}")
        print("\u{1f000}" + "\u{1f001}" + "\u{1f002}" + "\u{1f003}" + "\u{1f004}")
        print("\u{1f007}" + "\u{1f008}" + "\u{1f009}" + "\u{1f010}" + "\u{1f011}")
        print("\u{1104d}" + "\u{10816}")
        print("\u{10b3c}" + "\u{10086}" + "\u{10b3d}")
        print("\u{1085e}" + "\u{10826}")
        print("\u{1048e}" + "\u{1085e}")
        print("\u{1f43e}" + "\u{1f49e}" + "\u{1f4ab}" + "\u{1f498}" + "\u{1f493}" + "\u{1f4a2}")



    }
    
    func learnStringIndices () {
        
        let greating = "guten tag!"
        print("\(greating): has \(greating.count) charaters")
        
        let startIndex = greating.startIndex
        let endIndex = greating.endIndex
        print("first character = \(greating[startIndex]), last character = \(greating[greating.index(before: endIndex)])")
        
        let secondChar = greating[greating.index(after: startIndex)]
        let eighthChar = greating[greating.index(startIndex, offsetBy: 7)]
        print("sencod char: \(secondChar), eighth car: \(eighthChar)")
        
        for index in greating.indices {
            print("\(greating[index]) ", terminator: "")
        }
        print("")
        
    }
    
    func learnInsertAndRemove() -> Void {
        
        // 插入
        var welcome = "hello"
        welcome.insert("!", at: welcome.endIndex)
        print(welcome)
        welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
        print(welcome)
        
        // 删除
        welcome.remove(at: welcome.index(before: welcome.endIndex))
        print(welcome)
        
        let range = welcome.index(welcome.endIndex, offsetBy: -6) ..< welcome.endIndex
        welcome.removeSubrange(range)
        print(welcome)
    }
    
    func learnSubString () {
        let greeting = "hello, world"
        let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
        let begining = greeting[..<index]
        print(begining)
        
        let newString = String(begining)
        print(newString)
    }
    
    func learn () {
        //
        self.learnStringIiterals()
        
        self.learnSpecialIterals()
        
        self.learnEmptyString()
        
        self.workWithCharaters()
        
        self.learnStringIndices()
        
        self.learnInsertAndRemove()
        
        self.learnSubString()
    }
}
