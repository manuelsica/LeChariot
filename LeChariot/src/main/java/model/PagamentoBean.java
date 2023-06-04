package model;

public class PagamentoBean {
	int ordine;
	long carta;
	
	public PagamentoBean() {
		
	}
	
	public int getOrdine() {
		return ordine;
	}
	
	public long getCarta() {
		return carta;
	}
	
	public void setCarta(long c) {
		carta=c;
	}
	
	public void setOrdine(int c) {
		ordine=c;
	}
	
}
