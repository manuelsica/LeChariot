use lechariot; 
/*
insert into utente(
	email,  
	nome,
	username,
	datadinascita, 
	cognome,
	password, 
	CAP, 
    citta, 
	indirizzo, 
	isAdmin
);*/

insert into utente
values(
                "nunziosabbatini@jourrapide.com",
                "Nunzio",
                "Ableave",
                19990331,
                "Sabatini",
                "Thee4Oof7u",
                17045,
                "Mallare",
                "Via Scala 59",
                false,
                false
);

insert into utente
values(
                "ivolombardi@armyspy.com",
                "Ivo",
                "Haping",
                20030507,
                "Lombardi",
                "ooNahcuu9",
                50030,
                "Traversa",
                "Via Nuova Agnano 115",
                false,
                true
);

insert into utente
values(
                "nereagenovesi@dayrep.com",
                "Nerea",
                "Knounte",
                20020310,
                "Genovesi",
                "iesu9ia9yah0S",
                81039,
                "Bonifica Villa Literno",
                "Via delle Mura Gianicolensi 32",
                false,
                false
);

insert into utente
values(
                "morgyespy@gmail.com",
                "Morgana",
                "Fluesen1998",
                19980627,
                "Esposito",
                "morgyespy",
                89129,
                "Reggio Calabria",
                "Via Giulio Camuzzoni 126",
                false,
                false
);

insert into utente
values(
                "danauzzi@gmail.com",
                "Loredana",
                "dorynemo",
                20041121,
                "Bertuzzi",
                "nemodory123",
                34132,
                "Trieste",
                "Via Bonafous Alfonso 123",
                false,
                true
);

insert into utente
values(
                "caterinadaloia@gmail.com",
                "Caterina",
                "caterydaloia",
                20010706,
                "D'Aloia",
                "daloia2001",
                10014,
                "Vallo di Diano",
                "Via Cono 33",
                true,
                false
);

insert into utente
values(
                "zhongli2001@gmail.com",
                "Ludovica",
                "ludogenovese",
                20010716,
                "Genovese",
                "ludogeno2001",
                84099,
                "San Cipriano Picentino",
                "Via Tubenna 33",
                true,
                false
);

insert into utente
values(
                "manuelito@gmail.com",
                "Manuel",
                "manusica",
                20010526,
                "Sica",
                "msica2001",
                84081,
                "Baronissi",
                "Via delle Ferrovie 26",
                true,
                false
);

/*
create table ordine( 
	numero int primary key, 
	totale double default 0.0,
    data date not null
);
*/
insert into ordine
values(
                001,
                "danauzzi@gmail.com",
                3,
                37.98,
                20221105,
                "Ametista, Acquamarina, Consulti Tarocchi - 25 min",
                "In Lavorazione"
);

insert into ordine
values(
                002,
                "nereagenovesi@dayrep.com",
                1,
                49.96,
                20220510,
                "Consulti Tarocchi - 50 min",
                "Spedito"
);

insert into ordine
values(
                003,
                "danauzzi@gmail.com",
                5,
                199.99,
                20220317,
				"Ametista, Opalite, Quarzo Rosa, Ciondolo avventurina, Studio degli Arcani Maggiori" ,
				"In Lavorazione"
);

insert into ordine
values(
                004,
                "morgyespy@gmail.com",
                4,
                249.99,
                20220620,
                "Agata Albicocca, Bracciale amazzonite con catena in oro 14kt, Bracciale tormalina nera grezza con catena in argento, Orecchini con quarzo rosa placcati oro 18kt",
                "Spedito"
);

insert into ordine
values(
                005,
                "ivolombardi@armyspy.com",
                2,
                99.99,
                20220625,
                "Quarzo Rosa, Studio degli Arcani Minori",
                "Spedito"
);

insert into ordine
values(
                006,
                "nunziosabbatini@jourrapide.com",
                1,
                24.99,
                20220103,
                "Bracciale in labradorite con catena in argento",
                "In lavorazione"
                
);

/*
create table corso (
	idcorso int primary key, 
    prezzo double not null, 
    nome varchar(40) unique, 
    descrizione varchar(200), 
    durata int not null
); 
*/
insert into corso
values(
        1001,
        199.99,
        "Studio degli Arcani Maggiori",
        "Corso di base per i tarologhi del futuro",
        "https://static.wixstatic.com/media/7f1d69_5e88e77d1c7b41798f96cdc4a9fb99d8~mv2.png/v1/fill/w_1080,h_1080,al_c/7f1d69_5e88e77d1c7b41798f96cdc4a9fb99d8~mv2.png"
);

insert into corso
values(
        1002,
        249.99,
        "Studio degli Arcani Minori",
        "Corso avanzato per i tarologhi del futuro",
        "https://static.wixstatic.com/media/7f1d69_32aa23149d7f464084473d500f18ad0a~mv2.png/v1/fill/w_1080,h_1080,al_c/7f1d69_32aa23149d7f464084473d500f18ad0a~mv2.png"
); 


insert into corso
values(
        1003,
        99.99,
        "Studio dei vari Metodi di Lettura",
        "Corso base/avanzato per i tarologhi del futuro",
        "https://www.tarocchi.blog/wp-content/uploads/2019/07/Quale-Metodo-Di-Lettura-Dei-Tarocchi-Uso-1-702x450.jpg"
        
); 

/*
create table certificazione(
	codicecer int not null, 
    user varchar(20) not null, 
    datarilascio date not null,
    corso int not null,
    primary key(codicecer),
    foreign key (corso) references corso(idcorso), 
    foreign key(user) references utente(email)
); 
*/
insert into certificazione
values(
                5000,
                "danauzzi@gmail.com",
                20220317,
                1001
);

insert into certificazione
values(
                5002,
                "danauzzi@gmail.com",
                20220620,
                1002
);

insert into certificazione
values(
                5003,
                "nunziosabbatini@jourrapide.com",
                20220625,
                1003
); 

/*
create table prodottofisico (
	idpf int primary key,
    nome varchar(20) unique not null, 
	quantitaInmagazzino int not null,
	tipo varchar(45) not null, 
	descrizione varchar(100), 
    prezzo double not null, 
    image varchar(200),
    image2 varchar(200), 
    image3 varchar(200), 
    image4 varchar(200), 
    image5 varchar(200)
); 
)*/
insert into prodottofisico
values(
        104,
        "Acquamarina",
        50,
        "L'acquamarina è un bilanciatore psico-fisico emozionale. Favorisce l’introspezione, la crescita interiore e la chiarezza mentale. Elimina la confusione, dona la forza di sistemare le cose lasciate in sospeso e aiuta ad abbandonare fobie e paure. Aiuta sciogliere la timidezza, invita all'autostima  e armonizza l'espressione creativa.L'acquamarina facilita il rilascio: ci ricorda di ""abbandonare"" il nostro attaccamento alle nostre creazioni, di non esserne ossessionati nella realtà presente. Quando liberiamo l'essenza di ciò che vogliamo creare l'Universo fornirà la forma perfetta per la sua manifestazione.L'acquamarina assicura benessere e successo. Produce un senso di leggerezza e di tranquillità, infonde fiducia e rende sinceri, dinamici e perseveranti. L'energia dell'acquamarina rivela l'insospettabile potere trasformatore dell'ottimismo e del sorriso, a conferma del fatto che il miglior talismano per la buona fortuna sia proprio una mente positiva.A livello generale è come un filtro che controlla un cattivo uso della parola come le critiche, le false testimonianze e altre espressioni erronee che avvelenano la mente e il corpo, impedendo all'uomo di vibrare positivamente per sintonizzarsi con le energie più elevate e benefiche e con il meglio di se stesso.È una pietra di pace, gioia e felicità, specialmente nelle relazioni perché sblocca la comunicazione e stimola a esprimere i propri sentimenti liberamente, consentendo una realizzazione completa di sé. È anche utile agli artisti e ai musicisti.",
       "Pietre", 
       5.99,
        "https://tinypic.host/images/2022/09/02/1.png",
        "https://tinypic.host/images/2022/09/02/1.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-10.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-12.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-11.png"

);

insert into prodottofisico
values(
        105,
        "Ametista",
        50,
        "L'ametista è rinomata per portare un senso di calma e chiarezza, promuove una profonda trasformazione e migliora la tua capacità di muoverti attraverso la vita da uno stato superiore dell'essere.
    Il significato dell'ametista è la guarigione spirituale, la calma e la saggezza. Approfondisce la tua connessione con te stesso e la tua capacità di attingere alla tua intuizione.
    Famoso per la sua associazione con il terzo occhio, le proprietà dei cristalli di ametista sono collegate al centro della spiritualità e dell'intuizione. È anche associato al chakra della corona, che governa la nostra connessione con l'universo.
    Coloro che tengono l'Ametista vicina si sentiranno confortati, radicati e leniti in modo edificante. La sua spiritualità divina ci ricorda di non temere l'ignoto.",
    "Pietre",
        5.99,
        "https://tinypic.host/images/2022/09/02/1-1.png",
        "https://tinypic.host/images/2022/09/02/1-1.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-15.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-14.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-13.png"
);

insert into prodottofisico
values(
        106,
        "Olivina",
        50,
        "L’olivina o peridoto svolge un’azione disintossicante e rivitalizzante, soprattutto sulla pelle.Agisce positivamente sulle ghiandole surrenali, sul fegato, sul pancreas e sulla milza. Stimola la funzionalità dei reni e del cuore, favorisce la circolazione del sangue, aiuta la rigenerazione dei tessuti e purifica l’energia. L’olivina ha un potere calmante sul sistema nervoso e riduce lo stress. Protegge lo stomaco e permette un migliore assorbimento dei cibi poiché agisce sul terzo chakra, che corrisponde alla volontà ma anche al nutrimento alimentare e spirituale. Inoltre è utile per alleviare i disturbi psicosomatici che hanno origine da forti stati ansiosi ed emotivi.",
        "Pietre",
        5.99,
        "https://tinypic.host/images/2022/09/02/Prodotto-2.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-2.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-24.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-23.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-22.png"
);

insert into prodottofisico
values(
        107,
        "Occhio della Tigre",
        50,
        "L'Occhio di Tigre ti aiuta a raggiungere i tuoi obiettivi, a riconoscere la tua forza interiore e ad avere chiarezza in quello che vuoi. Facilita la manifestazione dei tuoi desideri. Aumenta la creatività e la fiducia in te stesso. Grazie a questa pietra riconoscerai il tuo vero valore e i tuoi talenti. Portala sempre con te per una dose di autostima e buon umore!
    Chakra: Radice, Sacrale, Plesso Solare
    I cristalli non sono un sostituto dei tradizionali trattamenti medici.",
        "Pietre",
        5.99,
        "https://tinypic.host/images/2022/09/02/Prodotto-1.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-1.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-21.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-20.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-19.png"
);

insert into prodottofisico
values(
        108,
        "Malachite",
        50,
        "La malachite è una pietra femminea, in cristalloterapia è associata agli organi riproduttivi. E’ infatti guidata dall’elemento Terra, la grande madre. Può contribuire alla cura delle infezioni degli organi genitali e dei problemi di natura sessuale, allevia in caso di dolori mestruali, e può essere una pietra amica al momento del parto. Svolge un’azione disintossicante stimolando la funzionalità del fegato e promuove l’attività nervosa e cerebrale. Possiede la proprietà di assorbire dolori e gonfiori, soprattutto se abbinata all’ametista.  Rafforza il cuore e il sistema circolatorio, è particolarmente indicata per chi soffre di fragilità capillare. Per il suo alto contenuto di rame completa l’azione del ferro nella produzione dei globuli rossi e stimola la rigenerazione del sangue e dei tessuti.La malachite è considerata una pietra contro il malocchio, per chi crede a queste forze, diciamo che protegge dalle energie negative. Allontana da certi confronti inutili e rende meno suscettibile ai giudizi esterni. La malachite agisce come specchio del subconscio: riflette nella mente conscia ciò che si deve eliminare. E’ legato al chakra del Cuore, aumenta l’amore per la bellezza e la sete di conoscenza. Rende la vita intensa e avventurosa. Migliora l’espressione e la facoltà di comprensione, riduce la paura, la timidezza e allontana l’egoismo aiutando a entrare in contatto con gli altri a livello empatico. Sviluppa la capacità di osservazione, lo spirito critico e la vivacità di pensiero: il soggetto impara così a gestire in maniera più soddisfacente la realtà quotidiana.",
        "Pietre",
        5.99,
        "https://tinypic.host/images/2022/09/02/Prodotto.png",
        "https://tinypic.host/images/2022/09/02/Prodotto.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-18.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-17.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-16.png"
);


insert into prodottofisico
values(
        109,
        "Opalite",
        50,
        "Per molte persone che hanno difficoltà a distogliere la mente da argomenti troppo seri e profondi, l’Opalite ha significato per ricordare loro di divertirsi rimanendo allegri e spensierati. I due colori primari di questi Cristalli Azzurro e bianco, si uniscono per formare la sua lucentezza unica. Insieme rappresentano apertura, calma e purezza. Un altro buon motivo per indossare questa gemma è che possiede proprietà di talismano del potere personale, noto per avere come effetto quello di aumentare l’autostima. Insieme alle suddette qualità, la pietra può anche aiutare a liberare la forza interiore per esprimere e scoprire i tuoi sentimenti più profondi. Quando questa pietra è combinata con l’opale blu peruviano, aprirà il chakra del terzo occhio che è il chakra dell’intuizione, dell’intuizione e della visione. Quando viene posizionato sopra il chakra della corona, stimolerà le visioni, oltre a potenziare i nostri poteri psichici. Queste pietre sono essenziali anche per la comunicazione a livello spirituale.",
        "Pietre",
        5.99,
        "https://tinypic.host/images/2022/09/02/Prodotto-3.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-3.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-27.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-26.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-25.png"
);


insert into prodottofisico
values(
        110,
        "Quarzo Ialino",
        50,
        "Tra tutti i tipi di quarzo questo è il più potente amplificatore di guarigione ed energia del pianeta a causa della sua forma cristallina a spirale elicoidale unica. Il Quarzo ha proprietà di assorbire, immagazzinare, rilasciare e regolare l’energia ed è ottimo anche per sbloccarla. Migliora i test muscolari e protegge dalle radiazioni. Genera elettromagnetismo e dissipa l’elettricità statica. Purifica e migliora gli organi e i corpi sottili e agisce come un’anima profonda purifica, collegando la dimensione fisica con la mente. Funziona a tutti i livelli dell’essere. Aiuta la concentrazione e sblocca la memoria. È un grande risparmio energetico. È un maestro guaritore e può essere utilizzato per qualsiasi condizione. Stimola il sistema immunitario e porta il corpo dentro equilibrio. È ottimo per lenire le ustioni. Armonizza tutti i chakra allinea i corpi sottili.",
        "Pietre",
        5.99,
        "https://tinypic.host/images/2022/09/02/Prodotto-4.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-4.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-30.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-29.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-28.png"

);

insert into prodottofisico
values(
        111,
        "Quarzo Rosa",
        50,
        "Il quarzo rosa è una pietra che dona la calma mentale necessaria ad affrontare le sfide della vita e vivere con leggerezza. Puoi per esempio metterlo nell’ambiente di casa per rendere l’atmosfera più rilassata oppure puoi tenere un quarzo rosa come ciondolo per alleviare lo stress e l’ansia. Posizionate un piccolo quarzo rosa nella cameretta di un bambino, il più possibile vicino al letto, per allontanare gli incubi notturni. Considerata la pietra della calma, insegna a prendere il giusto tempo in ogni situazione, a non correre e si, prendersi anche il tempo per piangere un lutto. Ti aiuta a perdonare te stesso e gli altri perché diventi consapevole che errare è umano. Indossala se vuoi attirare nella tua vita l’entusiasmo, se vuoi scoprire l’amore per un vecchio o nuovo hobby. È importante coltivare le proprie passioni nella vita!",
        "Pietre",
        5.99,
        "https://tinypic.host/images/2022/09/02/Prodotto-5.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-5.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-33.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-32.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-31.png"
);

insert into prodottofisico
values(
        112,
        "Rubino",
        50,
        "Il rubino svolge un’azione benefica sulla milza e sulla circolazione sanguigna. Stimola il sistema immunitario e la digestione. Accelera il metabolismo e svolge un’azione disintossicante del sangue. È utile in una situazione di stanchezza cronica. Non va mai usata in caso di febbre e ipertensione in quanto è una pietra che dà calore.",
        "Pietre",
        5.99,
        "https://tinypic.host/images/2022/09/02/Prodotto-6.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-6.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-36.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-35.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-34.png"
);

insert into prodottofisico
values(
        113,
        "Smeraldo",
        50,
        "Lo smeraldo è simbolo di amore, prosperità e benessere. Stimola la crescita interiore, la sensibilità e il senso estetico. Promuove il desiderio di pace e armonia e favorisce l’amore e l’amicizia. Lo smeraldo ha un’azione calmante sulle preoccupazioni: aiuta a superare i momenti difficili e rafforza la gioia di vivere, genera ottimismo e vitalità. Permette di collaborare con gli altri facilitando la comprensione reciproca. Potenzia la memoria, la percezione e la creatività, dona estrema lucidità mentale e fa nascere nuove idee per lo sviluppo e la realizzazione della personalità attraverso l’immaginazione e i sogni. Lo smeraldo allevia la depressione e l’insonnia. Rende in grado di vedere se stessi con uno sguardo sincero e sereno superando la paura dei propri limiti.",
        "Pietre",
        5.99,
        "https://tinypic.host/images/2022/09/02/Prodotto-7.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-7.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-39.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-38.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-37.png"
);

insert into prodottofisico
values(
        114,
        "Pietra del Sole - SunStone",
        50,
        "In cristalloterapia la pietra del sole viene utilizzata per velocizzare il metabolismo e ristabilire una buona digestione. Ha un potere riequilibratore sui vari organi. Agisce nella zona della gola e dello stomaco, riduce la tensione. Aiuta a superare gli stati depressivi che colpiscono nei cambi di stagione.",
        "Pietre",
        5.99,
        "https://tinypic.host/images/2022/09/02/Prodotto-8.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-8.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-42.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-41.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-40.png"
);

insert into prodottofisico
values(
        115,
        "Zaffiro",
        50,
        "Lo zaffiro contrasta la tendenza alla dispersività, spingendo il soggetto a concentrarsi senza lasciarsi distrarre. Consente di analizzare con obiettività e razionalità la propria vita, di fare chiarezza e di focalizzare i cambiamenti necessari. Lo zaffiro simbolizza la comprensione reciproca, la lealtà e la fedeltà. Facilita la comunicazione, migliora la memoria e intensifica il desiderio di conoscenza. Lo zaffiro ha un effetto calmante e dona serenità e fiducia. Aiuta in caso di depressione, mitiga l’ansia e rafforza la determinazione e la forza di volontà, permettendo all’individuo di dedicarsi alla realizzazione dei suoi desideri.",
        "Pietre",
        5.99,
        "https://tinypic.host/images/2022/09/02/Prodotto-9.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-9.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-45.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-44.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-43.png"
);

insert into prodottofisico
values(
        116,
        "Corniola Burattato",
        50,
        "“Pietra delle emozioni” Rafforza la capacità di apprezzare il piacere. Utile nelle situazioni in cui vogliamo modulare l’attività del nostro secondo chakra, non solo stimolandola, ma anche riequilibrandone il flusso energetico. Aiuta nella comprensione del sé interiore, rafforza e motiva la concentrazione, aiuta a parlare in pubblico, aumentando la propria autostima. E’ una pietra di potere, può portare successo nella propria vita. Utile per contrastare i pensieri negativi e i dubbi.",
        "Pietre",
        5.99,
        "https://tinypic.host/images/2022/09/02/Prodotto-66.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-66.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-69.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-68.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-67.png"
);

insert into prodottofisico
values(
        117,
        "Corniola",
        50,
        "“Pietra delle emozioni” Rafforza la capacità di apprezzare il piacere. Utile nelle situazioni in cui vogliamo modulare l’attività del nostro secondo chakra, non solo stimolandola, ma anche riequilibrandone il flusso energetico. Aiuta nella comprensione del sé interiore, rafforza e motiva la concentrazione, aiuta a parlare in pubblico, aumentando la propria autostima. E’ una pietra di potere, può portare successo nella propria vita. Utile per contrastare i pensieri negativi e i dubbi.",
        "Pietre",
        5.99,
        "https://tinypic.host/images/2022/09/02/Prodotto-71.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-71.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-70.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-73.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-72.png"
);

insert into prodottofisico
values(
        118,
        "Apatite",
        50,
        "L'Apatite è la pietra della manifestazione. Aumenta la motivazione e allontana la negatività da sé stessi e dagli altri. L'Apatite aumenta la creatività e stimola l'intelletto. Elimina confusione e frustrazione, riducendo l'irritabilità e risvegliando il sé interiore. Espande la conoscenza e la verità e allevia il dolore, l'apatia e la rabbia.",
        "Pietre",
        5.99,
        "https://tinypic.host/images/2022/09/02/Prodotto-74.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-74.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-77.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-76.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-75.png"
);

insert into prodottofisico
values(
        119,
        "Lepidolite",
        50,
        "Calmante, stabilizzante, solleva la depressione e l'ansia
Pieno di litio che viene utilizzato in farmaceutica psichiatrica
Il miglior cristallo calmante per quando la vita è travolgente
Antidepressivo naturale
Tieniti vicino quando lo stress, l'ansia o la depressione cercano di prendere il sopravvento
Un promemoria che tutto va bene
Aiuta a far fronte alle battaglie quotidiane della vita
Elimina l'inquinamento elettromagnetico
Aiuta a stabilizzare i disturbi e i sentimenti bipolari",
        "Pietre",
        5.99,
        "https://tinypic.host/images/2022/09/02/Prodotto-78.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-78.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-81.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-80.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-79.png"
);

insert into prodottofisico
values(
        120,
        "Agata Albicocca",
        50,
        "L'Agata Albicocca è una pietra che dona forza e stabilità ed è una pietra protettiva. Si dice che l'Agata Albicocca rafforzi il legame tra genitori e figli. Può aiutare a calmare la mente, migliorare la memoria e la concentrazione. L'Agata Albicocca aiuta ad alleviare l'angoscia quando si vivono situazioni che non possiamo cambiare.",
        "Pietre",
        5.99,
        "https://tinypic.host/images/2022/09/02/Prodotto-82.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-82.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-85.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-84.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-83.png"
);

insert into prodottofisico
values(
        121,
        "Lapislazzuli Grezzi",
        50,
        "Pietra di protezione che può essere indossata per proteggersi dagli attacchi psichici, il lapislazzuli rilascia rapidamente lo stress, portando una pace profonda. Porta armonia e profonda conoscenza interiore di sé. Incoraggia l'autoconsapevolezza, consente l'espressione di sé e rivela la verità interiore, fornendo qualità di onestà, compassione e moralità alla personalità. Stimola l'obiettività, la chiarezza e incoraggia la creatività.",
        "Pietre",
        5.99,
        "https://tinypic.host/images/2022/09/02/Prodotto-86.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-86.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-89.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-88.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-87.png"
);

insert into prodottofisico
values(
        122,
        "Pietra di luna",
        50,
        "Si dice che la pietra di luna aiuti a ritrovare il sonno perduto. Protegge durante i viaggi, specialmente quelli che prevedono l’attraversamento delle acque o sono effettuati durante la notte. La sua luce riflessa rischiara i nostri pensieri, donandoci buoni consigli. Non solo, ha un forte potere equilibrante e calmante. Indossandola costantemente, aiuta a rendere più forte la personalità, a esprimersi con sicurezza invece che reprimere pensieri ed emozioni. Viene utilizzata da chi soffre di fame nervosa per separare il cibo dalla carenza emotiva. Non a caso la moonstone indaga che nel subconscio non vi siano modelli emotivi memorizzati, che impediscono di sviluppare pienamente il nostro potenziale. La donna che indossa l’adularia, stimola il suo lato intuitivo e chiaroveggente. Stimola l’energia della kundalini. Quando è l’uomo a indossarla, riuscirà a far emergere il suo lato più sensibille, entrando in sintonia con il suo lato femminile.",
        "Pietre",
        5.99,
        "https://tinypic.host/images/2022/09/02/Prodotto-90.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-90.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-93.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-92.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-91.png"
);

insert into prodottofisico
values(
        124,
        "Diaspro Rosso",
        50,
        "Il Diaspro Rosso porta alla luce i problemi prima che diventino troppo grandi ed aiuta ad avere intuizioni su come superare situazioni difficili. Ti sostiene e supporta durante periodi stressanti, portando tranquillità. Dona determinazione, coraggio e supporto nel caso di conflitti. Stimola l'immaginazione e trasforma le idee in azione.",
        "Pietre",
        5.99,
        "https://tinypic.host/images/2022/09/02/Prodotto---2022-09-02T172623.486.png",
        "https://tinypic.host/images/2022/09/02/Prodotto---2022-09-02T172623.486.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-100.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-99.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-98.png"
);

insert into prodottofisico
values(
        125,
        "Collana in quarzo rosa a goccia con catena in argento",
        100,
        "Questa bellissima collana di quarzo rosa a goccia è il modo perfetto per portare luce positiva, energia e amore a te stesso e a chi ti circonda. Completa le tue manifestazioni con questa collana per promuovere l'amor proprio, l'amicizia, la profonda guarigione interiore e i sentimenti di pace. Può sembrare semplice, ma ha un potere immenso.",
        "Accessori",
        25.99,
        "https://tinypic.host/images/2022/09/02/Prodotto---2022-09-02T180101.021.png",
        "https://tinypic.host/images/2022/09/02/Prodotto---2022-09-02T180101.021.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-1.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_1.png"
);

insert into prodottofisico
values(
        126,
        "Collana pendente lapislazzuli con catena in argento",
        100,
        "Pietra di saggezza, intuizione e verità, il lapislazzuli è un potente cristallo per chiunque cerchi di approfondire la propria connessione con il sé. Le proprietà del cristallo di lapislazzuli sono note per l'apertura del chakra del terzo occhio, il centro dell'intuizione e della saggezza interiore. Migliorando la tua capacità di rivolgerti verso l'interno e scoprire la tua verità, le proprietà curative dei cristalli di lapislazzuli possono supportare chiunque sia pronto a entrare nel proprio potere e nel sé autentico. Il significato del cristallo di lapislazzuli è associato alle proprietà dei cristalli indaco, che è strettamente connesso alla propria consapevolezza mentale e intuizione.",
        "Accessori",
        15.99,
        "https://tinypic.host/images/2022/09/02/Prodotto---2022-09-02T173329.388.png",
        "https://tinypic.host/images/2022/09/02/Prodotto---2022-09-02T173329.388.png",
        "https://tinypic.host/images/2022/09/02/Prodotto---2022-09-02T173432.400.png",
        "https://tinypic.host/images/2022/09/02/Prodotto---2022-09-02T173414.789.png",
        "https://tinypic.host/images/2022/09/02/Prodotto---2022-09-02T173353.693.png"
);

insert into prodottofisico
values(
        127,
        "Collana di cristallo esagonale di labradorite oro 14kt",
        100,
        "La Labradorite è una pietra di magia, che risveglia dentro di te abilità mistiche e magiche e poteri psichici. Ha al suo interno una risonanza profondamente sentita che è molto potente e può essere utilizzata per portare incredibili cambiamenti nella tua vita.
La labradorite è considerata dai mistici una pietra di trasformazione e magia. Si dice che pulisca, equilibri e protegga l'aura, oltre ad essere una pietra eccellente per la protezione generale.",
        "Accessori",
        20.99,
        "https://tinypic.host/images/2022/09/02/Prodotto_-10.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-10.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-13.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-12.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-11.png"
);

insert into prodottofisico
values(
        128,
        "Collana a disco turchese oro 14kt",
        100,
        "Il Turchese promuove l'autorealizzazione e aiuta la risoluzione creativa dei problemi. È un simbolo di amicizia e stimola l'amore romantico. Il turchese aiuta nell'assorbimento dei nutrienti, migliora il sistema immunitario, stimola la rigenerazione dei tessuti e guarisce tutto il corpo. Come pietra della pulizia, il turchese è particolarmente buono per liberare cattive abitudini ed energia negativa. Il turchese è anche una pietra calmante che può indurre serenità interna e sollevare gli spiriti impoveriti.",
        "Accessori",
        20.99,
        "https://tinypic.host/images/2022/09/02/Prodotto_-10.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-10.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-13.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-12.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-11.png"
);

insert into prodottofisico
values(
        129,
        "Collana di giada verde a goccia con catena in argento",
        100,
        "Questa bellissima collana a goccia di giada verde è il modo perfetto per portare abbondanza in buona salute e fortuna. Calma la tua mente e rilascia pensieri e tensioni negative. Completa le tue manifestazioni con questa collana per promuovere l'amor proprio, l'amicizia, la serenità e la purezza. È piccolo e semplice, ma ha un potere immenso.",
        "Accessori",
        16.99,
        "https://tinypic.host/images/2022/09/02/Prodotto_-2.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-2.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-5.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-4.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-3.png"
);

insert into prodottofisico
values(
        130,
        "Collana di ametista a goccia con catena in argento",
        100,
        "Questa bellissima collana di ametista a goccia è il modo perfetto per portare potere e ricchezza al tuo spirito. Calma la tua mente e rilascia pensieri e tensioni negative. Completa le tue manifestazioni con questa ""Pietra Reale"" per migliorare la tua intuizione. È piccolo e semplice, ma ha un potere immenso.",
        "Accessori",
        19.99,
        "https://tinypic.host/images/2022/09/02/Prodotto_-6.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-6.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-9.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-8.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-7.png"
);

insert into prodottofisico
values(
        131,
        "Ciondolo avventurina",
        100,
        "Avventurina verde per sciogliere e rilasciare negatività e blocchi energetici. Alcuni indossano avventurina verde per aumentare l'intelligenza, la percezione e la creatività.",
        "Accessori",
        12.99,
        "https://tinypic.host/images/2022/09/02/Prodotto_-14.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-14.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-17.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-16.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-15.png"
);

insert into prodottofisico
values(
        132,
        "Collana di Muschio Agata Bianca con catena in argento",
        100,
        "Uno dei significati dell'agata bianca di muschio verde è che incoraggia un senso di tranquillità ed equilibrio emotivo. Si dice che sia estremamente utile per coloro che provano un forte senso di aggressività o qualsiasi altra emozione travolgente. L'agata di muschio porta calma e ci aiuta ad avvicinarci alla natura.",
        "Accessori",
        12.99,
        "https://tinypic.host/images/2022/09/02/Prodotto_-26.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-26.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-29.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-28.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-27.png"
);

insert into prodottofisico
values(
        152,
        "Ciondolo avventurina",
        100,
        "Avventurina verde per sciogliere e rilasciare negatività e blocchi energetici. Alcuni indossano avventurina verde per aumentare l'intelligenza, la percezione e la creatività.",
        "Accessori",
        12.99,
        "https://tinypic.host/images/2022/09/02/Prodotto_-14.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-14.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-17.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-16.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-15.png"
);

insert into prodottofisico
values(
        133,
        "Collana di Muschio Agata Azzurra con catena in argento",
        100,
        "L'Agata Azzurra è un calmante per la mente e aiuta a lenire le emozioni, incoraggia la comunicazione, la pazienza e la gentilezza, aiuta a rimuovere i blocchi dal sistema nervoso, può alleviare il mal di gola e togliere la raucedine.",
        "Accessori",
        29.99,
        "https://tinypic.host/images/2022/09/02/Prodotto_-22.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-22.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-25.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-24.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-23.png"
);

insert into prodottofisico
values(
        134,
        "Bracciale amazzonite con catena in oro 14kt",
        100,
        "L'Amazzonite dona autocontrollo, risolutezza, libertà nella comunicazione. Questa è la pietra che induce alla comprensione di un problema fino a capirlo e per questo dona poi un senso di pace e equilibrio.",
        "Accessori",
        24.99,
        "https://tinypic.host/images/2022/09/02/Prodotto_-33.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-33.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-32.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-31.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-30.png"
);

insert into prodottofisico
values(
        135,
        "Bracciale con onice nera opaca",
        100,
        "Rinforza il cuore e il midollo osseo accelerando i processi di guarigione dopo un intervento chirurgico o durante la convalescenza. Collegata al I Chakra e appoggiata alla regione del plesso solare, la pietra onice fortifica il pancreas, riduce lo stress e dona equilibrio psicofisico.",
        "Accessori",
        17.99,
        "https://tinypic.host/images/2022/09/02/Prodotto_-34.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-34.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-37.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-36.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-35.png"
);

insert into prodottofisico
values(
        136,
        "Bracciale in lapislazzuli",
        100,
        "Pietra di protezione che può essere indossata per proteggersi dagli attacchi psichici, il lapislazzuli rilascia rapidamente lo stress, portando una pace profonda. Porta armonia e profonda conoscenza interiore di sé. Incoraggia l'autoconsapevolezza, consente l'espressione di sé e rivela la verità interiore, fornendo qualità di onestà, compassione e moralità alla personalità. Stimola l'obiettività, la chiarezza e incoraggia la creatività.",
        "Accessori",
        25.99,
        "https://tinypic.host/images/2022/09/02/Prodotto_-38.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-38.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-41.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-40.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-39.png"
);

insert into prodottofisico
values(
        137,
        "Bracciale in labradorite con catena in argento",
        100,
        "La Labradorite è una pietra che aumenta la creatività, rafforza l'intuizione e permette di vedere la vera natura dei nostri scopi. Utile contro raffreddore e reumatismi, ha effetti benefici anche contro gotta e stress.",
        "Accessori",
        24.99,
        "https://tinypic.host/images/2022/09/02/Prodotto_-42.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-42.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-45.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-44.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-43.png"
);

insert into prodottofisico
values(
        138,
        "Bracciale tormalina nera grezza con catena in argento",
        100,
        "La tormalina nera è una pietra protettiva che è molto buona per mantenere le vibrazioni negative lontane dalla tua aura e dal tuo spazio corporeo. La tormalina nera è nota per essere una delle pietre più efficaci e potenti in grado di guarirti e proteggerti fisicamente, emotivamente, mentalmente e spiritualmente.",
        "Accessori",
        11.99,
        "https://tinypic.host/images/2022/09/02/Prodotto_-46.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-46.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-49.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-48.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-47.png"
);

insert into prodottofisico
values(
        139,
        "Bracciale pietre di apatite e cristalli austriaci con catena in argento",
        100,
        "L'apatite blu apre il chakra della gola. Migliora la comunicazione nei gruppi e facilita il parlare in pubblico. Guarisce il cuore e le emozioni. L'apatite blu si collega a un livello molto alto di guida spirituale.",
        "Accessori",
        15.99,
        "https://tinypic.host/images/2022/09/02/Prodotto_-50.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-50.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-53.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-52.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-51.png"
);

insert into prodottofisico
values(
        140,
        "Bracciale minimal con perline di granato naturale con catena in argento colorazione oro",
        100,
        "Il granato purifica e rinvigorisce i chakra. Rivitalizza, purifica e riequilibra l'energia, apportando serenità o passione a seconda dei casi. Ispira amore e devozione. Il granato riequilibra il desiderio sessuale e allevia la disarmonia emotiva. Attiva e rafforza l'istinto di sopravvivenza, portando coraggio e speranza. Stimola il ricordo di vite passate. Affina le percezioni di se stessi e degli altri. Il granato rimuove inibizioni e tabù. Apre il cuore e dona fiducia in se stessi.",
        "Accessori",
        20.99,
        "https://tinypic.host/images/2022/09/02/Prodotto_-58.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-58.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-61.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-60.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-59.png"
);

insert into prodottofisico
values(
        141,
        "Bracciale turchese africano",
        100,
        "Il turchese africano è la ""pietra dell'evoluzione"". Incoraggia la crescita e lo sviluppo per promuovere un cambiamento positivo dall'interno. Apre la mente a nuove idee e infinite possibilità. Il turchese africano è una pietra che ispira la struttura e l'equilibrio per risvegliare uno allo scopo previsto. Spinge a usare la conoscenza che già possiedono, mentre ci illumina anche alla saggezza degli altri per aiutare a diventare una persona migliore a beneficio di tutta l''umanità. Si ritiene che il turchese africano aiuti ad alleviare gli sbalzi d'umore, incoraggiare l'accettazione e lenire i sentimenti di aggravamento emotivo con conseguente atteggiamento più ottimista nei confronti della vita.",
        "Accessori",
        20.99,
        "https://tinypic.host/images/2022/09/02/Prodotto_-62.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-62.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-65.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-64.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-63.png"
);

insert into prodottofisico
values(
        142,
        "Bracciale con pietre di agata albero",
        100,
        "L'agata degli alberi è considerata la pietra che porta la pace interiore. Calma i nervi e se abbinato al quarzo trasparente si rivela un talismano per la meditazione profonda e la preghiera. Quando i tuoi nervi sono calmi, sei in grado di concentrarti sull'unità, dissolvere l'egoismo e l'arroganza. L'agata arborea non solo calma i nervi, ma aiuta anche a migliorare le funzioni mentali. Porta chiarezza e stabilità in mente, supera le emozioni negative e infonde amore nei chakra.",
        "Accessori",
        19.99,
        "https://tinypic.host/images/2022/09/02/Prodotto_-66.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-66.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-69.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-68.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-67.png"
);

insert into prodottofisico
values(
        143,
        "Bracciale minimal di peridoto",
        100,
        "La pietra del peridoto rilascia e neutralizza le tossine a tutti i livelli, allevia la gelosia, il risentimento, il rancore, l'amarezza, l'irritazione, l'odio e l'avidità. Riduce lo stress, la rabbia e il senso di colpa. Il peridoto apre i nostri cuori alla gioia e a nuove relazioni. Migliora la fiducia e l'affermazione, motivando la crescita e il cambiamento. Affina e apre la mente a nuovi livelli di consapevolezza. Bandisce letargia, apatia e stanchezza.",
        "Accessori",
        20.99,
        "https://tinypic.host/images/2022/09/02/Prodotto_-70.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-70.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-73.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-72.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-71.png"
);

insert into prodottofisico
values(
        153,
        "Orecchini lunghi con perline di radice di smeraldo naturale placcati oro 18kt",
        100,
        "Lo smeraldo porta lealtà e fornisce la felicità domestica. Migliora l'amore incondizionato, l'unità e promuove l'amicizia. Mantiene in equilibrio le relazioni e può segnalare infedeltà se cambia colore. Lo smeraldo stimola il chakra del cuore, avendo un effetto curativo sulle emozioni e sul cuore fisico. Assicura l'equilibrio fisico, emotivo e mentale, portando armonia in tutti gli ambiti della propria vita.",
        "Accessori",
        24.99,
        "https://tinypic.host/images/2022/09/02/Prodotto_-74.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-74.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-75.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-77.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-76.png"
);

insert into prodottofisico
values(
        144,
        "Orecchini lunghi con perline di granato naturale placcati oro 18kt",
        100,
        "Il granato purifica e rinvigorisce i chakra. Rivitalizza, purifica e riequilibra l'energia, apportando serenità o passione a seconda dei casi. Ispira amore e devozione. Il granato riequilibra il desiderio sessuale e allevia la disarmonia emotiva. Attiva e rafforza l'istinto di sopravvivenza, portando coraggio e speranza. Stimola il ricordo di vite passate. Affina le percezioni di se stessi e degli altri. Il granato rimuove inibizioni e tabù. Apre il cuore e dona fiducia in se stessi.",
        "Accessori",
        22.99,
        "https://tinypic.host/images/2022/09/02/Prodotto_-79.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-79.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-78.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-81.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-80.png"
);

insert into prodottofisico
values(
        145,
        "Orecchini con agata rosa e foglia filigrana placcata oro 18kt",
        100,
        "L'agata è un'ottima pietra per riequilibrare e armonizzare corpo, mente e spirito. Purifica e stabilizza l'aura, eliminando e trasformando la negatività. L'agata migliora la funzione mentale, migliorando la concentrazione, la percezione e le capacità analitiche. Lenisce e calma, guarisce la rabbia o la tensione interiore e crea un senso di sicurezza e protezione.",
        "Accessori",
        22.99,
        "https://tinypic.host/images/2022/09/02/Prodotto_-82.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-82.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-85.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-84.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-83.png"
);

insert into prodottofisico
values(
        146,
        "Orecchini con quarzo rosa placcati oro 18kt",
        100,
        "Il quarzo rosa è la pietra dell'amore universale. Ripristina la fiducia e l'armonia nelle relazioni, incoraggiando l'amore incondizionato. Il quarzo rosa purifica e apre il cuore a tutti i livelli per promuovere l'amore, l'amor proprio, l'amicizia, la profonda guarigione interiore e sentimenti di pace. Calmante e rassicurante, aiuta a confortare nei momenti di dolore. Il quarzo rosa dissipa la negatività e protegge dall'inquinamento ambientale, sostituendolo con vibrazioni amorevoli. Incoraggia il perdono di sé e l'accettazione invocando fiducia in se stessi e autostima.",
        "Accessori",
        14.99,
        "https://tinypic.host/images/2022/09/02/Prodotto_-86.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-86.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-89.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-88.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-87.png"
);

insert into prodottofisico
values(
        154,
        "Orecchini con ametista placcati oro 18kt",
        100,
        "Questa pietra calmante ti consente di calmare la tua mente, che può aiutare nel sonno, nella meditazione e in generale nel muoversi attraverso la vita da uno stato più elevato dell'essere. Non importa chi sei o quali sono i tuoi obiettivi nella vita, un cristallo di ametista può supportarti lungo il viaggio della tua vita.",
        "Accessori",
        17.99,
        "https://tinypic.host/images/2022/09/02/Prodotto_-90.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-90.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-93.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-92.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-91.png"
);

insert into prodottofisico
values(
        147,
        "Mazzo Tarocchi di Marsiglia - 78 Carte",
        100,
        "I Tarocchi di Marsiglia ricostituiti da Camoin e Jodorowsky sono un'opera speciale, i Tarocchi di tutti coloro che cercano qualcosa di poderoso nei Tarocchi. Puoi immergerti nella fonte del Tarocco e ritrovare l'energia ed i simboli persi, codificati per gli iniziati e gli alchimisti.
Philippe Camoin, erede dei maestri fabbricanti di carte marsigliesi che hanno diffuso i Tarocchi di Marsiglia dal 1760, e Alejandro Jodorowsky, cineasta e appassionato di Tarocchi, hanno lavorato insieme per ricostruire i Tarocchi di Marsiglia, al fine di recuperare i concetti esoterici e filosofici presenti nei Tarocchi originali.
La fabbrica della famiglia Camoin risale al 1760 grazie al suo fondatore Nicolas Conver, ma i suoi Tarocchi non contenevano la Struttura Cifrata presente nei tarocchi Camoin-Jodorowsky. I Tarocchi che Philippe Camoin ha creato con Alejandro Jodorowsky si distinguono chiaramente dai Tarocchi di Conver, sia per i colori che per la quantità di simboli.
Alejandro Jodorowsky ha voluto ""restaurare"" i Tarocchi di Marsiglia, nel senso di restituire loro una nuova forza e l'importanza che realmente meritano. Per Jodorowsky e Camoin, i Tarocchi sono una macchina metafisica. Camoin voleva esteriorizzare una Struttura Cifrata esoterica che altrimenti sarebbe stata persa nei secoli.
Combinando simboli presi nei vecchi tarocchi diffusi in tutta l'Europa, i due autori sono riusciti a ricreare un insieme simbolico coerente e completamente inedito.",
        "Tarot",
        24.99,
        "https://tinypic.host/images/2022/09/02/Prodotto-47.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-47.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-49.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-48.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-46.png"
);

insert into prodottofisico
values(
        148,
        "Tarocchi Rider Waite - 78 Carte",
        100,
        "I Tarocchi Rider Waite sono il mazzo più diffuso e apprezzato al mondo. Si tratta di una delle maggiori sintesi del magismo occidentale: l'opera in cui il misticismo cristiano si fonde con la Qabbalah ebraica, con l'Alchimia e le filosofie orientali.
Dietro le immagini affascinanti si intravede il progetto di Waite, l'eminente studioso che con le sue opere ha segnato profondamente il mondo occultistico anglosassone: ""C''è una tradizione segreta riguardo ai tarocchi, così come c''è una Dottrina Segreta al loro interno. Ne ho seguito una parte secondo i limiti stabiliti per argomenti di questo genere e secondo le leggi dell''onore"".
Con queste oscure parole Waite, capo di una delle fazioni più potenti dell''Ordine Ermetico dell''Alba Dorata, introduceva ""La Dottrina senza veli"", il capitolo della sua opera in cui spiegava i significati, gli usi rituali e le tecniche divinatorie legate ai ""suoi"" tarocchi. E ora quella dottrina segreta è finalmente accessibile al pubblico italiano nella sua interezza.",
        "Tarot",
        29.99,
        "https://tinypic.host/images/2022/09/02/Prodotto-50.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-50.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-53.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-52.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-51.png"
);

insert into prodottofisico
values(
        149,
        "Tarocchi d'oro Visconti Sforza - 78 Carte",
        100,
        "Questo mazzo prende il nome dal ramo cadetto della famiglia Visconti a cui è appartenuto, viene detto anche Cary-Yale perché ha fatto parte della collezione di carte da gioco storiche della famiglia Cary, confluita nel 1967 nella Biblioteca Beinecke dell'Università di Yale. Da molti studiosi è ritenuto il più antico dei mazzi anche se la datazione esatta è difficoltosa e pertanto controversa, secondo alcune ipotesi è stato commissionato da Filippo Maria Visconti, altri studiosi invece ne collocano la realizzazione intorno al 1466. Giordano Berti lo data con certezza al periodo 1442-1447 in quanto il seme di denari mostra ora il recto ora il verso del fiorino d'oro fatto coniare dal duca di Milano Filippo Maria Visconti nel 1442, e rimasto in uso fino al 1447, anno della morte del duca
Di questo mazzo sono rimasti 67 soggetti (11 trionfi, 17 figure e 39 carte non figurate). Nemmeno sulla composizione originaria del mazzo vi è accordo, secondo alcuni in origine le carte erano 70 secondo altri erano 86 in quanto il mazzo Cary-Yale è l'unico mazzo di carte occidentale in cui le figure sono 6 e non le tradizionali 4. Al fante, cavallo, re e regina si aggiungono la donzella e la dama a cavallo. Se quindi i trionfi del mazzo erano 22 come nel mazzo Pierpont-Morgan il numero complessivo delle carte originali sarebbe stato 86.
Tutti i trionfi e le figure hanno uno sfondo in oro mentre le carte non figurate del mazzo hanno sfondo argentato. Le dimensioni delle carte sono di circa 189 × 90 mm.",
        "Tarot",
        26.60,
        "https://tinypic.host/images/2022/09/02/Prodotto-58.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-58.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-61.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-60.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-59.png"
);

insert into prodottofisico
values(
        150,
        "Tarocchi Rider Waite [Neri]- 78 Carte",
        100,
        "I Tarocchi Rider Waite sono il mazzo più diffuso e apprezzato al mondo. Si tratta di una delle maggiori sintesi del magismo occidentale: l'opera in cui il misticismo cristiano si fonde con la Qabbalah ebraica, con l'Alchimia e le filosofie orientali.
Dietro le immagini affascinanti si intravede il progetto di Waite, l'eminente studioso che con le sue opere ha segnato profondamente il mondo occultistico anglosassone: ""C''è una tradizione segreta riguardo ai tarocchi, così come c''è una Dottrina Segreta al loro interno. Ne ho seguito una parte secondo i limiti stabiliti per argomenti di questo genere e secondo le leggi dell''onore"".
Con queste oscure parole Waite, capo di una delle fazioni più potenti dell''Ordine Ermetico dell''Alba Dorata, introduceva ""La Dottrina senza veli"", il capitolo della sua opera in cui spiegava i significati, gli usi rituali e le tecniche divinatorie legate ai ""suoi"" tarocchi. E ora quella dottrina segreta è finalmente accessibile al pubblico italiano nella sua interezza.",
        "Tarot",
        32.99,
        "https://tinypic.host/images/2022/09/02/Prodotto-65.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-65.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-64.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-63.png",
        "https://tinypic.host/images/2022/09/02/Prodotto-62.png"
);

insert into prodottofisico
values(
        151,
        "Antichi Tarocchi Italiani - 78 Carte",
        100,
        "L’Italia si è distinta, nel corso dei secoli, per una produzione di bellissimi Tarocchi, derivati direttamente dai primi modelli quattrocenteschi. Il talento artistico e la creatività italiana sono concentrati in questo mazzo, che stupisce ancora per la sua raffinatezza e per la sintesi simbolica che ne fanno un eccellente strumento per la divinazione. 78 cards – 66x120 mm",
		"Tarot",
		32.99,
        "https://i.postimg.cc/bv0C3Q00/Prodotto-54.png",
        "https://i.postimg.cc/bv0C3Q00/Prodotto-54.png",
        "https://tinypic.host/images/2022/09/02/Prodotto_-95.png",
        "https://i.postimg.cc/hvv2D6kM/Prodotto-56.png",
        "https://i.postimg.cc/j5Z8rtFL/Prodotto-57.png"
);

/*create table consulenza(
	id int primary key, 
	durata int not null, 
    nome varchar(40) not null, 
    prezzo double not null
); 
*/
insert into consulenza
values(
        999,
        25,
        "Consulti Tarocchi - 25 min",
        24.99,
        "Dai una risposta a tutte le tue domande. Riuscirai ad avere il lavoro dei tuoi sogni? Tu e il tuo partner siete legati dal filo del destino? Prenota il tuo consulto su Zoom!",
        "https://images.unsplash.com/photo-1529480653440-0e5fd1af911c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzV8fHRhcm90fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
        
);

insert into consulenza
values(
        1000,
        50,
        "Consulti Tarocchi - 50 min",
        49.99,
        "Dai una risposta a tutte le tue domande. Riuscirai ad avere il lavoro dei tuoi sogni? Tu e il tuo partner siete legati dal filo del destino? Prenota il tuo consulto su Zoom!",
        "https://images.unsplash.com/photo-1529480653440-0e5fd1af911c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzV8fHRhcm90fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
);
/*
create table gestisce(
	utente varchar(45) not null, 
    corso int not null, 
	foreign key(corso) references corso(idcorso),
     foreign key(utente) references utente(email)
);
*/ 
insert into gestisce values(
	"caterinadaloia@gmail.com", 
    1003
);
/*
create table effettua(
	ordine int not null,
	utente varchar(45) primary key, 
    foreign key(ordine) references ordine(numero), 
    foreign key(utente) references utente(email)
);*/
insert into effettua values(
	004,
	"morgyespy@gmail.com"
);

insert into effettua values(
	005, 
    "ivolombardi@armyspy.com"
    );
/*
    
create table relativoA1(
	ordine int not null,
	prodottofisico int not null, 
    foreign key(prodottofisico) references prodottofisico(idpf),
    foreign key(ordine) references ordine(numero)
); 
*/
insert into relativoA1 values(
	004,
	105
); 
/*
create table relativoA2(
	ordine int not null,
    foreign key(ordine) references ordine(numero), 
    corso int not null, 
    foreign key(corso) references corso(idcorso)
); 
*/
insert into relativoA2 values(
	005,
    1002
); 

insert into relativoA2 values(
	003,
    1001
); 
/*
create table relativoA3(
	ordine int not null,
    foreign key(ordine) references ordine(numero), 
    consulenza int not null, 
    foreign key(consulenza) references consulenza(id)
); 
*/
insert into relativoA3 values(
	006,
    999
); 
