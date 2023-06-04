package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.DriverManagerConnectionPool;

public class RelativoA1DAO implements GenericDAO<RelativoA1Bean>{
private static final String TABLE_NAME="relativoA1"; 
	
	public RelativoA1Bean doRetriveByKey(Object code) throws SQLException {
		Integer num = (Integer) code; 
		Connection con=null; 
		PreparedStatement ps=null; 
		String query= "select * from "+RelativoA1DAO.TABLE_NAME+" where ordine=?";
		RelativoA1Bean b=new RelativoA1Bean(); 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(0, num);
			ResultSet rs= ps.executeQuery();
			
			while(rs.next()) {
				b.setOrdine(rs.getInt("ordine"));
				b.setProdottofisico(rs.getInt("prodottofisico")); 
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

	public ArrayList<RelativoA1Bean> doRetrieveAll(String order) throws SQLException {
		Connection con=null; 
		PreparedStatement ps=null; 
		ArrayList<RelativoA1Bean> ab= new ArrayList<RelativoA1Bean>(); 
		String query= "select * from "+RelativoA1DAO.TABLE_NAME+"order by ?";
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(0, order);
			ResultSet rs= ps.executeQuery();
			RelativoA1Bean b=new RelativoA1Bean(); 
			while(rs.next()) {
				b.setOrdine(rs.getInt("ordine"));
				b.setProdottofisico(rs.getInt("prodottofisico")); 				
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

	
	public void doSave(RelativoA1Bean dao) throws SQLException {
		String query="Insert into "+ RelativoA1DAO.TABLE_NAME+" values(?,?)"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		
		try {
			RelativoA1Bean b=new RelativoA1Bean(); 
			con= DriverManagerConnectionPool.getConnection();
			ps=con.prepareStatement(query);
			ps.setInt(0,b.getOrdine());
			ps.setInt(1,b.getProdottofisico()); 
			ps.execute();	
		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
	}

	public int doUpdate(RelativoA1Bean dao) throws SQLException {
		String query="update "+ RelativoA1DAO.TABLE_NAME+" set prodottoinmagazzino=? where ordine=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		int ctrl=0;
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(0, dao.getProdottofisico());
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
		String query="delete from "+ RelativoA1DAO.TABLE_NAME+" where ordine=?"; 
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
