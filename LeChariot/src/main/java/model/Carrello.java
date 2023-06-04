package model;
import java.util.ArrayList;
import java.util.Iterator;

public class Carrello {
	private ArrayList<ProdottoFisicoBean> pfisici;
	private ArrayList<CorsoBean> corsi;
	private ArrayList<ConsulenzaBean> cons;
	
	
	public Carrello() {
		pfisici= new ArrayList<ProdottoFisicoBean>();
		corsi= new ArrayList<CorsoBean>();
		cons= new ArrayList<ConsulenzaBean>();
	}
	
	public void aggiungiPF(ProdottoFisicoBean prodotto, int quantita) {
		for(ProdottoFisicoBean f: pfisici) {
			if(f.getIdpf()==(prodotto.getIdpf())) {
				f.setQuantita(f.getQuantita() +quantita);
				return;
			}
		}
		prodotto.setQuantita(quantita);
		pfisici.add(prodotto);
	}
	
	public void aggiungiCorso(CorsoBean prodotto) {
		for(CorsoBean f: corsi) {
			if(f.getIdcorso()==(prodotto.getIdcorso()))
			return;
		}
		
		corsi.add(prodotto);
	}
	
	public void aggiungiConsulenza(ConsulenzaBean prodotto) {
		for(ConsulenzaBean f: cons) {
			if(f.getId()==(prodotto.getId()))
			return;
		}
		
		cons.add(prodotto);
	}
	
	public void removePF(ProdottoFisicoBean prodotto) {
		pfisici.remove(prodotto);
	}
	
	public void removeCorso(CorsoBean prodotto) {
		corsi.remove(prodotto);
	}
	public void removeConsulenza(ConsulenzaBean prodotto) {
		cons.remove(prodotto);
	}
	
	public void clearAll() {
		pfisici.clear();
		corsi.clear();
		cons.clear();
	}
	
	public ArrayList<ProdottoFisicoBean> getPF(){
		return pfisici;
	}
	
	public ArrayList<CorsoBean> getCorsi(){
		return corsi;
	}
	
	public ArrayList<ConsulenzaBean> getCons(){
		return cons;
	}
	
	public double getTotal() {
		double fisici= 0.00;
		double cr=0.00;
		double c=0.00;
		
		
		for(ProdottoFisicoBean f : pfisici) {
			fisici+=f.getPrezzo()*f.getQuantita();
		}
		
		for(CorsoBean f : corsi) {
			cr+=f.getPrezzo();
		}
		
		for(ConsulenzaBean f : cons) {
			c+=f.getPrezzo();
		}
		
		return fisici+cr+c;
		
	}
	
	
	
	
}
