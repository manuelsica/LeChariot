package model;

import java.io.Serializable;

public class ProdottoFisicoBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private int idpf; 
    private String nome; 
	private int quantitaInmagazzino;
	private double prezzo;
	private String tipo;
	private String descrizione;
    private String image; 
    private String image2;
    private String image3;
    private String image4;
    private String image5;
    private int quantita;
    
    public int getQuantita() {
    	return quantita;
    }
    
    public void setQuantita(int q) {
    	quantita=q;
    }
    
    public double getPrezzo() {
    	return prezzo;
    }
    
    public void setPrezzo(double p) {
    	prezzo=p;
    }
    
    public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getImage3() {
		return image3;
	}

	public void setImage3(String image3) {
		this.image3 = image3;
	}

	public String getImage4() {
		return image4;
	}

	public void setImage4(String image4) {
		this.image4 = image4;
	}

	public String getImage5() {
		return image5;
	}

	public void setImage5(String image5) {
		this.image5 = image5;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public ProdottoFisicoBean() {
    }

	public int getIdpf() {
		return idpf;
	}

	public void setIdpf(int idpf) {
		this.idpf = idpf;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getQuantitaInmagazzino() {
		return quantitaInmagazzino;
	}

	public void setQuantitaInmagazzino(int quantitaInmagazzino) {
		this.quantitaInmagazzino = quantitaInmagazzino;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
    
}
