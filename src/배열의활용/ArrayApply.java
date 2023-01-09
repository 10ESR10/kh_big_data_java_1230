package 배열의활용;

import java.util.Arrays;

// arraycopy() : 배열값을 복사 할 때 사용
// copyOf() : 배열을 원하는 길이 만큼 새로운 배열로 복사
public class ArrayApply {
    public static void main(String[] args) {
        int[] arr1 = {90, 45, 77, 80, 55}; // 원본 데이터
//        int len = 10;
//        int[] arr2 = new int[len];
//        System.Arraycopy(arr1, 0, arr2, 4, arr1.length);

//
//        System.out.println(Arrays.toString(arr2));
        int[] arr3= Arrays.copyOf(arr1, 10);
        System.out.println(Arrays.toString(arr3));
    }
}
