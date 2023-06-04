package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import connection.DriverManagerConnectionPool;

public class OrdineDAO implements GenericDAO<OrdineBean>{
	private static final String TABLE_NAME="ordine"; 

	public OrdineBean doRetriveByKey(Object code) throws SQLException {
		Integer numero= (Integer) code; 
		Connection con=null; 
		PreparedStatement ps=null; 
		String query= "select * from "+OrdineDAO.TABLE_NAME+" where numero=?";
		OrdineBean b=new OrdineBean(); 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(1, numero);
			ResultSet rs= ps.executeQuery();
			
			while(rs.next()) {
				b.setNumero(numero);
				b.setUid(rs.getString("uid"));
				b.setQuantita(rs.getInt("quantita"));
				b.setTotale(rs.getDouble("totale"));
				b.setDate(new java.util.Date(rs.getDate("data").getTime()));
				b.setProdotti(rs.getString("prodotti"));
				b.setStato(rs.getString("stato"));
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

	public ArrayList<OrdineBean> doRetrieveAll(String uid) throws SQLException {
		Connection con=null; 
		PreparedStatement ps=null; 
		ArrayList<OrdineBean> ab= new ArrayList<OrdineBean>(); 
		String query= "select * from ordine where uid = ?";
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(1, uid);
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				OrdineBean b=new OrdineBean(); 
				b.setUid(rs.getString("uid"));
				b.setNumero(rs.getInt("numero"));
				b.setTotale(rs.getDouble("totale"));
				b.setQuantita(rs.getInt("quantita"));
				b.setDate(new java.util.Date(rs.getDate("data").getTime()));
				b.setProdotti(rs.getString("prodotti"));
				b.setStato(rs.getString("stato"));
				ab.add(b);
				}
			rs.close();	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ab;
	}

	public void doSave(OrdineBean dao) throws SQLException {
		String query="Insert into "+ OrdineDAO.TABLE_NAME+" values(?,?,?,?,?,?,?)"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(1, dao.getNumero());
			ps.setString(2, dao.getUid());
			ps.setInt(3, dao.getQuantita());
			ps.setDouble(4, dao.getTotale());
			ps.setDate(5, new java.sql.Date(dao.getDate().getTime()));
			ps.setString(6, dao.getProdotti());
			ps.setString(7, dao.getStato());
			
			ps.execute();
		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
	}

	public int doUpdate(OrdineBean dao) throws SQLException {
		String query="update "+ OrdineDAO.TABLE_NAME+" set totale=? where numero=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		int ctrl=0;
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(1, dao.getNumero());
			ps.setString(2, dao.getUid());
			ps.setDouble(3, dao.getTotale());
			
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
		Integer numero= (Integer) code; 
		String query="delete from "+ OrdineDAO.TABLE_NAME+" where numero=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		boolean ctrl=false; 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 		
			ps=con.prepareStatement(query); 
			ps.setInt(0, numero);	
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
	
	public void updateStato(int id, String stato){
	
		String query="update ordine set stato=? where numero=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			ps=con.prepareStatement(query); 
			ps.setString(1, stato);
			ps.setInt(2, id);
			ps.executeUpdate();
			
			
	}catch(Exception e) {
		e.printStackTrace();
	}

}
	
	public ArrayList<OrdineBean> doRetrieveAll(){
		Connection con=null; 
		PreparedStatement ps=null; 
		ArrayList<OrdineBean> ab= new ArrayList<OrdineBean>(); 
		String query= "select * from ordine";
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				OrdineBean b=new OrdineBean(); 
				b.setUid(rs.getString("uid"));
				b.setNumero(rs.getInt("numero"));
				b.setTotale(rs.getDouble("totale"));
				b.setQuantita(rs.getInt("quantita"));
				b.setDate(new java.util.Date(rs.getDate("data").getTime()));
				b.setProdotti(rs.getString("prodotti"));
				b.setStato(rs.getString("stato"));
				ab.add(b);
				}
			rs.close();	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ab;
	}
	
	public ArrayList<OrdineBean> doRetrieveDate1(String date) throws SQLException{
		Connection con=null; 
		PreparedStatement ps=null; 
		ArrayList<OrdineBean> ab= new ArrayList<OrdineBean>(); 
		String query= "select * from ordine where data>? ";
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(1, date);
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				OrdineBean b=new OrdineBean(); 
				b.setUid(rs.getString("uid"));
				b.setNumero(rs.getInt("numero"));
				b.setTotale(rs.getDouble("totale"));
				b.setQuantita(rs.getInt("quantita"));
				b.setDate(new java.util.Date(rs.getDate("data").getTime()));
				b.setProdotti(rs.getString("prodotti"));
				b.setStato(rs.getString("stato"));
				ab.add(b);
				}
			rs.close();	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ab;
	}
	
	public ArrayList<OrdineBean> doRetrieveDate2(String date) throws SQLException{
		Connection con=null; 
		PreparedStatement ps=null; 
		ArrayList<OrdineBean> ab= new ArrayList<OrdineBean>(); 
		String query= "select * from ordine where data<? ";
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(1, date);
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				OrdineBean b=new OrdineBean(); 
				b.setUid(rs.getString("uid"));
				b.setNumero(rs.getInt("numero"));
				b.setTotale(rs.getDouble("totale"));
				b.setQuantita(rs.getInt("quantita"));
				b.setDate(new java.util.Date(rs.getDate("data").getTime()));
				b.setProdotti(rs.getString("prodotti"));
				b.setStato(rs.getString("stato"));
				ab.add(b);
				}
			rs.close();	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ab;
	}
	
}
