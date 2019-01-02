//
//  main.m
//  Sort_C_Demo
//
//  Created by rrd on 2018/12/25.
//  Copyright © 2018年 rrd. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 冒泡排序，插入排序，选择排序 的时间复杂度 O(n2)
 */

void bubbleSort(int arr[], int len) {
    for (int i = 0; i < len - 1; i++) {
        for (int j = 0; j < len - 1 - i; j++) {
            if (arr[j] > arr[j+1]) {        // 相邻元素两两对比
                int temp = arr[j+1];        // 元素交换
                arr[j+1] = arr[j];
                arr[j] = temp;
            }
        }
        for (int i = 0;i < len; i++) {
            printf("%d,",arr[i]);
        }
        printf("\n");
    }
}

void selectionSort(int arr[], int len) {
    int minIndex, temp;
    for (int i = 0; i < len - 1; i++) {
        minIndex = i;
        for (int j = i + 1; j < len; j++) {
            if (arr[j] < arr[minIndex]) {     // 寻找最小的数
                minIndex = j;                 // 将最小数的索引保存
            }
        }
        temp = arr[i];
        arr[i] = arr[minIndex];
        arr[minIndex] = temp;
        for (int i = 0;i < len; i++) {
            printf("%d,",arr[i]);
        }
        printf("\n");
    }
}

void insertionSort(int arr[], int len) {
    int preIndex, current;
    for (int i = 1; i < len; i++) {
        preIndex = i - 1;
        current = arr[i];
        while (preIndex >= 0 && arr[preIndex] > current) {
            arr[preIndex + 1] = arr[preIndex];
            preIndex--;
        }
        arr[preIndex + 1] = current;
        
        for (int i = 0;i < len; i++) {
            printf("%d,",arr[i]);
        }
        printf("\n");
    }
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
//        int bubbleArray[4] = {20,19,7,2};
//        int selectionArray[4] = {19,2,20,7};
        int insertArray[4] = {20,19,7,2};
        
        printf("-------排序开始--------\n");
//        bubbleSort(bubbleArray,4);
//        selectionSort(selectionArray,4);
        insertionSort(insertArray, 4);
        
        printf("\n-------排序完成--------\n");
        for (int i = 0;i < 4; i++) {
            printf("%d,",insertArray[i]);
        }
        
    }
    return 0;
}
