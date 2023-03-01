package Com.Movie.Jdbc;


import Com.Movie.Jdbc.dao.MovieDAO;
import Com.Movie.Jdbc.vo.MovieVo;
import Com.Movie.Jdbc.vo.RatingVo;


import java.util.List;

import java.util.Scanner;

public class JdbcMain {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        MovieDAO dao = new MovieDAO();


        while (true) {
            System.out.println("===== [영화 정보] =====");
            System.out.println("[1]전체 영화 [2]영화 검색 [3] 종료 ");

            int sel = sc.nextInt();
            switch (sel) {
                case 1:
                    List<MovieVo> list = dao.MovieSelect();
                    dao.movieSelectPrint(list);

                    break;
                case 2:

                    System.out.println("[1]제목 검색 [2]키워드 검색 [3]평점 보기 [4] 종료");
                    int sel2 = sc.nextInt();


                    switch (sel2) {
                        case 1:
                            System.out.println("제목 :");
                            String name = sc.next();
                            List<MovieVo> Result = dao.SearchMovieName(name);
                            if (!Result.isEmpty()) {
                                for (MovieVo m : Result) {

                                    dao.movieSelectPrint(Result);
                                }
                            } else {
                                System.out.println("검색 결과가 없습니다.");
                            }

                            break;
                        case 2:
                            System.out.println("키워드를 입력하세요:");
                            String keyword = sc.next();
                            List<MovieVo> result = dao.keywordSearch(keyword);

                            if (!result.isEmpty()) {
                                for (MovieVo m : result) {

                                    dao.movieSelectPrint(result);
                                }
                            } else {
                                System.out.println("검색 결과가 없습니다.");
                            }
                            break;
                        case 3:
                            System.out.println("[1]평점 높은순 [2]영화별 평점검색 [3]종료");
                            int sel3 =sc.nextInt();

                            switch(sel3) {

                                case 1:


                                    List<Object[]> ratingList = dao.RatingDesc();
                                    for (Object[] ratingObj : ratingList) {
                                        MovieVo movie = (MovieVo) ratingObj[0];
                                        RatingVo rating = (RatingVo) ratingObj[1];

                                        System.out.println("영화 제목 : " + movie.getMovieName());
                                        System.out.println("영화 번호 : " + movie.getMovieNo());
                                        System.out.println("평점 : " + rating.getRating());
                                        System.out.println("----------------------------");

                                    }
                                    break;

                                case 2:
                                    System.out.println("제목을 입력하세요 : ");
                                    String moviename = sc.next();
                                    List<Object[]> searchlist = dao.RatingSearch(moviename);
                                    for (Object[] searchObj : searchlist) {
                                        MovieVo movie = (MovieVo) searchObj[0];
                                        RatingVo rating = (RatingVo) searchObj[1];

                                        System.out.println("영화 제목 : " + movie.getMovieName());
                                        System.out.println("영화 번호 : " + movie.getMovieNo());
                                        System.out.println("평점 : " + rating.getRating());
                                        System.out.println("----------------------------");
                                    }


                                    break;
                                case 3:
                                    System.out.println("종료 합니다.");
                                    System.exit(0);

                            }
                            break;




                        case 4:
                                    System.out.println("종료 합니다.");
                                    System.exit(0);



                            }
                            break;

                        case 3:
                            System.out.println("종료 합니다.");
                            System.exit(0);
                            break;
                    }
            }

        }
    }

