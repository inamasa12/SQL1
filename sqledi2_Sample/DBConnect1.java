
import java.sql.*;

public class DBConnect1 {
     public static void main(String[] args) throws Exception {

          /* 1) PostgreSQLへの接続情報 */
          Connection con; 
          Statement st;
          ResultSet rs;

          String url = "jdbc:postgresql://localhost:5432/postgres";
          String user = "postgres";
          String password = "yomasa75"; 

          /* 2) JDBCドライバの定義 */
          Class.forName("org.postgresql.Driver");

          /* 3) PostgreSQLへの接続 */
          con = DriverManager.getConnection(url, user, password);
          st = con.createStatement();

          /* 4) SELECT文の実行 */
          rs = st.executeQuery("SELECT 1 AS col_1");

          /* 5) 結果の画面表示 */
          rs.next(); 
          System.out.print(rs.getInt("col_1"));

          /* 6) PostgreSQLとの接続を切断 */
          rs.close(); 
          st.close();
          con.close();
     }
}