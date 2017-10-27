package consultas;

import java.sql.*;

public class Queries {
    public static void main(String args[]){
            try {
                /*Class.forName("com.mysql.jdbc.Driver");
                String EnderecoDB = "jdbc:mysql://localhost:3306/agenda_enderecos";
                java.sql.Connection Conexao = DriverManager.getConnection(EnderecoDB,"root","Weak");*/
            	
            	Connection Conexao = Connect_DB.getConnection();
            	
                java.sql.Statement Comando = Conexao.createStatement();
                
                Query.query1();
                query2();
                Comando.close();
                Conexao.close();
                        
                } catch (Exception Excecao) {
                System.out.println("SQLException:" + Excecao.getLocalizedMessage());
                System.out.println("Problemas ao tentar conectar com o banco " + 
         "de dados: " + Excecao);
            }            
    }
    
    public static void query1() {
    	java.sql.ResultSet rsRegistro = Comando.executeQuery("SELECT Produto.nome, a.nome as Paises_Vendidos, b.nome as Paises_Fabricados FROM Produto JOIN Produto_has_Locais_Vendidos ON Produto.Cod_barras = Produto_has_Locais_Vendidos.Produto_Cod_barras JOIN Locais_Vendidos a ON Produto_has_Locais_Vendidos.Locais_Vendidos_idLocais_Vendidos = a.idLocais_Vendidos JOIN Produto_has_Locais_Fabricados ON Produto.Cod_barras = Produto_has_Locais_Fabricados.Produto_Cod_barras JOIN Locais_Fabricados b ON Produto_has_Locais_Fabricados.Locais_Fabricados_idLocais_Fabricados = b.idLocais_Fabricados"
        		+ " ORDER BY a.Nome;");
        
        while(rsRegistro.next()){
            System.out.println("Nome:" +rsRegistro.getString("nome"));
            System.out.println("Local Vendido:" +rsRegistro.getString("Paises_Vendidos"));
            System.out.println("Local Fabricado:" +rsRegistro.getString("Paises_Fabricados"));
            System.out.println("-------------------------------------------");
        }
    }
    
	public static void query2() {
	    	
	    }
	
	public static void query3() {
		
	}
	
	public static void query4() {
		
	}
}