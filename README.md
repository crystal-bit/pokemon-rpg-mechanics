# Pokemon RPG mechanics

Argomenti vari da affrontare nel tutorial:

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

## TODO

- [ ] Controlla EffortValue se è collegato a tutte le statistiche oppure se è
  univoco per ogni stat.

## Funzionamento statistiche

Da: https://bulbapedia.bulbagarden.net/wiki/Effort_values#Stat_experience

> In Generations I and II, effort points given are equal to the base stats of the
defeated Pokémon species.

> The Pokémon data structure contains two EV bytes for each of the five stats
> (HP, Attack, Defense, Speed and Special), starting at zero when caught and
> with a maximum EV of 65535 for each stat.

> When a Pokémon is defeated, its base stats are converted to effort points and
> then added to the EVs. For example, defeating a Mew grants 100 effort points
> to each EV.

## Glossario

- [Base Stat](https://bulbapedia.bulbagarden.net/wiki/Base_stats)
- [Effort Value](https://bulbapedia.bulbagarden.net/wiki/Effort_values#Stat_experience)
- [Individual Values](https://bulbapedia.bulbagarden.net/wiki/Individual_values)
- [Stat formula](https://bulbapedia.bulbagarden.net/wiki/Statistic#In_Generations_I_and_II)

Note: 

> From Pokémon FireRed and LeafGreen to Pokémon Ultra Sun and Ultra Moon, EVs
> were also officially referred as base stats in English (distinct from what
> fans refer to as [base
> stats](https://bulbapedia.bulbagarden.net/wiki/Base_stats), which are instead
> the stat-affecting values intrinsic to the Pokémon's species).

## Problemi da verificare

### Risorse custom e inspector

Risorse custom inizializzate/assegnate a runtime non compaiono nel remote inspector
Si tratta di un bug: https://github.com/godotengine/godot/issues/41442

## Documentazione e link utili

- https://docs.godotengine.org/en/3.2/getting_started/workflow/best_practices/node_alternatives.html
- https://docs.godotengine.org/en/3.2/getting_started/step_by_step/resources.html