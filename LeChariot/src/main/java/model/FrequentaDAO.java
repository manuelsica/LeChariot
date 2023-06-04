package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.DriverManagerConnectionPool;

public class FrequentaDAO{
	//prendi solo la funzione e mettila nel DAO dei corsi
	public ArrayList<Integer> frequenta(String email) throws SQLException{
		 ArrayList<Integer> corsi= new ArrayList<Integer>(); 
		 String query="select corso from ordine, relativoA2, effettua where effettua.utente=? and relativoA2.ordine=ordine.numero and effettua.ordine=relativoA2.ordine;"; 
		 Connection con=null; 
		 PreparedStatement ps=null; 
		 
		 try {
				con= DriverManagerConnectionPool.getConnection(); 
				
				ps=con.prepareStatement(query); 
				ps.setString(1, email);
				
				ps.execute();
				ResultSet rs= ps.executeQuery(); 
				while(rs.next()) {
					corsi.add(rs.getInt("corso")); 
					}
				rs.close();
			}finally {
				try {
					if(ps!=null) ps.close(); 
				}finally {
					DriverManagerConnectionPool.releaseConnection(con);
					
				}
		 
			}
		 return corsi;
	}
	
}
	