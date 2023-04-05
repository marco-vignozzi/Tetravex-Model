% MODELLO PER TETRAVEX

include "alldifferent.mzn";

int: N;              % altezza e larghezza della griglia
set of int: range = 1..N*N;    % range di valori da 1 al numero di pezzi, dominio delle variabili
array[1..N*N, 1..4] of int: pezzi;   % ciascuna riga della matrice rappresenta un pezzo del puzzle
array[1..N, 1..N] of var range: griglia;  % griglia in cui inserire i pezzi, variabili intere che identificano l'indice di riga del pezzo nella matrice

% vincolo di uguaglianza su facce adiacenti in orizzontale
constraint forall(i in 1..N, j in 1..N-1)(      
          pezzi[griglia[i,j], 3] = pezzi[griglia[i,j+1], 1]);

% vincolo di uguaglianza su facce adiacenti in verticale
constraint forall(i in 1..N-1, j in 1..N)(
          pezzi[griglia[i,j], 4] = pezzi[griglia[i+1,j], 2]);
                    
% vincolo di unicità per i pezzi utilizzati
constraint alldifferent([griglia[i,j] | i,j in 1..N]);

solve satisfy;


% output che rappresenta i pezzi nell'ordine in cui vengono dati
% (crescente da sinistra a destra e dall'alto verso il basso)
output ["\nPEZZI:\n\n"];
output [concat(j in 1..N)(" -------") ++ "\n" ++
        % stampo valori in alto
        concat(j in 1..N)("| \\ " ++ 
            "\(pezzi[i*N+j, 2]) " ++ 
            if j==N then "/ |\n" else "/ " endif) ++ 
        % stampo valori a sinistra e a destra
        concat(j in 1..N)("| " ++ "\(pezzi[i*N+j, 1]) " ++ 
            "X " ++ "\(pezzi[i*N+j, 3]) " ++ 
            if j==N then "|\n" else "" endif) ++
        % stampo valori in basso
        concat(j in 1..N)("| / " ++ "\(pezzi[i*N+j, 4]) " ++
            if j==N then "\\ |\n" else "\\ " endif) ++
            concat(j in 1..N)(" -------") ++ "\n" ++
        if i==N-1 then "\n" else "" endif
        % per ogni riga della griglia
        | i in 0..N-1];

% output che rappresenta la soluzione
output ["SOLUZIONE:\n\n"];
output [concat(j in 1..N)(" -------") ++ "\n" ++
        concat(j in 1..N)("| \\ " ++ 
            "\(pezzi[griglia[i,j], 2]) " ++ 
            if j==N then "/ |\n" else "/ " endif) ++ 
        concat(j in 1..N)("| " ++ "\(pezzi[griglia[i,j], 1]) " ++ 
            "X " ++ "\(pezzi[griglia[i,j], 3]) " ++ 
            if j==N then "|\n" else "" endif) ++
        concat(j in 1..N)("| / " ++ "\(pezzi[griglia[i,j], 4]) " ++
            if j==N then "\\ |\n" else "\\ " endif) ++
            concat(j in 1..N)(" -------") ++ "\n" ++
        if i==N then "\n" else "" endif
        | i in 1..N];
        