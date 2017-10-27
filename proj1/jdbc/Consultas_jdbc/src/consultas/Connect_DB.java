package consultas;

import java.sql.*;
import javax.swing.JOptionPane;

public class Connect_DB {
	public static Connection getConnection() {  
        String EnderecoDB = "jdbc:mysql://sql.lab.ic.unicamp.br:3306/db_ra169767";
        String usuario = "ra169767";  
        String senha = "aiQu2id6";
        java.sql.Connection Conexao = null;
        
          try {   
              Class.forName("com.mysql.jdbc.Driver");//Altere o Driver caso não seja o MySQL   
              Conexao = DriverManager.getConnection(EnderecoDB,usuario,senha);
              return  Conexao; 
          } catch (Exception e) {   
                 JOptionPane.showMessageDialog(null, e, "ERRO", JOptionPane.ERROR_MESSAGE);    
          }  
         return  Conexao;       
    }   
}

