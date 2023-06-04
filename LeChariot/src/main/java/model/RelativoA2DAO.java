package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.DriverManagerConnectionPool;

public class RelativoA2DAO implements GenericDAO<RelativoA2Bean>{
private static final String TABLE_NAME="relativoA2"; 
	
	public RelativoA2Bean doRetriveByKey(Object code) throws SQLException {
		Integer cod= (Integer) code; 
		Connection con=null; 
		PreparedStatement ps=null; 
		String query= "select * from "+RelativoA2DAO.TABLE_NAME+" where ordine=?";
		RelativoA2Bean b=new RelativoA2Bean(); 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(0, cod);
			ResultSet rs= ps.executeQuery();
			
			while(rs.next()) {
				b.setCorso(rs.getInt("corso"));
				b.setOrdine(rs.getInt("ordine"));
				}
			rs.close();
		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
				
		}
		return b;
	}

	public ArrayList<RelativoA2Bean> doRetrieveAll(String order) throws SQLException {
		Connection con=null; 
		PreparedStatement ps=null; 
		ArrayList<RelativoA2Bean> ab= new ArrayList<RelativoA2Bean>(); 
		String query= "select * from "+RelativoA2DAO.TABLE_NAME+"order by ?";
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(0, order);
			ResultSet rs= ps.executeQuery();
			RelativoA2Bean b=new RelativoA2Bean(); 
			while(rs.next()) {
				b.setCorso(rs.getInt("corso"));
				b.setOrdine(rs.getInt("ordine"));
				ab.add(b);
				}
			rs.close();
		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
				
		}
		return ab;
	}

	
	public void doSave(RelativoA2Bean dao) throws SQLException {
		String query="Insert into "+ RelativoA2DAO.TABLE_NAME+" values(?,?)"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(1,dao.getOrdine()); 	
			ps.setInt(2, dao.getCorso());
			ps.execute();
			
			
		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
	}

	public int doUpdate(RelativoA2Bean dao) throws SQLException {
		String query="update "+ RelativoA2DAO.TABLE_NAME+" set corso=? where ordine=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		int ctrl=0;
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(0, dao.getCorso());
			ps.setInt(1, dao.getOrdine());
			ps.execute();
			ctrl=1; 
		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
		
		return ctrl;
	}


	public boolean doDelete(Object code) throws SQLException {
		Integer cod= (Integer) code;  
		String query="delete from "+ RelativoA2DAO.TABLE_NAME+" where ordine=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		boolean ctrl=false; 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 		
			ps=con.prepareStatement(query); 
			ps.setInt(0, cod);	
			ps.execute();
			ctrl=true; 
		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
		return ctrl;
	}
	
	public void doSave(int numero, int corso) throws SQLException {
		String query="Insert into "+ RelativoA2DAO.TABLE_NAME+" values(?,?)"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(1, numero); 	
			ps.setInt(2, corso);
			ps.execute();
			
			
		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
	}

}
