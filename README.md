# Pokemon RPG mechanics

## Argomenti

1. Data driven (accenna ai vantaggi, spiegazione alla fine?)
2. Caricamento dati da file esterno
   1. Formato dati
      1. **csv**
      2. sqlite
      3. json
   2. script loading
3. `class_name`
4. Risorse
   1. Export risorse
   2. Modifica di una risorsa dall'inspector
   3. Side effects ?
   4. `func _to_string() -> String:` per migliore leggibilità
5. Salvataggio dati
   1. ResourceSaver
   2. `res://` vs `user://` (+ riconoscimento modalità debug)

## Domande e dubbi che potrei approfondire

### Pro/con Resource

- Che differenza c'è tra usare Resource e usare un altro tipo di file (csv,
  ConfigFile, ...)?

Le risorse possono avere **logica**.

Si possono validare i dati, caricare da altri script o da altre sorgenti (csv,
json, confi file, formato custom)

Si possono avere funzioni di utilità statiche come `get_by_name()` o
`get_by_id()`.

Si ha la (de)serializzazione dei dati già implementata in Godot.

- https://docs.godotengine.org/en/3.2/getting_started/step_by_step/resources.html#creating-your-own-resources
- https://docs.godotengine.org/en/3.2/getting_started/workflow/best_practices/node_alternatives.html

## Glossario

### Base Stat

- https://bulbapedia.bulbagarden.net/wiki/Base_stats

Statistiche che rappresentano la forza innata e di base di ogni Pokemon.
Questi valori sono uguali per tutti i Pokemon con lo stesso `pokemon_id`
(esempio: tutti i Pikachu condividono le stesse Base Stat di HP, Forza,
Difesa, ...).

La nomenclatura Base Stat è la più utilizzata anche se:

> From Pokémon FireRed and LeafGreen to Pokémon Ultra Sun and Ultra Moon, EVs
> were also officially referred as base stats in English (distinct from what
> fans refer to as [base
> stats](https://bulbapedia.bulbagarden.net/wiki/Base_stats), which are instead
> the stat-affecting values intrinsic to the Pokémon's species).

### Effort Value

- https://bulbapedia.bulbagarden.net/wiki/Effort_values#Stat_experience

> In Generations I and II, effort points given are equal to the base stats of the
defeated Pokémon species.

> The Pokémon data structure contains two EV bytes for each of the five stats
> (HP, Attack, Defense, Speed and Special), starting at zero when caught and
> with a maximum EV of 65535 for each stat.

> When a Pokémon is defeated, its base stats are converted to effort points and
> then added to the EVs. For example, defeating a Mew grants 100 effort points
> to each EV.

### Individual Values

- https://bulbapedia.bulbagarden.net/wiki/Individual_values

### Stat formula

- https://bulbapedia.bulbagarden.net/wiki/Statistic#In_Generations_I_and_II

## Problemi e quirk

### Risorse custom e inspector

Risorse custom inizializzate/assegnate a runtime non compaiono nel remote
inspector.

UPDATE: ho scoperto che si tratta di un bug: https://github.com/godotengine/godot/issues/41442

### ResourceSaver flags

...

### Problemi di caricamento del file di salvataggio

Attualmente la gestione delle risorse in Godot sembra avere ancora alcune rough
edges.

Il consiglio è di evitare di creare delle _init() custom!

Non so se l'errore sia nel passare i valori di default (probabilmente sì).

Bug relativo: https://github.com/godotengine/godot/issues/13440

> ERROR: GDScript::_create_instance: Condition ' r_error.error != Variant::CallError::CALL_OK ' is true

### GameSave (Resource): file salvataggio non mostra i valori corretti dall'inspector dopo averlo salvato

Spesso capita che l'inspector non mostri i valori corretti perché credo che
le risorse vengano caricate solamente all'avvio.

Se cambiamo il file della risorsa, bisogna riavviare Godot.

Forse c'è un modo altenrativo per ricaricare le risorse ma non lo conosco.

## Documentazione e link utili

Save system:

- GDQuest: [Godot Save Game Tutorial: Save and load using Resources](https://youtu.be/ML-hiNytIqE)
- JSON save file: https://docs.godotengine.org/en/stable/tutorials/io/saving_games.html

Godot `Resource`:

- [Resource Saver Flags](https://docs.godotengine.org/en/stable/classes/class_resourcesaver.html?#enumerations)

Pokemon datasets:

- https://github.com/veekun/pokedex/tree/master/pokedex/data/csv
- https://github.com/lgreski/pokemonData
- https://www.kaggle.com/abcsds/pokemon

## Semplificazioni

- Pokemon solo dalla prima generazione
- Unico file di salvataggio
- Niente ottenimento delle abilità?
- Niente evoluzione Pokemon?
- Solo meccaniche di EV e IV (niente amicizia, natura, ecc.)
- Solo gioco single player preso in considerazione

Il focus dei tutorial è apprendere tutte le tecniche necessarie per implementare
meccaniche generali per un GDR.

Nei tutorial cercherò di coprire tutte le funzionalità necessarie a replicare
i sistemi della serie Pokemon, senza però creare un vero e proprio re-make di
tutte le meccaniche.

Una volta capito il funzionamento delle meccaniche di base, sarà facile
estendere il codice in base alle proprie esigenze.

Gli argomenti importanti sono:

- persistenza dei dati di gioco (pokemon catturati, esperienza ottenuta, ...) in
  un file di salvataggio
- caricamento del salvataggio nel gioco (aggiornare i dati dei nodi per
  riprendere il gioco)
- parsing di file CSV per inizializzare i dati del Pokedex (o database delle
  entità di gioco)
- struttura di classi, nodi e risorse per inizializzare il combat system
