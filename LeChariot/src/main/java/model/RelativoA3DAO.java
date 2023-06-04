package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.DriverManagerConnectionPool;

public class RelativoA3DAO implements GenericDAO<RelativoA3Bean>{
private static final String TABLE_NAME="relativoA3"; 
	
	public RelativoA3Bean doRetriveByKey(Object code) throws SQLException {
		Integer cod= (Integer) code; 
		Connection con=null; 
		PreparedStatement ps=null; 
		String query= "select * from "+RelativoA3DAO.TABLE_NAME+" where ordine=?";
		RelativoA3Bean b=new RelativoA3Bean(); 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(0, cod);
			ResultSet rs= ps.executeQuery();
			
			while(rs.next()) {
				b.setConsulenza(rs.getInt("consulenza"));
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

	public ArrayList<RelativoA3Bean> doRetrieveAll(String order) throws SQLException {
		Connection con=null; 
		PreparedStatement ps=null; 
		ArrayList<RelativoA3Bean> ab= new ArrayList<RelativoA3Bean>(); 
		String query= "select * from "+RelativoA3DAO.TABLE_NAME+"order by ?";
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(0, order);
			ResultSet rs= ps.executeQuery();
			RelativoA3Bean b=new RelativoA3Bean(); 
			while(rs.next()) {
				b.setConsulenza(rs.getInt("consulenza"));
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

	
	public void doSave(RelativoA3Bean dao) throws SQLException {
		String query="Insert into "+ RelativoA3DAO.TABLE_NAME+" values(?,?)"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(0, dao.getOrdine());
			ps.setInt(1, dao.getConsulenza());	
			
			ps.execute();
			
			
		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
	}

	public int doUpdate(RelativoA3Bean dao) throws SQLException {
		String query="update "+ RelativoA3DAO.TABLE_NAME+" set consulenza=? where ordine=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		int ctrl=0;
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(1, dao.getOrdine());
			ps.setInt(0, dao.getConsulenza());	
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
		String query="delete from "+ RelativoA3DAO.TABLE_NAME+" where email=?"; 
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

}
