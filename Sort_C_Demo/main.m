//
//  main.m
//  Sort_C_Demo
//
//  Created by rrd on 2018/12/25.
//  Copyright © 2018年 rrd. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <string.h>

/*
 冒泡排序是一种简单的排序算法。它重复地走访过要排序的数列，一次比较两个元素，如果它们的顺序错误就把它们交换过来。走访数列的工作是重复地进行直到没有再需要交换，也就是说该数列已经排序完成。这个算法的名字由来是因为越小的元素会经由交换慢慢“浮”到数列的顶端。
 
 1.1 算法描述
 比较相邻的元素。如果第一个比第二个大，就交换它们两个；
 对每一对相邻元素作同样的工作，从开始第一对到结尾的最后一对，这样在最后的元素应该会是最大的数；
 针对所有的元素重复以上的步骤，除了最后一个；
 重复步骤1~3，直到排序完成。
 
 n*(n+1)/2 - n = O(n2)
 */
void bubbleSort(int array[], int length) {
    printf("---------冒泡排序开始--------\n");
    int count = 0;
    int sortArray[length];
    memcpy(sortArray, array, sizeof(int)*length);
    for (int i = 0; i < length - 1; i++) {
        for (int j = 0; j < length - 1 - i; j++) {
            count++;
            if (sortArray[j] > sortArray[j+1]) {        // 相邻元素两两对比
                int temp = sortArray[j+1];        // 元素交换
                sortArray[j+1] = sortArray[j];
                sortArray[j] = temp;
            }
        }
        for (int i = 0;i < length; i++) {
            printf("%d,",sortArray[i]);
        }
        printf("\n");
    }
    printf("---------冒泡排序完成，共排序了%d次--------\n",count);
}

/*
 选择排序(Selection-sort)是一种简单直观的排序算法。它的工作原理：首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置，然后，再从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序序列的末尾。以此类推，直到所有元素均排序完毕。
 
算法描述
 n个记录的直接选择排序可经过n-1趟直接选择排序得到有序结果。具体算法描述如下：
 
 初始状态：无序区为R[1..n]，有序区为空；
 第i趟排序(i=1,2,3…n-1)开始时，当前有序区和无序区分别为R[1..i-1]和R(i..n）。该趟排序从当前无序区中-选出关键字最小的记录 R[k]，将它与无序区的第1个记录R交换，使R[1..i]和R[i+1..n)分别变为记录个数增加1个的新有序区和记录个数减少1个的新无序区；
 n-1趟结束，数组有序化了。
 */

void selectionSort(int array[], int length) {
    printf("---------选择排序开始--------\n");
    int count = 0;
    int sortArray[length];
    memcpy(sortArray, array, sizeof(int)*length);
    int minIndex, temp;
    for (int i = 0; i < length - 1; i++) {
        minIndex = i;
        for (int j = i + 1; j < length; j++) {
            count++;
            if (sortArray[j] < sortArray[minIndex]) {     // 寻找最小的数
                minIndex = j;                 // 将最小数的索引保存
            }
        }
        temp = sortArray[i];
        sortArray[i] = sortArray[minIndex];
        sortArray[minIndex] = temp;
        for (int i = 0;i < length; i++) {
            printf("%d,",sortArray[i]);
        }
        printf("\n");
    }
    printf("---------选择排序完成,共排序了%d次--------\n",count);
}

/*
 3、插入排序（Insertion Sort）
 插入排序（Insertion-Sort）的算法描述是一种简单直观的排序算法。它的工作原理是通过构建有序序列，对于未排序数据，在已排序序列中从后向前扫描，找到相应位置并插入。
 
 3.1 算法描述
 一般来说，插入排序都采用in-place在数组上实现。具体算法描述如下：
 
 从第一个元素开始，该元素可以认为已经被排序；
 取出下一个元素，在已经排序的元素序列中从后向前扫描；
 如果该元素（已排序）大于新元素，将该元素移到下一位置；
 重复步骤3，直到找到已排序的元素小于或者等于新元素的位置；
 将新元素插入到该位置后；
 重复步骤2~5。
 */
void insertionSort(int array[], int length) {
    printf("---------插入排序开始--------\n");
    int count = 0;
    int sortArray[length];
    memcpy(sortArray, array, sizeof(int)*length);
    int preIndex, current;
    for (int i = 1; i < length; i++) {
        preIndex = i - 1;
        current = sortArray[i];
        while (preIndex >= 0 && sortArray[preIndex] > current) {
            sortArray[preIndex + 1] = sortArray[preIndex];
            preIndex--;
            count++;
        }
        sortArray[preIndex + 1] = current;
        
        for (int i = 0;i < length; i++) {
            printf("%d,",sortArray[i]);
        }
        printf("\n");
    }
      printf("---------插入排序完成,共排序了%d次--------\n",count);
}

/*
 4、希尔排序（Shell Sort）
 1959年Shell发明，第一个突破O(n2)的排序算法，是简单插入排序的改进版。它与插入排序的不同之处在于，它会优先比较距离较远的元素。希尔排序又叫缩小增量排序。
 
 4.1 算法描述
 先将整个待排序的记录序列分割成为若干子序列分别进行直接插入排序，具体算法描述：
 
 选择一个增量序列t1，t2，…，tk，其中ti>tj，tk=1；
 按增量序列个数k，对序列进行k 趟排序；
 每趟排序，根据对应的增量ti，将待排序列分割成若干长度为m的子序列，分别对各子表进行直接插入排序。仅增量因子为1 时，整个序列作为一个表来处理，表长度即为整个序列的长度。
 
 时间复杂度 O(n*logn)
 */
void shellSort(int array[], int length) {
    printf("---------希尔排序开始--------\n");
    int count = 0;
    int sortArray[length];
    memcpy(sortArray, array, sizeof(int)*length);
    int i;
    int j;
    //gap是分组的步长
    int preIndex, current;    //希尔排序是在直接插入排序的基础上实现的,所以仍然需要哨兵
    for(int gap = length/2; gap > 0; gap = gap/2){
        for(i = 0; i < gap; i++){
            for(j = i + gap; j < length; j = j + gap){    //单独一次的插入排序
                if(sortArray[j] < sortArray[j - gap]){
                    current = sortArray[j];    //哨兵
                    preIndex = j - gap;
                    while(preIndex >= 0 && sortArray[preIndex] > current){
                        sortArray[preIndex + gap] = sortArray[preIndex];
                        preIndex = preIndex - gap;
                        count++;
                    }
                    sortArray[preIndex + gap] = current;
                }
            }
        }
        for (int i = 0;i < length; i++) {
            printf("%d,",sortArray[i]);
        }
        printf("\n");
    }
    printf("---------希尔排序完成,,共排序了%d次--------\n",count);
}

/*
 归并排序是建立在归并操作上的一种有效的排序算法。该算法是采用分治法（Divide and Conquer）的一个非常典型的应用。将已有序的子序列合并，得到完全有序的序列；即先使每个子序列有序，再使子序列段间有序。若将两个有序表合并成一个有序表，称为2-路归并。
 
 5.1 算法描述
 把长度为n的输入序列分成两个长度为n/2的子序列；
 对这两个子序列分别采用归并排序；
 将两个排序好的子序列合并成一个最终的排序序列。
 */
/*
 函数功能：合并
 函数参数：
 arr: 目标数组
 start: 待合并段开始下标
 mid: 待合并段中间下标
 end: 待合并段结束下标
 */
void merge(int* arr, int start, int mid, int end)
{
    int length_left, length_right; //左右待合并区间的长度
    length_left = mid - start + 1;
    length_right = end - mid;
    int leftArray[length_left], rightArray[length_right]; //gcc, 两个临时数组，分别保存待合并的两个区间
    //int l[100], r[100]; //vc
    memcpy(leftArray, arr + start, sizeof(int) * length_left);
    memcpy(rightArray, arr + mid + 1, sizeof(int) * length_right);
    
    int i = 0, j = 0, k = start;
    while(i < length_left && j < length_right)
    {
        arr[k++] = leftArray[i] < rightArray[j] ? leftArray[i++] : rightArray[j++];
    }
    
    while(i < length_left)
    {
        arr[k++] = leftArray[i++];
    }
}
/*
 函数功能：归并排序
 函数参数：
 arr: 待排序的数组
 start: 待排序数组开始下标
 end: 待排序数组结束下标
 */
void mergeSort(int* arr, int start, int end)
{
//    printf("---------归并排序开始--------\n");
    int count = 0;
    if(start < end)
    {
        int mid = (start + end) / 2;
        //归
        mergeSort(arr, start, mid);
        mergeSort(arr, mid + 1, end);
        //并
        merge(arr, start, mid, end);
        
//        for (int i = 0;i < length; i++) {
//            printf("%d,",sortArray[i]);
//        }
//        printf("\n");
    }
//    printf("---------归并排序完成,共排序了%d次--------\n",count);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"Test---1111");
        NSLog(@"Test---2222");
        NSLog(@"Test---3333");
        
        int bubbleArray[6] = {6,5,4,3,2,1};
        
        bubbleSort(bubbleArray,6);
        printf("**************************************\n");
        selectionSort(bubbleArray,6);
        printf("**************************************\n");
        insertionSort(bubbleArray, 6);
        printf("**************************************\n");
        shellSort(bubbleArray, 6);
        printf("**************************************\n");
        mergeSort(bubbleArray, 0, 6 - 1);
        printf("**************************************\n");
        
        for (int i = 0;i < 6; i++) {
            printf("%d,",bubbleArray[i]);
        }
        printf("\n");
        
    }
    return 0;
}
