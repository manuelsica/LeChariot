package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.DriverManagerConnectionPool;

public class CorsoDAO implements GenericDAO<CorsoBean>{
	private static final String TABLE_NAME="corso"; 
	
	public CorsoBean doRetriveByKey(Object code) throws SQLException {
		Integer idcorso= (Integer) code; 
		Connection con=null; 
		PreparedStatement ps=null; 
		String query= "select * from "+CorsoDAO.TABLE_NAME+" where idcorso=?";
		CorsoBean b=new CorsoBean(); 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(1, idcorso);
			ResultSet rs= ps.executeQuery();
			
			while(rs.next()) {
				b.setIdcorso(rs.getInt("idcorso"));
				b.setPrezzo(rs.getDouble("prezzo"));
				b.setDescrizione(rs.getString("descrizione"));
				b.setNome(rs.getString("nome")); 
				b.setImg(rs.getString("image"));
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

	public ArrayList<CorsoBean> doRetrieveAll(String order) throws SQLException {
		Connection con=null; 
		PreparedStatement ps=null; 
		ArrayList<CorsoBean> ab= new ArrayList<CorsoBean>(); 
		String query= "select * from "+CorsoDAO.TABLE_NAME+"order by ?";
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(0, order);
			ResultSet rs= ps.executeQuery();
			CorsoBean b=new CorsoBean(); 
			while(rs.next()) {
				b.setIdcorso(rs.getInt("idcorso"));
				b.setPrezzo(rs.getDouble("prezzo"));
				b.setDescrizione(rs.getString("descrizione"));
				b.setNome(rs.getString("nome")); 
				b.setImg(rs.getString("image"));
				
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

	public void doSave(CorsoBean dao) throws SQLException {
		String query="Insert into "+ CorsoDAO.TABLE_NAME+" values(?,?,?,?,?)"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setInt(0, dao.getIdcorso());
			ps.setDouble(1, dao.getPrezzo());
			ps.setString(2, dao.getNome()); 
			ps.setString(3, dao.getDescrizione());
			ps.setString(4, dao.getImg());
			
			ps.execute();
		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
		
	}

	public int doUpdate(CorsoBean dao) throws SQLException {
		String query="update "+ CorsoDAO.TABLE_NAME+" set prezzo=? where idcorso=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		int ctrl=0;
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setDouble(0, dao.getPrezzo());
			ps.setInt(1, dao.getIdcorso());
			
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
		Integer idcorso= (Integer) code; 
		String query="delete from "+ CorsoDAO.TABLE_NAME+" where idcorso=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		boolean ctrl=false; 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 		
			ps=con.prepareStatement(query); 
			ps.setInt(1, idcorso);	
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
	
	public ArrayList<CorsoBean> getAllProducts(){
		ArrayList<CorsoBean> prd = new ArrayList<CorsoBean>();
		String query=null;
		PreparedStatement pst= null;
		ResultSet rs=null;
		Connection con= null;
		
		try {
			con=DriverManagerConnectionPool.getConnection(); 	
			query= "select * from corso";
			pst=con.prepareStatement(query);
			rs= pst.executeQuery();
			while(rs.next()) {
				CorsoBean b= new CorsoBean();
				b.setIdcorso(rs.getInt("idcorso"));
				b.setPrezzo(rs.getDouble("prezzo"));
				b.setDescrizione(rs.getString("descrizione"));
				b.setNome(rs.getString("nome")); 
				b.setImg(rs.getString("image"));
				prd.add(b);				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return prd;
	}
 
	///////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public void ModifyPrezzo(int idcorso, double prezzo) throws SQLException {
		String query="update "+ CorsoDAO.TABLE_NAME+" set prezzo=? where idcorso=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setDouble(1, prezzo);
			ps.setInt(2, idcorso);
			
			ps.execute();
		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
	}
	
	public void ModifyNome(int idcorso, String nome) throws SQLException {
		String query="update "+ CorsoDAO.TABLE_NAME+" set nome=? where idcorso=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(1, nome);
			ps.setInt(2, idcorso);
			
			ps.execute();
		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
	}
	
	public void ModifyDescrizione(int idcorso, String descrizione) throws SQLException {
		String query="update "+ CorsoDAO.TABLE_NAME+" set descrizione=? where idcorso=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(1, descrizione);
			ps.setInt(2, idcorso);
			
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
