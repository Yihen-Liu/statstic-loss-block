package main

import "fmt"

/**
 * Description:
 * Author: Yihen.Liu
 * Create: 2023-10-24
 */
func main() {
	sum := 0
	totalLine := len(blockNums)
	//lastSpliteBlockNum := 0 //记录上次断层点
	for i := 0; i < totalLine; i++ {
		if i == totalLine-1 {
			break
		}
		if blockNums[i]+1 != blockNums[i+1] {
			sum += blockNums[i+1] - blockNums[i] - 1
			//fmt.Printf("{%d, %d}, step:%d\n", blockNums[i], blockNums[i+1], blockNums[i]-lastSpliteBlockNum)
			fmt.Printf("%d, %d\n", blockNums[i], blockNums[i+1])
			//lastSpliteBlockNum = blockNums[i+1]
		}
	}

	fmt.Println("lossing blocks sum:", sum)
}
