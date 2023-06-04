package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.DriverManagerConnectionPool;

public class EffettuaDAO implements GenericDAO<EffettuaBean>{
	private static final String TABLE_NAME="effettua"; 
	
	public EffettuaBean doRetriveByKey(Object code) throws SQLException {
		String email= (String) code; 
		Connection con=null; 
		PreparedStatement ps=null; 
		String query= "select * from "+EffettuaDAO.TABLE_NAME+" where email=?";
		EffettuaBean b=new EffettuaBean(); 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(0, email);
			ResultSet rs= ps.executeQuery();
			
			while(rs.next()) {
				b.setOrdine(rs.getInt("ordine"));
				b.setUtente(rs.getString("utente")); 
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

	public ArrayList<EffettuaBean> doRetrieveAll(String order) throws SQLException {
		Connection con=null; 
		PreparedStatement ps=null; 
		ArrayList<EffettuaBean> ab= new ArrayList<EffettuaBean>(); 
		String query= "select * from "+EffettuaDAO.TABLE_NAME+"order by ?";
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(0, order);
			ResultSet rs= ps.executeQuery();
			EffettuaBean b=new EffettuaBean(); 
			while(rs.next()) {
				b.setOrdine(rs.getInt("ordine"));
				b.setUtente(rs.getString("utente")); 
				
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

	public void doSave(EffettuaBean dao) throws SQLException {
		String query="Insert into "+ EffettuaDAO.TABLE_NAME+" values(?,?)"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(1, dao.getOrdine());
			ps.setString(2, dao.getUtente());
			ps.execute();
		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
		
	}

	public int doUpdate(EffettuaBean dao) throws SQLException {
		String query="update "+ EffettuaDAO.TABLE_NAME+" set utente=? where ordine=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		int ctrl=0;
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(0, dao.getUtente());
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
		String email= (String) code; 
		String query="delete from "+ EffettuaDAO.TABLE_NAME+" where email=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		boolean ctrl=false; 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 		
			ps=con.prepareStatement(query); 
			ps.setString(0, email);	
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
}


