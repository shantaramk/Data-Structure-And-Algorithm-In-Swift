

import UIKit

var str = "Hello, playground"
var arr: [[Int]] = []
arr.append([1,2,3])
arr.append([3,4,5])

print(arr);

for (i, subArray) in arr.enumerated() {
    for (j, item) in subArray.enumerated() {
        // print("a[\(i)] a[\(j)]:", arr[i],arr[j]);
        print("a[\(i)] a[\(j)]:", item);
    }
}

print("----------------------------\n Create of two 2D array \n----------------------------")

func createMatrix() {
    let m = 3 //Row
    let n = 3 //Column
    
    var arr: [[Int]] = []
    
    for i in 0..<n {
        var subArr : [Int] = []
        
        for i in 0..<n {
            subArr.append(i+1)
        }
        arr.append(subArr)
    }
    print(arr);
}
createMatrix()

//---------

print("----------------------------\n Addition of two 2D array \n----------------------------")

func add_2d_array() {
    //Addition of two 2D array
    
    var arr1 = [[1,2,1],
                [2,1,3],
                [3,2,1],]
    
    var arr2 = [[2,1,2],
                [3,2,1],
                [1,3,2],]
    
    var sumArr = arr1
    
    for (i, subArray) in arr2.enumerated() {
        for (j, item) in subArray.enumerated() {
            sumArr[i][j] = sumArr[i][j] + item
        }
    }
    print(sumArr)
}
add_2d_array()

print("----------------------------\n sum of right diagonals of two 2D array \n----------------------------")

func right_diagonals() {
    //sum of right diagonals of two 2D array
    
    
    var arr3 = [[1,2,3],
                [4,5,6],
                [7,8,9],]
    var sum = 0
    
    for (i, subArr) in arr3.enumerated() {
        for(j, item) in subArr.enumerated() {
            if i == j {
                sum = sum + arr3[i][j];
            }
        }
    }
    
    print(sum);
}
right_diagonals()

print("----------------------------\n sum of Column \n----------------------------")

func sum_Column() {
    var arr5 = [[5,6],
                [7,8]]
    
    for (i, subarr) in arr5.enumerated() {
        var csum = 0
        for(j, item) in subarr.enumerated() {
            csum = csum + arr5[j][i];
        }
        print(csum);
        
    }
    
}
sum_Column()


print("----------------------------\n Multiplication of Matrix \n----------------------------")

func matrix_Multiplication() {
    var arr6 = [[1,2,3],
                [4,5,6]] //2*3
    
    var arr7 = [[7,8],
                [9,10],
                [11,12]]// 3*2
    
    
    /*
     var arr6 = [[11, 12],
     [21, 22]] //2*2
     
     var arr7 = [[11, 12, 13],
     [21, 22, 23]] // 2*3
     
     */
    
    //Here arr6(col1) == arr7(row2) so resultArr size would be  2 * 3
    
    let row1 = arr6.count
    let col1 = arr6[0].count
    
    let row2 = arr7.count
    let col2 = arr7[0].count
    
    if col1 != row2 {
        print("Invalid Input")
    } else {
        var resultArr = Array(repeating: Array(repeating: 0, count: col2),
                              count: row1)
        
        for(i, subarray) in resultArr.enumerated() {
            for(j, _) in subarray.enumerated() {
                for k in 0..<col1 {
                    resultArr[i][j] += arr6[i][k] * arr7[k][j]
                }
            }
        }
        print(resultArr)
        
    }
    
}
matrix_Multiplication()

print("----------------------------\n Wave Traversal - Solution 1 \n----------------------------")

func wave_Traversal() {
    
    //   0   1   2   3
    let arr8 = [[11, 12, 13, 14],
                [21, 22, 23, 24],
                [31, 32, 33, 34]]
    /*
     Expected output:
     
     11
     21
     31
     32
     22
     12
     13
     23
     33
     34
     24
     14
     */
    
    //if event index then row ++, if odd then row --
    
    let row = arr8.count
    
    for(i,sub) in arr8[0].enumerated() {
        if i % 2 == 0 {
            for k in 0..<row {
                print(arr8[k][i])
            }
        } else {
            for k in (0...row-1).reversed() {
                print(arr8[k][i])
            }
        }
    }
}
wave_Traversal()


print("----------------------------\n Wave Traversal - Solution 2 \n----------------------------")

func wave_Traversal_2() {
    
    //   0   1   2   3
    let arr8 = [[11, 12, 13, 14],
                [21, 22, 23, 24],
                [31, 32, 33, 34]]
    
    //expected output : 14,24,34,  33,23,13,  12,22,32,  31,21,11
    
    
    //if event index then row --, if odd then row ++
    
    let col = arr8[0].count
    let row = arr8.count
    for i in (0..<col).reversed() {
        if i % 2 == 0 {
            for j in (0..<row).reversed() {
                print(arr8[j][i])
            }
        } else {
            for j in 0..<arr8.count {
                print(arr8[j][i])
            }
        }
        
    }
    
}
wave_Traversal_2()



print("----------------------------\n Wave Traversal - Solution 3 \n----------------------------")

func wave_Traversal_3() {
    
    //   0   1   2   3
    let arr8 = [[11, 12, 13, 14],
                [21, 22, 23, 24],
                [31, 32, 33, 34]]
    
    //expected output : 34,33,32,31, 24,23,22,21, 14,13,12,11
    
    //if row is 0,1,2 then col --
    
    let col = arr8[0].count
    let row = arr8.count
    
    for i in (0..<row).reversed() {
        for j in (0..<col).reversed() {
            print(arr8[i][j])
        }
    }
    
    
}
wave_Traversal_3()

print("----------------------------\n Spiral Traversal - Solution 1 \n----------------------------")

func spiral_Traversal() {
    
    //   0   1   2   3
    let arr  = [[11, 12, 13, 14],
                [21, 22, 23, 24],
                [31, 32, 33, 34]]
    
    //3*4
    //expected output : 11,21,31, 32,33,34, 24,14, 13,12, 22,23
    let m = arr.count
    let n = arr[0].count
    var minRow = 0
    var maxRow = m-1
    
    var minCol = 0
    var maxCol = n - 1
    
    let numberOfElement = m * n
    var visitCount = 0
    
    while visitCount < numberOfElement { //Maintain Each element visit Count
        
        //Left Wall: Eg. 11,21,31
        
        for i in minRow...maxRow where visitCount < numberOfElement {
            print(arr[i][minCol])
            visitCount += 1
        }
        
        minCol += 1
        
        //Bottom Wall: Eg. 32,33,34
        
        for i in minCol...maxCol where visitCount < numberOfElement {
            print(arr[maxRow][i])
            visitCount += 1
        }
        
        maxRow -= 1
        
        //Right Wall: Eg. 24,14
        for i in stride(from: maxRow, through: minRow, by: -1) where visitCount < numberOfElement {
            print(arr[i][maxCol])
            visitCount += 1
        }
        
        maxCol -= 1
        //Top Wall: Eg. 13,12
        
        for i in stride(from: maxCol, through: minCol, by: -1) where visitCount < numberOfElement {
            print(arr[minRow][i])
            visitCount += 1
        }
        
        minRow += 1
    }
    
}
spiral_Traversal()

print("----------------------------\n Spiral Traversal - Solution 2 \n----------------------------")

func spiral_Traversal_2() {
    //   0   1   2   3
    let arr  = [[11, 12, 13, 14],
                [21, 22, 23, 24],
                [31, 32, 33, 34]]
    
    //3*4
    //https://leetcode.com/problems/spiral-matrix/
    //Expected Output: 11,12,13,14, 24,34, 33,32,31, 21 ,22, 23
    
    let m = arr.count
    let n = arr[0].count
    
    var minRow = 0
    var maxRow = m - 1
    var minCol = 0
    var maxCol = n-1
    
    var elementVisitCount = 0
    let numberOfElement = m * n
    while elementVisitCount < numberOfElement {
        
        //Top Wall : eg  11,12,13,14
        for i in minCol...maxCol where elementVisitCount < numberOfElement {
            print(arr[minRow][i])
            elementVisitCount += 1
        }
        minRow += 1
        
        // Right Wall: Eg 24,34
        if minRow <= maxRow {
            for i in minRow...maxRow where elementVisitCount < numberOfElement {
                print(arr[i][maxCol])
                elementVisitCount += 1
            }
        }
        maxCol -= 1
        
        //Bottom Wall: Eg 33,32,31
        
        if maxCol >= minCol {
            for i in stride(from: maxCol, through: minCol, by: -1) where elementVisitCount < numberOfElement {
                print(arr[maxRow][i])
                elementVisitCount += 1
            }
        }
        
        maxRow -= 1
        //Left Wall: 21
        
        if maxRow >= minRow {
            for i in stride(from: maxRow, through: minRow, by: -1) where elementVisitCount < numberOfElement {
                print(arr[i][minCol])
                elementVisitCount += 1
            }
        }
        
        minCol += 1
        
    }
}
spiral_Traversal_2()

print("----------------------------\n Spiral Traversal - Solution 3 \n----------------------------")


func spiral_Traversal_3() {
    //https://leetcode.com/problems/spiral-matrix-ii/
    let n = 3
    var arr = Array(repeating: Array(repeating: 0, count: n),
                    count: n)
    
    var minRow = 0
    var maxRow = n - 1
    var minCol = 0
    var maxCol = n - 1
    
    var elementVisitCount = 0
    let numberOfElement = n * n
      
    var element = 1
    while elementVisitCount < numberOfElement {
        //Top Wall
        if minCol <= maxCol {
            
            for i in minCol...maxCol {
                arr[minRow][i] = element
                element += 1
                elementVisitCount += 1
            }
        }
        minRow += 1
        
        //Right Wall
        if minRow <= maxRow {
            
            
            for i in minRow...maxRow {
                arr[i][maxCol] = element
                element += 1
                elementVisitCount += 1
            }
        }
        maxCol -= 1
        
        //Bottom Wall
        if maxCol >= minCol {
            
            for i in stride(from: maxCol, through: minCol, by: -1) {
                arr[maxRow][i] = element
                element += 1
                elementVisitCount += 1
            }
        }
        maxRow -= 1
        
        //Left Wall
        if maxRow >= minRow {
            for i in stride(from: maxRow, through: minRow, by: -1) {
                arr[i][minCol] = element
                element += 1
                elementVisitCount += 1
            }
        }
        
        minCol += 1
    }
    print(arr)
    
}
spiral_Traversal_3()

print("----------------------------\n Exit Point of a Matrix - Solution 1 \n----------------------------")


func exit_point() {
    
    let arr = [[0,0,1,0],
               [1,0,0,1],
               [1,0,0,1],
               [1,0,1,0]]
    
    //Expected Output: 3 0
    /*
     # Direction
     0 east : col ++
     1 south : row ++
     2 west : col --
     3. North : Row --
     */
    
    let start = 0
    let end = 0
    var col = start
    var row = end
    var direction = 0
    
    while true {
        direction = (direction + arr[row][col]) % 4
        
        if direction == 0 {
            col += 1
        } else if direction == 1 {
            row += 1
        }  else if direction == 2 {
            col -= 1
        } else if direction == 3 {
            row += 1
        }
        
        if row < 0 {
            row += 1
            print(row, col)
            break
        } else if col < 0 {
            col += 1
            print(row, col)
            break
        } else if col > arr[0].count - 1 {
            col -= 1
            print(row, col)
            break
        } else if row > arr.count - 1  {
            row -= 1
            print(row, col)
            break
        }
        
    }
}
exit_point()

print("----------------------------\n Transpose Matrix - Solution 1 \n----------------------------")

func transporse_matrix() {
    var arr = [[1,2,3,4],
               [5,6,7,8],
               [9,10,11,12],
               [13,14,15,16]]
    
    let m = arr.count
    let n = arr[0].count
     
    
    for(i, subarr) in arr.enumerated() {
         
        for j in i...subarr.count-1 {
 
            let temp = arr[i][j]
            arr[i][j] = arr[j][i]
            arr[j][i] = temp
        }
    }
    print(arr)
}
transporse_matrix()

print("----------------------------\n Reverse Matrix - Solution 1 \n----------------------------")

func reverse_matrix() {
    var arr = [[1,2,3,4],
               [5,6,7,8],
               [9,10,11,12],
               [13,14,15,16]]
    
    /*
     Expected Output
     
     var arr = [[4,3,2,1],
                [8,7,6,5],
                [12,11,10,9],
                [16,15,14,13]]
    */
    
    
    let m = arr.count
    let n = arr[0].count
     
    var minJ = 0
    var maxJ = n - 1
    
    for i in 0...m-1 {
        minJ = i
        while minJ < maxJ {
            let temp = arr[i][minJ]
            arr[i][minJ] = arr[i][maxJ]
            arr[i][maxJ] = temp
            minJ += 1
            maxJ -= 1
        }
    }
    print(arr)
}

reverse_matrix()

print("----------------------------\n Diagonal Matrix - Solution 1 \n----------------------------")

func diagonal_matrix() {
    var arr = [[11,12,13,14],
               [21,22,23,24],
               [31,32,33,34],
               [41,42,43,44]]
    
    /*
     Expected Output
     11
     22
     33
     44
     
     12
     23
     34
     
     13
     24
     
     14
    */
    
    let m = arr.count
    let n = arr[0].count
   
    for gap in 0...m-1 {
        //We have i, j combination to print element
        var i = 0
        for j in gap...n-1 {
            print(arr[i][j])
            i+=1
        }
     }
}

diagonal_matrix()

print("----------------------------\n Diagonal Matrix - Solution 2 \n----------------------------")

func diagonal_matrix_2() {
    var arr = [[11,12,13,14],
               [21,22,23,24],
               [31,32,33,34],
               [41,42,43,44]]
    
    /*
     Expected Output
     11
     22
     33
     44
     
     21
     32
     43
     
     31
     42
     
     41
    */
    
    let m = arr.count
    let n = arr[0].count
   
    for gap in 0...m-1 {
        //We have i, j combination to print element
        var j = 0
        for i in gap...n-1 {
            print(arr[i][j])
            j+=1
        }
     }
}

diagonal_matrix_2()

print("----------------------------\n Diagonal Matrix - Solution 3 \n----------------------------")

func diagonal_matrix_3() {
    var arr = [[11,12,13,14],
               [21,22,23,24],
               [31,32,33,34],
               [41,42,43,44]]
    
    /*
     Expected Output
     41
     
     31
     42
     
     21
     32
     43
     
     11
     22
     33
     44
    */
    
    let m = arr.count
    let n = arr[0].count
   
    for gap in (0...m-1).reversed() {
        //We have i, j combination to print element
        var j = 0
        for i in gap...n-1 {
            print(arr[i][j])
            j+=1
        }
     }
}

diagonal_matrix_3()


print("----------------------------\n Saddle Matrix - Solution 3 \n----------------------------")

func saddle_matrix() {
    let arr = [[11,12,13,14],
               [21,22,23,24],
               [31,32,33,34],
               [41,42,43,44]]
    
    /*
     Expected Output
     41
    */
    
    let m = arr.count
    let n = arr[0].count
     
    var indeSmallValueInCol = 0
    var smallValueInCol = 0
    
    for i in 0...m-1 {
        for j in 1...n-1 {
            if arr[i][j] < smallValueInCol {
                smallValueInCol = arr[i][j]
                indeSmallValueInCol = j
            }
        }
        
        var isMaxInRow = true
        for k in 0...m-1 {
            if arr[k][indeSmallValueInCol] > smallValueInCol {
                isMaxInRow = false
                break
            }
        }
        
        if isMaxInRow == true {
            print(arr[i][indeSmallValueInCol])
            return
        }
    }
    print("Invalid Input")

}

saddle_matrix()

//syntex
/*
 for i in stride(from: 0, to: 5, by: 1) {
 print("TO:",i)
 }
 for i in stride(from: 0, through: 5, by: 1) {
 print("through:",i)
 }
 
 for i in stride(from: 5, to: 0, by: -1) {
 print("TO:",i)
 }
 for i in stride(from: 5, through: 0, by: -1) {
 print("through:",i)
 }
 */
var foo = 1

DispatchQueue.main.async {
    foo += 1
    print("11111")
}

foo += 1
print("222222")
