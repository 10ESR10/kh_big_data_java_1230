package 클래스정렬연습문제;

import java.util.Comparator;

public class Rank implements Comparator<Study> {
    @Override
    public int compare(Study o1, Study o2) {
        if (o1.grade == o2.grade) {
            return o1.grdNum.compareTo(o2.grdNum); // 성적이 같은 경우 학번순 정렬

        }
        return o2.grade - o1.grade; // 성적이 높은 사람 순으로 내림차순
    }

    @Override
    public Comparator<Study> reversed() {
        return Comparator.super.reversed();
    }
}
