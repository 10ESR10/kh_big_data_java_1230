package 참조타입확인;
// 참조 변수의 == (같음을 확인?)


public class RefType {
    public static void main(String[] args) {
        String name1 = "고양이";
        String name2 = "고양이";
        String name3 = new String("고양이");
        if(name1 == name3) { //내용이 같은게 아니고 주소가 같다는 의미
            System.out.println("두개의 이름에 대한 참조가 같음");

        } else {
            System.out.println("두개의 이름에 대한 참조가 다름");

        }
        if (name1.equals(name3)) { // 내용이 같다는 의미
            // 또는 if(name1.equalsIgnoreCase(name3))
            System.out.println("두개의 이름의 내용이 같음");

        } else {
            System.out.println("두개의 이름의 내용이 다름");
        }
        //        int x = 0;
//        String str = null; // 참조타입 변수가 객체를 참조하지 않는다는 의미
//        int[] intArray = null; //
//        Integer val =null; //
//        int val2 = val; // NullPointExption이 발생
//        System.out.println(val2);

    }

}
