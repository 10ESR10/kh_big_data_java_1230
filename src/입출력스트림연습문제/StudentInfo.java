package 입출력스트림연습문제;

public class StudentInfo implements Comparable<StudentInfo>  {
    private String name;
    private int kor;
    private int eng;
    private int mat;

    public StudentInfo(String name, int kor, int eng, int mat) {
        this.name = name;
        this.kor = kor;
        this.eng = eng;
        this.mat = mat;
    }
    int getTotal() {
        return kor + eng + mat;
    }
    String getName() {
        return name;
    }

    @Override
    // 총점이 높은 사람 순으로 이름과 총점 보여주기 (총점이 같으면 이름순으로)
    public int compareTo(StudentInfo o) {
        if (this.getTotal() == o.getTotal()) return this.name.compareTo(o.name);
        return o.getTotal() - this.getTotal();  // 내림차순 정렬

    }
}
