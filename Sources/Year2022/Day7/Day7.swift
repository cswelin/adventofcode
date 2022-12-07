//
//  Day7.swift
//
//
//  Created by Colin Swelin on 2022-12-06.
//

import Foundation
import Algorithms
import AOCCore
import Collections

public struct Day7: Day {
    
    public func part1() async throws -> Int {
        let root = tree()
        let dirs = smallestNode(node: root, threshold: 100000)
        return dirs.map { $0.size }.reduce(0, +)
    }
    
    public func part2() async throws -> Int {
        let root = tree()
        return minToDelete(node: root, current: root, thresHold: root.size - 40000000).size
    }
}

extension Day7 {
    
    func tree() -> Node {
        let root = Node(name: "/")
        var current: Node = root
        
        let lines = input().raw.trimmingCharacters(in: .newlines).components(separatedBy: "\n$ ")
        for line in lines {
            let newLine = line.dropPrefix("$ ")
            var items = newLine.components(separatedBy: "\n")
            
            if line.hasPrefix("cd") {
                let info = line.components(separatedBy: " ")
                switch info[1] {
                case "/":
                    current = root
                case "..":
                    current = current.parent!
                default:
                    current = current.children.first(where: { $0.name == info[1]})!
                }
            } else if line.hasPrefix("ls") {
                items = Array(items.dropFirst(1))
                for item in items {
                    let info = item.components(separatedBy: " ")
                    if info[0] == "dir" {
                        current.children.append(Node.init(name: info[1], parent: current))
                    } else {
                        current.files.append(File(name: info[1], size: Int(info[0])!))
                    }
                    
                }
            }
        }

        _ = setSizes(node: root)
        
        return root
    }
    
    func setSizes(node: Node) -> Int {
        var total = 0
        for child in node.children {
            total += setSizes(node: child)
        }
        
        for file in node.files {
            total += file.size
        }
        
        node.size = total
        return total
    }
    
    func smallestNode(node: Node, threshold: Int) -> [Node] {
        var smallest: [Node] = []
        
        for child in node.children {
            smallest.append(contentsOf: smallestNode(node: child, threshold: threshold))
        }
        
        if node.size < threshold {
            smallest.append(node)
        }
        
        return smallest
    }
    
    func minToDelete(node: Node, current: Node, thresHold: Int) -> Node {
        var current = current
        for child in node.children {
            let minNode = minToDelete(node: child, current: current, thresHold: thresHold)
            
            if minNode.size < current.size {
                current = minNode
            }
        }

        print(thresHold, node.size, current.size)
        if thresHold <= node.size, node.size < current.size {
            current = node
        }
        
        return current
    }
}

class File {
    var size: Int = 0
    var name: String
    
    init(name: String, size: Int = 0) {
        self.name = name
        self.size = size
    }
}

class Node {
    var name: String = ""
    var size: Int = 0
    var parent: Node? = nil
    var files: [File] = []
    var children: [Node] = []
    
    init(name: String, size: Int = 0, parent: Node? = nil, files: [File] = [], children: [Node] = []) {
        self.name = name
        self.size = size
        self.parent = parent
        self.files = files
        self.children = children
        
    }
}
