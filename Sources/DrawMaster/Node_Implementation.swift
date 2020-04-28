//
// Created by tempuser on 4/27/2020.
//

import Foundation

extension Node {
    subscript(_ index: Int) -> Node? {
        get {
            if index >= 0 && index < children.count {
                return children[index]
            }
            return nil
        }
    }

    subscript(_ index: String) -> Node? {
        get {
            for child in children {
                if child.id == index {
                    return child
                }
            }
            return nil
        }
    }
}

extension Bonspiel: Node {
    func find(_ id: String) -> Node? {
        for roster in rosters {
            if let found = roster.find(id) {
                return found
            }
        }

        for draw in draws {
            if let found = draw.find(id) {
                return found
            }
        }

        return nil
    }

    var parent: Node? {
        get {
            return nil
        }
    }

    var children: [Node] {
        get {
            return draws
        }
    }
}

extension Roster: Node {
    var parent: Node? {
        get {
            return bonspiel
        }
    }
    var children: [Node] {
        get {
            return teams
        }
    }

    func find(_ id: String) -> Node? {
        for team in teams {
            if team.id == id {
                return team
            }
        }
        return nil
    }
}

extension Member: Node {
    var id: String? {
        get {
            return name
        }
    }

    var children: [Node] {
        get {
            return []
        }
    }

    var parent: Node? {
        get {
            return team
        }
    }

    func fine(_ id: String) -> Node? {
        return self.name == id
    }
}

extension Team: Node {
    var parent: Node? {
        get {
            return roster
        }
    }
    var children: [Node] {
        get {
            return members
        }
    }

    var id: String? {
        get {
            return name
        }
    }

    func find(_ in: String) -> Node? {
        for member in members {
            if member.id == id {
                return member
            }
        }
        return nil
    }
}

