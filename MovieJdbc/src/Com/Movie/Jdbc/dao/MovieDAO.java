package Com.Movie.Jdbc.dao;

import Com.Movie.Jdbc.util.Common;
import Com.Movie.Jdbc.vo.MovieVo;
import Com.Movie.Jdbc.vo.RatingVo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class MovieDAO {
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    PreparedStatement pstmt = null;

    public List<MovieVo> MovieSelect() {
        List<MovieVo> list = new ArrayList<>();
        try {
            conn = Common.getConnection();
            stmt = conn.createStatement();
            String sql = "SELECT * FROM MOVIE";
            rs = stmt.executeQuery(sql);


            while (rs.next()) {
                int MovieNo = rs.getInt("MOVIE_NUMBER");
                String MovieName = rs.getString("MOVIE_NAME");
                String Director = rs.getString("MOVIE_DIRECTOR");
                String MovieContent = rs.getString("MOVIE_CONTENT");
                String MovieGenre = rs.getString("MOVIE_GENRE");
                Date MovieDate = rs.getDate("MOVIE_DATE");
                MovieVo vo = new MovieVo(MovieNo, MovieName, Director, MovieContent, MovieGenre, MovieDate);
                list.add(vo);


            }
            Common.close(rs);
            Common.close(stmt);
            Common.close(conn);


        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<MovieVo> SearchMovieName(String MovieName) {
        List<MovieVo> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM MOVIE WHERE MOVIE_NAME = ?";
            conn = Common.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, MovieName);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int MovieNo = rs.getInt("MOVIE_NUMBER");

                String Director = rs.getString("MOVIE_DIRECTOR");
                String MovieContent = rs.getString("MOVIE_CONTENT");
                String MovieGenre = rs.getString("MOVIE_GENRE");
                Date MovieDate = rs.getDate("MOVIE_DATE");
                MovieVo vo = new MovieVo(MovieNo, MovieName, Director, MovieContent, MovieGenre, MovieDate);
                list.add(vo);

            }
            Common.close(rs);
            Common.close(pstmt);
            Common.close(conn);


        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<MovieVo> keywordSearch(String Keyword) {
        List<MovieVo> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM MOVIE "
                    + "WHERE MOVIE_NAME LIKE  ? "
                    + "OR MOVIE_DIRECTOR LIKE ?"
                    + "   OR MOVIE_CONTENT LIKE  ? "
                    + "   OR MOVIE_GENRE LIKE  ?";
            conn = Common.getConnection();

            pstmt = conn.prepareStatement(sql);
            String kwd = "%" + Keyword + "%";
            pstmt.setString(1, kwd);
            pstmt.setString(2, kwd);
            pstmt.setString(3, kwd);
            pstmt.setString(4, kwd);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int MovieNo = rs.getInt("MOVIE_NUMBER");
                String MovieName = rs.getString("MOVIE_NAME");
                String Director = rs.getString("MOVIE_DIRECTOR");
                String MovieContent = rs.getString("MOVIE_CONTENT");
                String MovieGenre = rs.getString("MOVIE_GENRE");
                Date MovieDate = rs.getDate("MOVIE_DATE");

                MovieVo vo = new MovieVo(MovieNo, MovieName, Director, MovieContent, MovieGenre, MovieDate);
                list.add(vo);

            }
            Common.close(rs);
            Common.close(pstmt);
            Common.close(conn);


        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Object[]> RatingDesc() {
        List<Object[]> list = new ArrayList<>();
        try {
            String sql = "SELECT MOVIE_NAME , R.MOVIE_NUMBER , TRUNC(AVG(RATING_MOVIE),1) AS 평점 " +
                    "FROM MOVIE M JOIN RATING R " +
                    "ON M.MOVIE_NUMBER = R.MOVIE_NUMBER " +
                    "GROUP BY MOVIE_NAME, R.MOVIE_NUMBER " +
                    "ORDER BY TRUNC(AVG(RATING_MOVIE),1) DESC";
            conn = Common.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                String MovieName = rs.getString("MOVIE_NAME");
                int MovieNo = rs.getInt("MOVIE_NUMBER");
                MovieVo movie = new MovieVo(MovieNo, MovieName);


                double rating = rs.getDouble("평점");
                RatingVo ratingScore = new RatingVo(rating);

                Object[] ratingObj = new Object[2];
                ratingObj[0] = movie;
                ratingObj[1] = ratingScore;
                list.add(ratingObj);


            }
            Common.close(rs);
            Common.close(pstmt);
            Common.close(conn);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Object[]> RatingSearch(String moviename) {
        List<Object[]> list = new ArrayList<>();
        try {
            String sql = "SELECT MOVIE_NAME , R.MOVIE_NUMBER , TRUNC(AVG(RATING_MOVIE),1) 평점 " +
                    "FROM MOVIE M JOIN RATING R " +
                    "ON M.MOVIE_NUMBER = R.MOVIE_NUMBER " +
                    "GROUP BY MOVIE_NAME, R.MOVIE_NUMBER " +
                    "HAVING MOVIE_NAME = ?";
            conn = Common.getConnection();
            pstmt = conn.prepareStatement(sql);
            String name = moviename;
            pstmt.setString(1, moviename);
            rs = pstmt.executeQuery();


            while (rs.next()) {
                String MovieName = rs.getString("MOVIE_NAME");
                int MovieNo = rs.getInt("MOVIE_NUMBER");
                MovieVo movie = new MovieVo(MovieNo, MovieName);


                double rating = rs.getDouble("평점");
                RatingVo ratingScore = new RatingVo(rating);

                Object[] searchObj = new Object[2];
                searchObj[0] = movie;
                searchObj[1] = ratingScore;
                list.add(searchObj);
            }
            Common.close(rs);
            Common.close(pstmt);
            Common.close(conn);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }




    public void movieSelectPrint (List < MovieVo > list) {
            for (MovieVo e : list) {

                System.out.println("영화 번호 : " + e.getMovieNo());
                System.out.println("영화 제목 : " + e.getMovieName());
                System.out.println("감독 : " + e.getDirector());
                System.out.println("줄거리 : " + e.getMovieContent());
                System.out.println("장르 : " + e.getMovieGenre());
                System.out.println("개봉일 : " + e.getMovieDate());
                System.out.println("------------------------------------");
            }
        }


    }




