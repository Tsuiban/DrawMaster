//
// Created by tempuser on 4/27/2020.
//

import Foundation

protocol Node {
    var id: String? { get }
    var parent: Node? { get }
    var children: [Node] { get }

    subscript(_ index: Int) -> Node? { get }
    subscript(_ index: String) -> Node? { get }

    func find(_ id: String) -> Node?
}

struct Bonspiel {
    var id: String? = nil
    var draws: [Node] = []
    var rosters: [Node] = []
}

struct Roster {
    var id: String? = nil
    var bonspiel: Bonspiel? = nil
    var teams: [Team] = []
}

struct Team {
    var name: String? = nil
    var roster: Roster? = nil
    var members: [Member] = []
}

enum Position {
    case UndefinedPosition
    case AnyPosition
    case Skip
    case Vice
    case Second
    case Lead
    case Alternate
    case Coach
}

struct Member {
    var name: String? = nil
    var position = Position.UndefinedPosition
    var team: Team? = nil
}

struct Draw {
    var date: DateInterval? = nil
    var number: Int? = nil
    var bonspiel: Bonspiel? = nil
    var games: [Game] = []
}

struct Game {
    var sheet: String? = nil
    var draw: Draw? = nil
    var opponents: [Opponent] = []
}

struct Opponent {
    var team: Team
    var ends: Float = 0.0
    var score: Int = 0
    var abbreviatedEnds = 0.0
    var abbreviatedScore = 0
}
