package 열거타입예제;

public class EnumTypeEx2 {
    public static void main(String[] args) {
       Developer developer = new Developer( "권영진", DevType.EMBEDDED, Career.SENIOR,Gender.MALE);
       developer.devInfo();
        Developer developer1 = new Developer( "곰돌이", DevType.DBA, Career.JUNIOR,Gender.MALE);
        developer.devInfo();


    }
}
