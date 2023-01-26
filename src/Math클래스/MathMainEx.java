package Math클래스;
// Math 클래스의 모든 메소드는 클래스 메소드 이므로 객체를 생성하지 않고 바로 사용
// random() : 0.0~1.0 미만의 임의의 double 형 값을 생성해서 반환
// 7자리의 로또 번호 생성하기
// 7개의 배열을 만들고  첫 번째 부터 여섯 번째는 0 ~ 50 사이의 임의의 수 생성 후 대입
// 마지막 7번째는 50~ 100 사이의 임의의 수를 만들어서 대입하고, 한 번에 출력, 단 중복은 허용
public class MathMainEx {
    public static void main(String[] args) {
//        int num[] = new int[7];
//        for (int i = 0; i < 6; i++){
//            num[i] = (int)(Math.random()*51);
//
//        }
//        num[6] = (int)(Math.random() * 51) + 50;
//        for(int e : num) System.out.println(e + " ");
          // abs() 메소드 : 절대값 구하기, 양수면 양수, 음수면 양수
//        System.out.println(Math.abs(10));
//        System.out.println(Math.abs(-10));
//        System.out.println(Math.abs(-3.14));
        // floor() : 소수점 이하를 무조건 날림
        // ceil() : 소수점 이하가 있으면 무조건 올림
        // round() : 반올림 (소수점 첫째자리에서 반올림)
//        System.out.println(Math.floor(10.9999));
//        System.out.println(Math.floor(10.0001));
//        System.out.println(Math.floor(10.5));
//        System.out.println(Math.ceil(10.9999));
//        System.out.println(Math.ceil(10.0001));
//        System.out.println(Math.ceil(10.5));
//
//        System.out.println(Math.round(10.9999));
//        System.out.println(Math.round(10.0001));
//        System.out.println(Math.round(10.4999999999));

        System.out.println(Math.max(11, 9.9999));
        System.out.println(Math.min(11, 9.9999));

        System.out.println(Math.pow(2,5)); // 2 * 2 * 2 * 2 * 2








    }
}

