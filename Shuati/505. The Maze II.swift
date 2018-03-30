//
//  505. The Maze II.swift
//  Shuati
//
//  Created by Yankun Jin on 2018/1/10.
//  Copyright © 2018年 Yankun Jin. All rights reserved.
//

import Foundation

class Maze2Solution : Testable {
    let dirs = [[-1, 0], [1, 0], [0, -1], [0, 1]]
    func shortestDistance(_ maze: [[Int]], _ start: [Int], _ destination: [Int]) -> Int {
        var distance = Array(repeating:Array(repeating : Int.max , count: maze[0].count), count: maze.count)
        distance[start[0]][start[1]] = 0
        dfs(maze, start, &distance)
        let result = distance[destination[0]][destination[1]]
        return result == Int.max ? -1 : result
    }
    func dfs(_ maze: [[Int]], _ start: [Int], _ distance:inout [[Int]]) {
        for dir in dirs {
            var count = 0
            var x = start[0] + dir[0]
            var y = start[1] + dir[1]
            while (x >= 0 && x < maze.count && y >= 0 && y < maze[0].count && maze[x][y] == 0) {
                x += dir[0]
                y += dir[1]
                count += 1
            }
            if (distance[start[0]][start[1]] + count < distance[x - dir[0]][y - dir[1]]) {
                distance[x - dir[0]][y - dir[1]] = distance[start[0]][start[1]] + count
                dfs(maze, [x - dir[0], y - dir[1]], &distance)
            }
        }
    }
    func printResult(params: Any...) {
        let input = params[0] as! [[Int]]
        let input1 = params[1] as! [Int]
        let input2 = params[2] as! [Int]
        print("Maze 2 result is : \(shortestDistance(input, input1, input2))")
    }
}
