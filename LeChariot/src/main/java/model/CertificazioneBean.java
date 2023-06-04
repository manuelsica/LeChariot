package model;

import java.io.Serializable;
import java.util.Date;

public class CertificazioneBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private int codicecer;
    private String user;
    private Date datarilascio;
    private int corso;
    
    public CertificazioneBean() {}

	public int getCodicecer() {
		return codicecer;
	}

	public void setCodicecer(int codicecer) {
		this.codicecer = codicecer;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public Date getDatarilascio() {
		return datarilascio;
	}

	public void setDatarilascio(Date datarilascio) {
		this.datarilascio = datarilascio;
	}

	public int getCorso() {
		return corso;
	}

	public void setCorso(int corso) {
		this.corso = corso;
	}; 
    
    
}
