package model;

import java.io.Serializable;

public class CorsoBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private int idcorso;
	private double prezzo; 
    private String nome; 
    private String descrizione; 
    private String img;
    
    public CorsoBean() {}
    
    
    public String getImg() {
    	return img;
    }
    
    public void setImg(String i) {
    	img=i;
    }

	public int getIdcorso() {
		return idcorso;
	}

	public void setIdcorso(int idcorso) {
		this.idcorso = idcorso;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}


}
