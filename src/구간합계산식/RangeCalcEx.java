package 구간합계산식;

import java.util.Scanner;

public class RangeCalcEx {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int x = sc.nextInt();
        int[] arr = new int[n];
        long[] sumArr = new long[n]; // 합 배열
        for (int i = 0 ; i < n; i++) {
            arr[i] = sc.nextInt();
            if (i == 0 ) sumArr[0]  = arr[0];
            else sumArr[i] = sumArr[i-1] + arr[i];
        }
        int left = 0, right = 0;
        while (x !=0) {
            left = sc.nextInt();
            right = sc.nextInt();
            // 구간합 계산하기 : sum[R] - sum[L-1], 인덱스로 계산하기 위해서는 -1을 더해준다. 시간의 복잡도 : 0(1)
       if (left!=1)System.out.println(sumArr[right-1] - sumArr[left -2]);
        else System.out.println(sumArr[right-1]-0);
            x--;
        }
    }
}
