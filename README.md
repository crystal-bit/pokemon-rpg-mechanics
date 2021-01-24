# Pokemon RPG mechanics

## Meccaniche da implementare

- [ ] Database Pokemon Generazione I
  - [x] Tabella statistiche pokemon
  - [x] Tabella mosse
  - [ ] ? Tabella associativa tra pokemon e mosse iniziali
  - [ ] ? Tabella associativa tra pokemon e mosse da sbloccare per ogni livello (https://gamefaqs.gamespot.com/gameboy/367023-pokemon-red-version/faqs/5764)
  - [ ] ? Tabella evoluzioni: https://gamefaqs.gamespot.com/gameboy/367023-pokemon-red-version/faqs/5770
- [ ] Salvataggio gioco
  - [x] Salvataggio pokemon catturati
  - [ ] Salvataggio statistiche pokemon catturati (EV, IV, exp, mosse sbloccate, ...)
- [ ] Combattimento
- [ ] Leveling up

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
   3. Side effects? Se una risorsa viene usata in posti diversi ed è la stessa
   istanza, tutte le reference verranno aggiornate.
   1. `func _to_string() -> String:` per migliore leggibilità
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

## Documentazione e link utili

Save system:

- GDQuest: [Godot Save Game Tutorial: Save and load using Resources](https://youtu.be/ML-hiNytIqE)
- JSON save file: https://docs.godotengine.org/en/stable/tutorials/io/saving_games.html

Godot `Resource`:

- [Resource Saver Flags](https://docs.godotengine.org/en/stable/classes/class_resourcesaver.html?#enumerations)

Pokemon datasets:

- ⭐️ CSV: https://github.com/veekun/pokedex/tree/master/pokedex/data/csv
- ⭐️ SQLite: https://github.com/decentralion/PokemonSQLTutorial
- https://gamefaqs.gamespot.com/gameboy/367023-pokemon-red-version/faqs/5770
- https://github.com/lgreski/pokemonData
- https://www.kaggle.com/abcsds/pokemon

Pokemon team builder:

- https://play.pokemonshowdown.com/teambuilder

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

## Altre info

Vedi cartella `./doc`