
import java.sql.*;

public class DBConnect5 {
     public static void main(String[] args) throws Exception {

          /* 1) PostgreSQLへの接続情報 */
          Connection con; 
          Statement st;

          String url = "jdbc:postgresql://localhost:5432/shop";
          String user = "postgres";
          String password = "yomasa75"; 

          /* 2) JDBCドライバの定義 */
          Class.forName("org.postgresql.Driver");

          /* 3) PostgreSQLへの接続 */
          con = DriverManager.getConnection(url, user, password);
          st = con.createStatement();

          /* 4) UPDATE文の実行 */
          int updcnt = st.executeUpdate("UPDATE Shohin SET shohin_mei='Yシャツ' WHERE shohin_mei='Tシャツ'");

          /* 5) 結果の画面表示 */
          System.out.print(updcnt + "行更新しました");
          
          /* 6) PostgreSQLとの接続を切断 */
          st.close();
          con.close();
     }
}