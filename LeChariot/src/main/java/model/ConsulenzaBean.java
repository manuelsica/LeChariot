package model;

import java.io.Serializable;

public class ConsulenzaBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private int id; 
	private int durata; 
	private String desc;
    private String nome; 
    private String img;
    private double prezzo;
    
    public String getImg() {
    	return img;
    }
    
    public void setImg(String im) {
    	img=im;
    }
    
    public ConsulenzaBean() {}
    
    public String getDesc() {
    	return desc;
    }
    
    public void setDesc(String d) {
    	desc=d;
    }
    
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDurata() {
		return durata;
	}

	public void setDurata(int durata) {
		this.durata = durata;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}; 
    
    
}
