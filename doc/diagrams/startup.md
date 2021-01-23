# Code diagrams

To preview diagrams in VSCode, install Mermaid extension.

## Startup

Startup
```mermaid
sequenceDiagram
participant M as Main
participant C as Combat
M->>M: load_or_create_savefile()
M->>C: init_pokemons(poke)
```