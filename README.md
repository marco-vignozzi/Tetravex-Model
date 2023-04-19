#### INTRODUZIONE
Il progetto conisiste in un programma ("Tetravex.mzn") che risolve istanze del gioco 
**Tetravex** per scacchiere NxN e qualsiasi valore.
E' inoltre presente una relazione in pdf che spiega i dettagli sul modello utilizzato 
per definire il problema come CSP.

#### INPUT
+ >**N** : un valore intero per la dimensione della scacchiera 
+ >**pezzi** : una matrice (NxN)x4 di interi, ogni riga rappresenta un pezzo.

I valori su ciascuna riga corrispondono ai valori sulle facce di 
ciascun pezzo scritti da sinistra in senso orario.
I valori di input possono essere forniti direttamente nel programma 
assegnando le variabili "N" e "pezzi", oppure in un file _dataset_ (".dzn")
separato assegnando i parametri N e pezzi con la sintassi di Minizinc.
I valori possono essere forniti anche al momento dell'esecuzione
attraverso l'interfaccia di Minizinc, ma è altamente sconsigliato.
Nella cartella dataset sono presenti 8 dataset, due per ciascun valore 
di N da 3 a 6.


#### OUTPUT
Se il problema è soddisfacibile otterremo 2 "scacchiere", una che rappresenta 
i pezzi nell'ordine dato e una che rappresenta la soluzione.
Se il problema non è soddisfacibile stamperà "UNSATISFIABLE".
Se vengono forniti in input valori sbagliati verrà stampata una stringa di errore.

#### RIPRODURRE I TEST
E' possibile riprodurre i test aprendo il programma (file "TETRAVEX.mzn") su software _Minizinc_ 
e da lì aprire i file con i dati desiderati dalla cartella _dataset_. 
Dopo di chè eseguire il programma.
