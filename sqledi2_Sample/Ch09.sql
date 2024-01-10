javaクラスの実行について

-cpオプションでクラスを定義したclass or jarファイルのフォルダを指定
この時、実行するクラスのファイルが存在するフォルダも指定する必要がある（この場合、カレントフォルダ）

java -cp C:\PostgreSQL\jdbc\*;. DBConnect1
java -cp C:\PostgreSQL\jdbc\*;. DBConnect2
java -cp C:\PostgreSQL\jdbc\*;. DBConnect3


9.1
