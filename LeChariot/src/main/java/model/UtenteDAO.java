package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import model.UtenteBean;
import connection.DriverManagerConnectionPool;

public class UtenteDAO implements GenericDAO<UtenteBean>{
	private static final String TABLE_NAME="utente"; 
	
	public UtenteBean doRetriveByKey(Object code) throws SQLException {
		String email= (String) code; 
		Connection con=null; 
		PreparedStatement ps=null; 
		String query= "select * from "+UtenteDAO.TABLE_NAME+" where email=?";
		UtenteBean b=new UtenteBean(); 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(0, email);
			ResultSet rs= ps.executeQuery();
			
			while(rs.next()) {
				b.setEmail(rs.getString("email")); 
				b.setNome(rs.getString("nome")); 
				b.setUsername(rs.getString("username"));
				b.setDatadinascita(new java.util.Date(rs.getDate("datadinascita").getTime()));
				b.setCognome(rs.getString("cognome")); 
				b.setCAP(rs.getLong("CAP"));
				b.setCitta(rs.getString("citta")); 
				b.setIndirizzo(rs.getString("indirizzo")); 
				b.setAdmin(rs.getBoolean("isAdmin"));
				b.setPassword(rs.getString("password"));
				b.setCorsista(rs.getBoolean("corsista"));
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

	public ArrayList<UtenteBean> doRetrieveAll(String order) throws SQLException {
		Connection con=null; 
		PreparedStatement ps=null; 
		ArrayList<UtenteBean> ab= new ArrayList<UtenteBean>(); 
		String query= "select * from "+UtenteDAO.TABLE_NAME+"order by ?";
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(0, order);
			ResultSet rs= ps.executeQuery();
			UtenteBean b=new UtenteBean(); 
			while(rs.next()) {
				b.setEmail(rs.getString("email")); 
				b.setNome(rs.getString("nome")); 
				b.setUsername(rs.getString("username"));
				b.setDatadinascita(new java.util.Date(rs.getDate("datadinascita").getTime()));
				b.setCognome(rs.getString("cognome")); 
				b.setCAP(rs.getLong("CAP"));
				b.setCitta(rs.getString("citta")); 
				b.setIndirizzo(rs.getString("indirizzo")); 
				b.setAdmin(rs.getBoolean("isAdmin"));
				b.setPassword(rs.getString("password"));
				b.setCorsista(rs.getBoolean("corsista"));
				
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

	
	public void doSave(UtenteBean dao) throws SQLException {
		String query="insert into utente values(?,?,?,?,?,?,?,?,?,?,?);";

		Connection con=null; 
		PreparedStatement ps=null; 
		
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(1, dao.getEmail());
			ps.setString(2, dao.getNome());
			ps.setString(3, dao.getUsername()); 
			ps.setDate(4, new java.sql.Date(dao.getDatadinascita().getTime()));
			ps.setString(5, dao.getCognome());
			ps.setString(6, dao.getPassword());
			ps.setLong(7, dao.getCAP());
			ps.setString(8, dao.getCitta());
			ps.setString(9, dao.getIndirizzo());
			ps.setBoolean(10, false);
			ps.setBoolean(11, false);
			
			
			ps.executeUpdate();
			
			
		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
	}

	public int doUpdate(UtenteBean dao) throws SQLException {
		String query="update "+ UtenteDAO.TABLE_NAME+" set password=? where email=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		int ctrl=0;
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(0, dao.getEmail());
			ps.setString(1, dao.getPassword());
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
		String query="delete from "+ UtenteDAO.TABLE_NAME+" where email=?"; 
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


	public UtenteBean login(String email, String password) {
		UtenteBean utente=null;
		PreparedStatement pst;
		ResultSet rs;
		Connection con=null; 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			String query= "select * from utente where email=? and password=?";
			pst= con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2,password);
			rs= pst.executeQuery();
			if(rs.next()) {
				utente = new UtenteBean();
				utente.setEmail(rs.getString("email")); 
				utente.setNome(rs.getString("nome")); 
				utente.setUsername(rs.getString("username"));
				utente.setDatadinascita(new java.util.Date(rs.getDate("datadinascita").getTime()));
				utente.setCognome(rs.getString("cognome")); 
				utente.setCAP(rs.getLong("CAP"));
				utente.setCitta(rs.getString("citta")); 
				utente.setIndirizzo(rs.getString("indirizzo")); 
				utente.setAdmin(rs.getBoolean("isAdmin"));
				utente.setPassword(rs.getString("password"));
				utente.setCorsista(rs.getBoolean("corsista"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return utente;
	}
	
////////////////////////////////////////////////////////////////////////////////////////////7
	public void ModifyNome(String id, String nome) throws SQLException {
		String query="update "+ UtenteDAO.TABLE_NAME+" set nome=? where email=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(2, id);
			ps.setString(1, nome);
			ps.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void ModifyCognome(String id, String nome) throws SQLException {
		String query="update "+ UtenteDAO.TABLE_NAME+" set cognome=? where email=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(2, id);
			ps.setString(1, nome);
			ps.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void ModifyIndirizzo(String id, String nome) throws SQLException {
		String query="update "+ UtenteDAO.TABLE_NAME+" set indirizzo=? where email=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(2, id);
			ps.setString(1, nome);
			ps.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void ModifyCitta(String id, String nome) throws SQLException {
		String query="update "+ UtenteDAO.TABLE_NAME+" set citta=? where email=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(2, id);
			ps.setString(1, nome);
			ps.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void ModifyCAP(String id, int cap) throws SQLException {
		String query="update "+ UtenteDAO.TABLE_NAME+" set cap=? where email=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(2, id);
			ps.setInt(1, cap);
			ps.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void ModifyBday(String id, Date nome) throws SQLException {
		String query="update "+ UtenteDAO.TABLE_NAME+" set datadinascita=? where email=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(2, id);
			ps.setDate(1, new java.sql.Date(nome.getTime()));
			ps.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void ModifyCorsista(String email, boolean corsista) throws SQLException{
		String query="update "+ UtenteDAO.TABLE_NAME+" set corsista=? where email=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(2, email);
			ps.setBoolean(1, corsista);
			ps.execute();
		}finally {
			try {
				if(ps!=null) ps.close(); 
			}finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
		
	}
	
	public void ModifyPassword(String email, String password) throws SQLException {
		String query="update "+ UtenteDAO.TABLE_NAME+" set password=? where email=?"; 
		Connection con=null; 
		PreparedStatement ps=null; 
		
		try {
			con= DriverManagerConnectionPool.getConnection(); 
			
			ps=con.prepareStatement(query); 
			ps.setString(2, email);
			ps.setString(1, password);
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
