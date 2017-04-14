/**
 * Created by YZH on 2017/4/13.
 */
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*;

public class ImportData {

    // 源数据文件列名称
    public enum COLUMN {
        Rk(0), Player(1), Season(2), Age(3), TeamAbbr(4), Lg(5), G(6), PTS(7), TeamSeason(8), TeamLg(9), TeamName(10), TeamCoaches(11), TeamFrom(12), TeamTo(13), TeamYrs(14), TeamG(15), TeamW(16), TeamL(17), TeamChamp(18), ArenaTeam(19), ArenaStartEnd(20), Arena(21), ArenaLocation(22), ArenaCapacity(23);
        private int index;
        COLUMN(int idx) {
            this.index = idx;
        }
        public int getIndex() {
            return index;
        }
    }

    public static void main(String[] args) {
        final String DRIVER_CLASS = "com.mysql.jdbc.Driver";

        // 配置
        final String dataBaseUrl = "jdbc:mysql://localhost:3306/nba_info";
        final String userName = "root";
        final String password = "";
        final String dataFilePath = "D://Java_Project/new_nba_info.txt";

        Connection connection = null;
        Statement stmt = null;
        BufferedReader br = null;
        String[] dataRow;
        String line;

        try {
            br = new BufferedReader(new FileReader(dataFilePath));

            Class.forName(DRIVER_CLASS);
            connection = DriverManager.getConnection(dataBaseUrl, userName, password);
            // System.out.println(connection.getClientInfo());

            stmt = connection.createStatement();
            StringBuilder sql = null;

            while ((line = br.readLine()) != null) {
                dataRow = line.split(",");

                //表Coach插入语句
                sql = new StringBuilder();
                sql.append("INSERT INTO COACH(COACHNAME,TEAMSEASON,TEAMNAME) VALUES('");
                sql.append(dataRow[COLUMN.TeamCoaches.getIndex()]);
                sql.append("', '");
                sql.append(dataRow[COLUMN.TeamSeason.getIndex()]);
                sql.append("', '");
                sql.append(dataRow[COLUMN.TeamName.getIndex()]);
                sql.append("')");
//                System.out.println("Coach:"+sql.toString());
                stmt.executeUpdate(sql.toString());

                //表Arena插入语句
                sql = new StringBuilder();
                sql.append("INSERT INTO ARENA(ARENATEAM,ARENASTARTEND,ARENA,ARENALOCATION,ARENACAPACITY) VALUES('");
                sql.append(dataRow[COLUMN.ArenaTeam.getIndex()]);
                sql.append("', '");
                sql.append(dataRow[COLUMN.ArenaStartEnd.getIndex()]);
                sql.append("', '");
                sql.append(dataRow[COLUMN.Arena.getIndex()]);
                sql.append("', '");
                sql.append(dataRow[COLUMN.ArenaLocation.getIndex()]);
                sql.append("', ");
                sql.append(dataRow[COLUMN.ArenaCapacity.getIndex()]);
                sql.append(")");
//                System.out.println("Arena:"+sql.toString());
                stmt.executeUpdate(sql.toString());

                // 表Team 的插入语句
                sql = new StringBuilder();
                sql.append("INSERT INTO TEAM(TEAMNAME,TEAMSEASON,TEAMABBR,TEAMFROM,TEAMTO,TEAMYRS,TEAMG,TEAMW,TEAML,TEAMCHAMP,TEAMCOACHES,ARENA) VALUES('");
                sql.append(dataRow[COLUMN.TeamName.getIndex()]);
                sql.append("', '");
                sql.append(dataRow[COLUMN.TeamSeason.getIndex()]);
                sql.append("', '");
                sql.append(dataRow[COLUMN.TeamAbbr.getIndex()]);
                sql.append("', ");
                sql.append(dataRow[COLUMN.TeamFrom.getIndex()]);
                sql.append(", ");
                sql.append(dataRow[COLUMN.TeamTo.getIndex()]);
                sql.append(", ");
                sql.append(dataRow[COLUMN.TeamYrs.getIndex()]);
                sql.append(", ");
                sql.append(dataRow[COLUMN.TeamG.getIndex()]);
                sql.append(", ");
                sql.append(dataRow[COLUMN.TeamW.getIndex()]);
                sql.append(", ");
                sql.append(dataRow[COLUMN.TeamL.getIndex()]);
                sql.append(", ");
                sql.append(dataRow[COLUMN.TeamChamp.getIndex()]);
                sql.append(", '");
                sql.append(dataRow[COLUMN.TeamCoaches.getIndex()]);
                sql.append("', '");
                sql.append(dataRow[COLUMN.Arena.getIndex()]);
                sql.append("')");
//                System.out.println("Team:"+sql.toString());
                stmt.executeUpdate(sql.toString());

                // 表Player 的插入语句
                sql = new StringBuilder();
                sql.append("INSERT INTO PLAYER(NAME,SEASON,AGE,PTS,G,LG,TeamName) VALUES('");
                sql.append(dataRow[COLUMN.Player.getIndex()]);
                sql.append("', '");
                sql.append(dataRow[COLUMN.Season.getIndex()]);
                sql.append("', ");
                sql.append(dataRow[COLUMN.Age.getIndex()]);
                sql.append(", ");
                sql.append(dataRow[COLUMN.PTS.getIndex()]);
                sql.append(", ");
                sql.append(dataRow[COLUMN.G.getIndex()]);
                sql.append(", '");
                sql.append(dataRow[COLUMN.Lg.getIndex()]);
                sql.append("', '");
                sql.append(dataRow[COLUMN.TeamName.getIndex()]);
                sql.append("')");
//                System.out.println("Player:"+sql.toString());
                stmt.executeUpdate(sql.toString());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null)
                    connection.close();
                if (br != null)
                    br.close();
                if (stmt != null)
                    stmt.close();

            } catch (SQLException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
