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

- [ ] Controlla EffortValue se è collegato a tutte le statistiche oppure se è univoco
per ogni stat.

## Problemi da verificare

### Risorse custom e inspector

Risorse custom inizializzate/assegnate a runtime non compaiono nel remote inspector
Si tratta di un bug: https://github.com/godotengine/godot/issues/41442

## Documentazione e link utili

- https://docs.godotengine.org/en/3.2/getting_started/workflow/best_practices/node_alternatives.html
- https://docs.godotengine.org/en/3.2/getting_started/step_by_step/resources.html