package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.DriverManagerConnectionPool;

public class CertificazioneDAO implements GenericDAO<CertificazioneBean>{
	private static final String TABLE_NAME="certificazione"; 
	
	public CertificazioneBean doRetriveByKey(Object code) throws SQLException {
		Integer codicecer= (Integer) code; 
		Connection con=null; 
		PreparedStatement ps=null; 
		String query= "select * from "+CertificazioneDAO.TABLE_NAME+" where idcorso=?";
		CertificazioneBean b=new CertificazioneBean(); 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(0, codicecer);
			ResultSet rs= ps.executeQuery();
			
			while(rs.next()) {
				b.setCodicecer(rs.getInt("codicecer")); 
				b.setCorso(rs.getInt("corso"));
				b.setDatarilascio(new java.util.Date(rs.getDate("datarilascio").getTime())); 
				b.setUser(rs.getString("user"));
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

	public ArrayList<CertificazioneBean> doRetrieveAll(String order) throws SQLException {
		Connection con=null; 
		PreparedStatement ps=null; 
		ArrayList<CertificazioneBean> ab= new ArrayList<CertificazioneBean>(); 
		String query= "select * from "+CertificazioneDAO.TABLE_NAME+"order by ?";
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(0, order);
			ResultSet rs= ps.executeQuery();
			CertificazioneBean b=new CertificazioneBean(); 
			while(rs.next()) {
				b.setCodicecer(rs.getInt("codicecer")); 
				b.setCorso(rs.getInt("corso"));
				b.setDatarilascio(new java.util.Date(rs.getDate("datarilascio").getTime())); 
				b.setUser(rs.getString("user"));
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

	
	public void doSave(CertificazioneBean dao) throws SQLException {
		String query="Insert into "+ CertificazioneDAO.TABLE_NAME+" values(?,?,?,?)"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(0, dao.getCodicecer());
			ps.setString(1, dao.getUser());
			ps.setDate(2, new java.sql.Date(dao.getDatarilascio().getTime())); 
			ps.setInt(3, dao.getCorso());
			
			ps.execute();
		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
		
	}

	public int doUpdate(CertificazioneBean dao) throws SQLException {
		String query="update "+ CertificazioneDAO.TABLE_NAME+" set corso=? where codicecer=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		int ctrl=0;
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(0, dao.getCodicecer());
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
		Integer codicecer= (Integer) code; 
		String query="delete from "+ CertificazioneDAO.TABLE_NAME+" where codicecer=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		boolean ctrl=false; 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 		
			ps=con.prepareStatement(query); 
			ps.setInt(0, codicecer);	
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
