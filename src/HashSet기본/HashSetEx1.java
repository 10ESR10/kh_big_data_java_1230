package HashSet기본;

import java.util.Arrays;
import java.util.HashSet;

// HashSet : 순서를 보장하지 않으며 중복 값을 허용하지 않습니다.
// 중복여부 확인은 HashCode()의 리턴값을 이용합니다. (경우에 따라 오버라이딩 합니다.)
public class HashSetEx1 {
    public static void main(String[] args) {
        HashSet<Member> set = new HashSet<>();
        set.add(new Member(1001, "유나"));
        set.add(new Member(1002, "정국"));
        set.add(new Member(1003, "안유진"));
        Member mem4 = new Member(1004, "카리나");
        set.add(mem4);
        set.add(new Member(1003, "카즈하"));

        for (Member e : set) {
            e.showMember();
            System.out.println(e.hashCode());
            System.out.println("----------------------");
        }

    }
}
class Member {
    int id;
    String name;

    @Override
    public int hashCode() {
        return id;
    }
    @Override
    public boolean equals(Object obj) {
        if (obj instanceof Member) {
            Member member = (Member) obj;
            if (this.id == member.id) return  true;
            else return false;

        }
        return false;
    }

    public Member(int id, String name) {
        this.id = id;
        this.name = name;
    }
    public void showMember() {
        System.out.println("아이디 : " + id);
        System.out.println("이름 : " + name);

}




    }
