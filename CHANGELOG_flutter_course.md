# Changelog – flutter_course

Repository nata il **17/05/2026**, contenente i progetti svolti durante un corso Flutter (Udemy). Ogni progetto vive in una cartella numerata in ordine incrementale (`_NN_nome_progetto`). Di seguito il riepilogo delle modifiche raggruppate per progetto, ricostruito dai messaggi di commit.

---

## `_02_first_app` (Dice Roller)
*Creato il 17/05/2026*

- Commit iniziale del progetto: app con gradient container e componente dice roller (lancio dadi).
- La cartella è stata rinominata due volte (da `first_app` a `02_first_app` e infine a `_02_first_app`) per allinearsi allo schema di numerazione incrementale adottato per tutta la repo.

Nessuna modifica funzionale successiva alla creazione.

---

## `_03_quiz_app`
*Creato il 17/05/2026*

- Commit iniziale: app quiz con schermata di start, schermata domande, bottoni di risposta, dati delle domande e schermata risultati con riepilogo (questions summary).
- Anche questa cartella è stata rinominata due volte insieme a `_02_first_app` per uniformare la numerazione (`quiz_app` → `03_quiz_app` → `_03_quiz_app`).

Nessuna modifica funzionale successiva alla creazione.

---

## `_04_quiz_app`
*Creato il 17/05/2026*

Versione evoluta/riorganizzata del progetto quiz, creata insieme alla rinominazione dei progetti precedenti.

- Creazione del progetto con struttura riorganizzata (`questions_summary`, `results_screen` unificato in un solo file).
- **Fix**: errore di casting in `summary_item.dart`.
- **Fix**: errore di indice fuori range (array index) in `quiz.dart`.

---

## `_05_expense_tracker`
*Creato il 19/05/2026 – progetto con il maggior numero di iterazioni*

- Inizializzazione del progetto.
- Aggiunte regole di linting personalizzate (`analysis_options.yaml`).
- Implementata una `ListView` per mostrare l'elenco delle spese, settando la proprietà `key` di ogni item nella lista con la classe `ValueKey`.
- Refactor della struttura delle cartelle (introduzione di `widgets/`).
- Creato il widget `ExpenseItem` e aggiornati i path di import nei test.
- Aggiunto il package `intl` e implementata la formattazione delle date.
- Refactor di `ExpenseItem` per usare icone dinamiche in base alla categoria della spesa.
- Aggiunta una `AppBar`.
- Creato il widget `NewExpense` e integrato nella schermata Expenses.
- Creati `NumberEditingController` e `NumberField` per una gestione più curata dell'input numerico.
- Refactor di `NumberField`/`NumberEditingController` per maggiore personalizzazione.
- Ulteriore refactor della struttura delle cartelle (introduzione della sottocartella `expense/`).
- **Fix**: bug nell'inserimento di più valori tramite espressione regolare (RegExp).
- Aggiunto un date picker nell'overlay di creazione nuova spesa.
- Salvataggio della data selezionata nello stato del widget.
- Aggiunto un menu a tendina (dropdown) per la categoria e miglioramenti UI generali.
- Implementata la validazione dei campi del form, con fix su `number_field`.
- Refactor: il widget `NewExpense` ora accetta una callback `onSaved` e ha il padding ottimizzato.
- Definito uno `kColorScheme` per migliorare il theming dell'app.
- Miglioramento del tema dell'app (più iterazioni successive).
- Cambiati alcuni stili e aggiunto il widget `Dismissible` per eliminare una spesa con swipe.
- Aggiunta una `SnackBar` con funzionalità di "undo" dopo l'eliminazione di una spesa.
- Aggiunto uno sfondo al `Dismissible` e impostata la durata della `SnackBar`.
- Ulteriore refactor del tema.
- Refactor della formattazione dell'importo delle spese.
- Aggiunto un grafico (chart) a barre per visualizzare le spese per categoria.
- Rimosso (commentato) il costruttore della classe `ExpenseBucket`, non più necessario.

---

## `_06_expense_tracker_responsive`
*Creato il 06/06/2026 – evoluzione responsive del progetto precedente*

- Inizializzazione del progetto, basato sulla struttura completa di `_05_expense_tracker` (modello spese, widget chart, lista spese, form nuova spesa, ecc.).
- Aggiornato `analysis_options.yaml` con regole di lint per suggerire l'utilizzo del const (prefer_const_...) e soppresso l'errore per il nome delle costanti.
- Refactor della funzione `main`: utilizzo di `WidgetsFlutterBinding.ensureInitialized()` per inizializzare il binding tra Flutter e l'S.O. utile per utilizzare `SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])` (`package:flutter/services.dart`) per bloccare il layout in Portrait mode (codice commentato, serve solo come esempio). Uso di `async`/`await` per l'inizializzazione della formattazione delle date.
- Refactor del widget `Expenses` per migliorare la gestione del `mainContent` e semplificare il metodo `build`.
- Refactor del layout del widget `Expenses` per adattarsi alla larghezza dello schermo (logica responsive) utilizzando la classe `MediaQuery` (`MediaQuery.of(context)`).
- Abilitato l'inserimento di una nuova spesa anche in modalità landscape "*avvolgendo*" i Widgets all'interno di un `SingleChildScrollView` per rendere il `ModalBottomSheet` scrollabile dal momento che in landscape la tastiera coprirebbe gran parte dei campi. Per poter attivare lo scroll si è dovuto alzare il margine inferiore, del `ModalBottomSheet`, della grandezza della tastiera, grandezza ottenuta con `MediaQuery.of(context).viewInsets.bottom`
- Settato il parametro `useSafeArea` a `true` nel metodo `showModalBottomSheet` per sistemare il margine superiore della modale in modo che non venga coperata dalle periferiche e dalla UI del dispositivo (camera + simboli wifi, batteria, sveglia, ecc...)
- Utilizzato il Widget `LayoutBuilder` per gestire meglio la scelta del layout da mostrare (Portrait o Landscape)

---

## File a livello di repository

- **README.md**: aggiunto con il commit iniziale della repo.
- **course-slides.pdf**: aggiunte le slide del corso Udemy.
