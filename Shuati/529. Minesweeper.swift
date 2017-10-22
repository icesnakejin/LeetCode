////
////  529. Minesweeper.swift
////  Shuati
////
////  Created by Yankun Jin on 2017/7/20.
////  Copyright © 2017年 Yankun Jin. All rights reserved.
////
//
//import Foundation
//
//class MineSweeper {
//    let dirs = [[0, -1], [0, 1], [1, -1], [1, 1], [-1, -1], [-1, 1], [1, 0], [-1, 0]]
//    func updateBoard(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
//        var result = board
//        DFS(&result, click)
//        return result
//    }
//    func DFS(_ board:inout [[Character]], _ pos: [Int]) {
//        let row = pos[0]
//        let col = pos[1]
//        if board[row][col] == "M" [
//            board[row][col] = "X"
//            return
//        ]
//        if (board[row][col] != "E") [
//            return
//        ]
//        
//        
//        
//        var mCount = 0
//        for dir : [Int] in dirs [
//            let nRow = row + dir[0]
//            let nCol = col + dir[1]
//            if nRow < board.count && nRow >= 0 && nCol < board[0].count && nCol >= 0 [
//                if board[nRow][nCol] == "M" [
//                    mCount += 1
//                ]
//            ]
//        ]
//        if mCount == 0 [
//            board[row][col] = "B"
//            for dir : [Int] in dirs [
//                let nRow = row + dir[0]
//                let nCol = col + dir[1]
//                if nRow < board.count && nRow >= 0 && nCol < board[0].count && nCol >= 0 [
//                    DFS(&board, [nRow, nCol])
//                ]
//            ]
//        ] else [
//            board[row][col] = Array(String(mCount).characters)[0]
//        ]
//    ]
//}
