package 스트링버프;
// StringBuffer : 객체 생성 후 사용, 문자열 추가시 기존의 문자열이 수정 됨, 동기화 지원(멀티쓰레드에서 안전)

// StringBuilder : 객체 생성 후 사용, 문자열 추가시 기존 문자열이 수정 됨, 동기화 지원 안 됨 ,성능은 우수
// String : 객체 생성 필요없음, 문자열 추가 시 계속 새로운 문자열이 만들어짐, 문자열 추가가 길어지면 성능저하
// append() : 문자열을 추가 할 때 사용
// insert() : 특정 위치에 문자열을 삽입
// substring() : 문자열을 구간을 정해 잘라냄
public class StringBufferMain {
    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();

        sb.append("hello");
        sb.append(" ");
        sb.append("Python");
        sb.insert(0,"안녕하세요^^");
       // sb.delete(1, 3); // 1번 인덱스에서 3번 미만 (1,2가 해당 됨)

        System.out.println(sb);
        System.out.println(sb.substring(7));
        System.out.println(sb.substring(0,7));
//        sb.append("to java");
//        sb.append(" ");
//        sb.append("Python");
//        System.out.println(sb);
//
//        String st = "hello";
//        st += " ";
//        st += "to java";
//        st += " ";
//        st += "Python";
//        System.out.println(st);

    }
}
