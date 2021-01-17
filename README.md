# Pokemon RPG mechanics

## Argomenti

1. Caricamento dati da file esterno
   1. Formato dati
      1. **csv**
      2. sqlite
      3. json
   2. script loading
2. `class_name`
3. Risorse
   1. Export risorse
   2. Modifica di una risorsa dall'inspector
   3. Side effects ?
   4. `func _to_string() -> String:` per migliore leggibilità

## Domande e dubbi che potrei approfondire

- Che differenza c'è tra usare Resource e usare un altro tipo di file (csv,
  ConfigFile, ...)?

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

### File salvataggio non mostra i valori corretti dall'inspector dopo averlo salvato

Spesso capita che l'inspector non mostri i valori corretti perché credo che
le risorse vengano caricate solamente all'avvio.

Se cambiamo il file della risorsa, bisogna riavviare Godot.

Forse c'è un modo altenrativo per ricaricare le risorse ma non lo conosco.

## Documentazione e link utili

- https://docs.godotengine.org/en/3.2/getting_started/workflow/best_practices/node_alternatives.html
- https://docs.godotengine.org/en/3.2/getting_started/step_by_step/resources.html
- JSON save file: https://docs.godotengine.org/en/stable/tutorials/io/saving_games.html
---
- GDQuest: [Godot Save Game Tutorial: Save and load using Resources](https://youtu.be/ML-hiNytIqE)

## Semplificazioni

Pokemon è un gioco molto complesso, per semplificare i tutorial ho deciso di
fare delle assunzioni:

- Unico file di salvataggio
- Pokemon solo dalla prima generazione
- Solo meccaniche di EV e IV (niente amicizia)
- Solo gioco single player preso in considerazione (il gioco online
   richiederebbe accorgimenti in più per garantire l'unicità dei Pokemon e la
   loro validità)