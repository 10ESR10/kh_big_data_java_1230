package 변수의생존범위;

public class ScopeData {
    public static void main(String[] args) {
        int value = 20; // 지역 변수

      if(value > 10){
          int m = 30;

         m=  m + (value - 10);

      }
        int m = 10;
        System.out.println(m);
    }
}
//변수는 항상 범위를 체크해야함