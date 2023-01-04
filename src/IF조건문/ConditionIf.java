package IF조건문;

import java.util.Scanner;
// if
public class ConditionIf {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("정수를 입력 하세요 : ");
        int number = sc.nextInt();
        if(number > 100) { // number 값이 0과 같거나 크면 참
            System.out.println(number + "은 100보다 커요");
        } else if(number < 100){
            System.out.println(number + "은 100보다 작아요");
        } else{
            System.out.println(number + "은 100과 같아요");
        }

    }
}
