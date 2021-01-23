# Problemi e quirk

In generale l'approccio con le risorse custom mi ha portato a scoprire diversi
bug. Questi bug sono in parte evitabili ed inoltre dovrebbero essere
risolti con un aggiornamento di Godot per il supporto first-class alle
risorse custom:

- [Add first-class custom resource support](https://github.com/godotengine/godot-proposals/issues/18)
- [Allow exporting custom resources from/to any scripting language](https://github.com/godotengine/godot/pull/44879)
- [Enable script class resource exports.](https://github.com/godotengine/godot/pull/32018)

### Risorse custom e inspector

Risorse custom inizializzate/assegnate a runtime non compaiono nel remote
inspector.

UPDATE: ho scoperto che si tratta di un bug: https://github.com/godotengine/godot/issues/41442

### Problemi di caricamento del file di salvataggio

Il consiglio è di evitare di creare delle funzioni `_init()` custom.

Attualmente la gestione delle risorse in Godot sembra avere ancora alcune rough
edges.

Letture rilevanti:
- https://godotengine.org/qa/56388/when-can-i-override-_init-with-non-optional-arguments
- https://github.com/godotengine/godot/issues/13440

### GameSave (Resource): file salvataggio non mostra i valori corretti dall'inspector dopo averlo salvato

Spesso capita che l'inspector non mostri i valori corretti perché credo che
le risorse vengano caricate solamente all'avvio.

Se cambiamo il file della risorsa, bisogna riavviare Godot.

Forse c'è un modo alternativo per ricaricare le risorse ma non lo conosco.

### Bug: cancellare il file di salvataggio a runime e ricaricare la scena porta ad uno stato errato

**Riprodurre bug**:

- vai al commit 44826b4365edf2e12fdf0d37453aacb93d92f90f
- avvia il gioco
- il gioco crea un nuovo file di salvataggio automaticamente
- premi il tasto `E`, il salvataggio di gioco verrà cancellato
- premi il tasto `R`, il gioco verrà ricaricato a runtime
- osserva il pannello di debug: le mosse del pokemon sono duplicate

Probabilmente questo problema è causato dal caching delle risorse. Quello che
mi capitava è che creando una nuova risorsa `GameSave.new()`  l'array dei
pokemon era già inizializzato con un elemento. La stessa cosa per le mosse
dei pokemon. Continuando l'esecuzione, il salvataggio vedeva la duplicazione
di pokemon e mosse.

Possibili bug collegati:

- https://github.com/godotengine/godot/issues/30302