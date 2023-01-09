package 깊은복사얕은복사;
// 깊은 복사 : 할당된 메모리 공간에 실제 값이 복사 되는 것(기본 타입 모두 여기에 해당함)
// 얕은 복사 : 참조 타입에 해당되며 실제 값이 복사가 되는 것이 아니라 주소가 복사되는 것을 의미

import java.util.Arrays;

public class DeepCopy {
    public static void main(String[] args) {
        //얕은 복사가 발생하는 경우
        int[] arr1 = new int[4];
        arr1[0] = 100;
        int[] arr2 = Arrays.copyOf(arr1, arr1.length); // 얕은 복사가 일어남
        //System.arraycopy(arr1, 0, arr2, 0, arr1.length);

        arr1[0] = 300;
        System.out.println(Arrays.toString(arr1));
        System.out.println(Arrays.toString(arr2));


//        int x = 100;
//        int y;
//        y = x;
//        x = 200;
//        System.out.println("y의 값 : " + y);
    }
}
