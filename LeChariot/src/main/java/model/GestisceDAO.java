package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.DriverManagerConnectionPool;

public class GestisceDAO implements GenericDAO<GestisceBean>{
private static final String TABLE_NAME="gestisce"; 
	
	public GestisceBean doRetriveByKey(Object code) throws SQLException {
		String email= (String) code; 
		Connection con=null; 
		PreparedStatement ps=null; 
		String query= "select * from "+GestisceDAO.TABLE_NAME+" where email=?";
		GestisceBean b=new GestisceBean(); 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(0, email);
			ResultSet rs= ps.executeQuery();
			
			while(rs.next()) {
				b.setCorso(rs.getInt("corso"));
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

	public ArrayList<GestisceBean> doRetrieveAll(String order) throws SQLException {
		Connection con=null; 
		PreparedStatement ps=null; 
		ArrayList<GestisceBean> ab= new ArrayList<GestisceBean>(); 
		String query= "select * from "+GestisceDAO.TABLE_NAME+"order by ?";
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(0, order);
			ResultSet rs= ps.executeQuery();
			GestisceBean b=new GestisceBean(); 
			while(rs.next()) {
				b.setCorso(rs.getInt("corso"));
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

	public void doSave(GestisceBean dao) throws SQLException {
		String query="Insert into "+ GestisceDAO.TABLE_NAME+" values(?,?)"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(1, dao.getCorso());
			ps.setString(0, dao.getUtente());
			ps.execute();
		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
		
	}

	public int doUpdate(GestisceBean dao) throws SQLException {
		String query="update "+ GestisceDAO.TABLE_NAME+" set utente=? where ordine=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		int ctrl=0;
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(0, dao.getUtente());
			ps.setInt(1, dao.getCorso());
			
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
		String query="delete from "+ GestisceDAO.TABLE_NAME+" where email=?"; 
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
