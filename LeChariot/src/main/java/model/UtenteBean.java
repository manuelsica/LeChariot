package model;

import java.io.Serializable;
import java.util.Date;

public class UtenteBean implements Serializable {
	private static final long serialVersionUID = 5920136045243291878L;	
	private String email; 
	private String nome; 
	private String username; 
	private Date datadinascita; 
	private String cognome; 
	private String password; 
	private long CAP; 
	private String citta; 
	private String indirizzo; 
	private boolean admin;
	private boolean corsista;
	
	public UtenteBean() {}; 
	
	public void setCorsista(boolean b) {
		corsista=b;
	}
	
	public boolean isCorsista() {
		return corsista;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getDatadinascita() {
		return datadinascita;
	}
	public void setDatadinascita(Date datadinascita) {
		this.datadinascita = datadinascita;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public long getCAP() {
		return CAP;
	}
	public void setCAP(long cAP) {
		CAP = cAP;
	}
	public String getCitta() {
		return citta;
	}
	public void setCitta(String citta) {
		this.citta = citta;
	}
	public String getIndirizzo() {
		return indirizzo;
	}
	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}
	public boolean isAdmin() {
		return admin;
	}
	public void setAdmin(boolean admin) {
		this.admin = admin;
	} 
	
	public boolean passControl(String s, String m) {
		if(s.equals(m)) return true;
		
		return false;
	}
	
	}
