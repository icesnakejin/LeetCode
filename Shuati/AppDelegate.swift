//
//  AppDelegate.swift
//  Shuati
//
//  Created by Yankun Jin on 4/30/17.
//  Copyright © 2017 Yankun Jin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //_ = SolutionNGE().nextGreaterElements([])
        //let result = AddNumber2().addTwoNumbers(<#T##l1: ListNode?##ListNode?#>, <#T##l2: ListNode?##ListNode?#>)
        
//        let result = ComplexProduction().complexNumberMultiply("1+-1i", "1+-1i")
//        let result1 = taskScheduler().leastInterval(["A","B","C","D","E","A","B","C","D","E"], 4)
//        let result2 = MinimumGeneMutation().minMutation("AAAAAAAA", "CCCCCCCC", ["AAAAAAAA","AAAAAAAC","AAAAAACC","AAAAACCC","AAAACCCC","AACACCCC","ACCACCCC","ACCCCCCC","CCCCCCCA"])
//        print("result2: \(result2)")
//        let result3 = FindDuplicateFile().findDuplicate(["root/a 1.txt(abcd) 2.txt(efgh)", "root/c 3.txt(abcd)", "root/c/d 4.txt(efgh)", "root 4.txt(efgh)"])
//        print("duplicate find \(result3)")
        
        //print("complex mulyi result = \(result)")
        //let result4 = MostFrequentSubTreeSum().findFrequentTreeSum(<#T##root: TreeNode?##TreeNode?#>)
//        let mineSweeper = MineSweeper().updateBoard([["B", "1", "E", "1", "B"],
//                                                     ["B", "1", "M", "1", "B"],
//                                                     ["B", "1", "1", "1", "B"],
//                                                     ["B", "B", "B", "B", "B"]], [1,2])
        //print("mineSweepter result \(mineSweeper)")
//        let maxTree = MaxBT().constructMaximumBinaryTree([3,2,1,6,0,5])
//        let result = Palindromic_Substrings().countSubstrings("cdbcaccbbaacccdcbbdcbdcdddbcbdcbadabdcbcbbadddbabdbddbbbdbdcaacdcacdbbdacdbabc")
//        print("Palindromic_Substring: \(result)")
//        let root = TreeNode(1)
//        root.left = TreeNode(2)
//        
//        let result = Print_Binary_Tree().printTree(root)
//        print("Print Binary Tree: \(result)")
//        let result = MatchStickSolution().makesquare([5969561,8742425,2513572,3352059,9084275,2194427,1017540,2324577,6810719,8936380,7868365,2755770,9954463,9912280,4713511])
//        print("Can make match square: \(result)")
//        let result = OnesAndZeroesSolution().findMaxForm(["1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0","1","0"], 30, 30)
//        print("Ones and Zeros: \(result)")
        
//    let result = HDSolution().totalHammingDistance([4,14,2])
//    print("Can humming distance: \(result)")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

