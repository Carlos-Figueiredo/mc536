package consultas;

import java.sql.*;

public class Queries {
    public static void main(String args[]){
            try {
            	Connection Conexao = Connect_DB.getConnection();
            	
            	java.sql.Statement Comando = Conexao.createStatement();
                
                Queries.query1(Comando);
                Queries.query2(Comando);
                Queries.query3(Comando);
                Queries.query4(Comando);
                Queries.query5(Comando);
                Comando.close();
                Conexao.close();

                } catch (Exception Excecao) {
                System.out.println("SQLException:" + Excecao.getLocalizedMessage());
                System.out.println("Problemas ao tentar conectar com o banco " + 
         "de dados: " + Excecao);
            }            
    }
    
    public static void query1(java.sql.Statement Comando) {
    	try{
	    	java.sql.ResultSet rsRegistro = Comando.executeQuery("SELECT Produto.nome, a.nome as Paises_Vendidos, b.nome as Paises_Fabricados FROM Produto JOIN Produto_has_Locais_Vendidos ON Produto.Cod_barras = Produto_has_Locais_Vendidos.Produto_Cod_barras JOIN Locais_Vendidos a ON Produto_has_Locais_Vendidos.Locais_Vendidos_idLocais_Vendidos = a.idLocais_Vendidos JOIN Produto_has_Locais_Fabricados ON Produto.Cod_barras = Produto_has_Locais_Fabricados.Produto_Cod_barras JOIN Locais_Fabricados b ON Produto_has_Locais_Fabricados.Locais_Fabricados_idLocais_Fabricados = b.idLocais_Fabricados"
	        		+ " ORDER BY a.Nome");
	    	System.out.println("\n");
	    	System.out.println("====================================================================================================================================================");
	    	System.out.println("====================================================================================================================================================");
	    	System.out.println("Lista de produtos, onde são fabricados e onde são vendidos, ordenados por onde são vendidos.");
	        while(rsRegistro.next()){
	            System.out.println("Nome: " +rsRegistro.getString("nome"));
	            System.out.println("Local Vendido: " +rsRegistro.getString("Paises_Vendidos"));
	            System.out.println("Local Fabricado: " +rsRegistro.getString("Paises_Fabricados"));
	            System.out.println("-------------------------------------------");
	        }
    	} catch (Exception Excecao) {
    		System.out.println("SQLException:" + Excecao.getLocalizedMessage());
            System.out.println("Problemas ao tentar executar consulta no banco " + 
            		"de dados: " + Excecao);
    	}
        
    }
    
    public static void query2(java.sql.Statement Comando) {
    	try{
	    	java.sql.ResultSet rsRegistro = Comando.executeQuery("SELECT Locais_Vendidos.nome, SUM(Produto.Calorias_100g) AS cal_total FROM Produto	JOIN Produto_has_Locais_Vendidos ON Produto_has_Locais_Vendidos.Produto_Cod_barras = Produto.Cod_barras	JOIN Locais_Vendidos ON Produto_has_Locais_Vendidos.Locais_Vendidos_idLocais_Vendidos = Locais_Vendidos.idLocais_Vendidos GROUP BY Locais_Vendidos.nome ORDER BY cal_total DESC;");
	    	System.out.println("\n");
	    	System.out.println("====================================================================================================================================================");
	    	System.out.println("====================================================================================================================================================");
	    	System.out.println("Lista de países que compram mais caloria (em ordem decrescente da quantidade de caloria comprada).");

	        while(rsRegistro.next()){
	            System.out.println("Nome do país: " +rsRegistro.getString("nome"));
	            System.out.println("Calorias Totais: " +rsRegistro.getString("cal_total"));
	            System.out.println("-------------------------------------------");
	        }
    	} catch (Exception Excecao) {
    		System.out.println("SQLException:" + Excecao.getLocalizedMessage());
            System.out.println("Problemas ao tentar executar consulta no banco " + 
            		"de dados: " + Excecao);
    	}
        
    }
    
    public static void query3(java.sql.Statement Comando) {
    	try{
	    	java.sql.ResultSet rsRegistro = Comando.executeQuery("SELECT AVG(pr.Quantidade), p.nome FROM Produto pr INNER JOIN Produto_has_Locais_Vendidos v ON pr.Cod_barras = v.Produto_Cod_barras INNER JOIN Locais_Vendidos p ON v.Locais_Vendidos_idLocais_Vendidos = p.idLocais_Vendidos GROUP BY p.nome ORDER BY AVG(pr.Quantidade) DESC;");
	    	System.out.println("\n");
	    	System.out.println("====================================================================================================================================================");
	    	System.out.println("====================================================================================================================================================");
	    	System.out.println("Resulta em uma tabela com os paises e a média da quantidade (em g ou ml) comprada por eles, ordenada de forma decrescente.");
	    	while(rsRegistro.next()){
	            System.out.println("Média de Quantidade: " +rsRegistro.getString("AVG(pr.Quantidade)"));
	            System.out.println("Nome do país: " +rsRegistro.getString("nome"));
	            System.out.println("-------------------------------------------");
	        }
    	} catch (Exception Excecao) {
    		System.out.println("SQLException:" + Excecao.getLocalizedMessage());
            System.out.println("Problemas ao tentar executar consulta no banco " + 
            		"de dados: " + Excecao);
    	}
        
    }
    
    public static void query4(java.sql.Statement Comando) {
    	try{
	    	java.sql.ResultSet rsRegistro = Comando.executeQuery("SELECT Fabricante.nome, COUNT(Produto.Cod_barras) as num_produto FROM Fabricante LEFT OUTER JOIN Produto ON Produto.IdFabricante = Fabricante.IdFabricante GROUP BY Fabricante.IdFabricante;");
	    	System.out.println("\n");
	    	System.out.println("====================================================================================================================================================");
	    	System.out.println("====================================================================================================================================================");
	    	System.out.println("Para todo fabricante, dá o número de produtos que ele possui.");
	    	while(rsRegistro.next()){
	            System.out.println("Fabricante: " +rsRegistro.getString("nome"));
	            System.out.println("Quantidade de produtos: " +rsRegistro.getString("num_produto"));
	            System.out.println("-------------------------------------------");
	        }
    	} catch (Exception Excecao) {
    		System.out.println("SQLException:" + Excecao.getLocalizedMessage());
            System.out.println("Problemas ao tentar executar consulta no banco " + 
            		"de dados: " + Excecao);
    	}
        
    }
    
    public static void query5(java.sql.Statement Comando) {
    	try{
	    	java.sql.ResultSet rsRegistro = Comando.executeQuery("SELECT Count(Produto_p.Proteinas_100g) AS Num_Produtos, Categoria.Nome as Categoria FROM (  SELECT Proteinas_100g, Cod_barras	FROM Produto WHERE Proteinas_100g >= 10) Produto_p INNER JOIN Categoria_has_Produto	on Produto_p.Cod_barras = Categoria_has_Produto.Produto_Cod_barras INNER JOIN Categoria	ON Categoria_has_Produto.idCategoria = Categoria.idCategoria GROUP BY Categoria_has_Produto.idCategoria;");
	    	System.out.println("\n");
	    	System.out.println("====================================================================================================================================================");
	    	System.out.println("====================================================================================================================================================");
	    	System.out.println("Dá o nome da categoria e o número de produtos com proteínas maior do que 10 para cada categoria.");
	    	while(rsRegistro.next()){
	            System.out.println("Quantidade de produtos: " +rsRegistro.getString("Num_Produtos"));
	            System.out.println("Categoria: " +rsRegistro.getString("Categoria"));
	            System.out.println("-------------------------------------------");
	        }
    	} catch (Exception Excecao) {
    		System.out.println("SQLException:" + Excecao.getLocalizedMessage());
            System.out.println("Problemas ao tentar executar consulta no banco " + 
            		"de dados: " + Excecao);
    	}
        
    }
}