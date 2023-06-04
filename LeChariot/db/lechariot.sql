drop database if exists lechariot; 

CREATE database lechariot; 

USE lechariot; 

create table utente(
	email varchar(45) not null,  
	nome varchar(15) not null,
	username varchar(20) unique not null, 
	datadinascita date not null, 
	cognome varchar(15) not null,
	password varchar(25) not null, 
	CAP bigint not null, 
    citta varchar(40) not null, 
	indirizzo varchar(45) not null, 
	isAdmin bool not null,
    corsista bool not null,
	primary key(email)
);

create table ordine( 
	numero int primary key, 
    uid varchar(45) not null,
    quantita int not null,
	totale double default 0.0,
    data date not null,
    prodotti varchar(400) not null,
    stato varchar(20) not null
);

create table corso (
	idcorso int primary key, 
    prezzo double not null, 
    nome varchar(40) unique, 
    descrizione varchar(300), 
    image varchar(200)
); 

create table certificazione(
	codicecer int not null, 
    user varchar(45) not null, 
    datarilascio date not null,
    corso int not null,
    primary key(codicecer),
    foreign key (corso) references corso(idcorso), 
    foreign key(user) references utente(email)
); 



create table prodottofisico (
	idpf int primary key,
    nome varchar(100) not null, 
	quantitaInmagazzino int not null,
	descrizione varchar(2000), 
    tipo varchar(45) not null,
    prezzo double not null,
    image varchar(200),
    image2 varchar(200), 
    image3 varchar(200), 
    image4 varchar(200), 
    image5 varchar(200)
); 

create table consulenza(
	id int primary key, 
	durata int not null, 
    nome varchar(40) not null, 
    prezzo double not null,
    descrizione varchar(300),
    image varchar(200)
); 

create table gestisce(
	utente varchar(45) not null, 
    corso int not null, 
	foreign key(corso) references corso(idcorso),
     foreign key(utente) references utente(email)
);

create table effettua(
	ordine int not null,
	utente varchar(45) not null, 
    foreign key(ordine) references ordine(numero), 
    foreign key(utente) references utente(email)
);
    
create table relativoA1(
	ordine int not null,
	prodottofisico int not null, 
    foreign key(prodottofisico) references prodottofisico(idpf),
    foreign key(ordine) references ordine(numero)
); 

create table relativoA2(
	ordine int not null,
    foreign key(ordine) references ordine(numero), 
    corso int not null, 
    foreign key(corso) references corso(idcorso)
); 

create table relativoA3(
	ordine int not null,
    foreign key(ordine) references ordine(numero), 
    consulenza int not null, 
    foreign key(consulenza) references consulenza(id)
); 

create table pagamento(
	ordine int not null,
    foreign key(ordine) references ordine(numero),
    carta bigint not null
);

