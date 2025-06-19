# Python Dataanalyse - Data og Informasjonsforvaltning 

Dette repositoriet kan brukes for å validere lokalt pythonoppsett, og er ment som en standard for hvordan vi jobber med dataanalyse i Python i Data og Informasjonsforvaltning.


## Forberedelser

1. Sett opp maskinen ved å følge [Oppsett for ny Mac eller Linux](https://navikt.github.io/ny-i-nav/ny-unix.html) eller [Oppsett for ny Windows](https://navikt.github.io/ny-i-nav/ny-windows.html).
2. Installer [VS Code](https://code.visualstudio.com/download).
3. Installer uv med `brew install uv`.
4. Klon repoet med [GitHub CLI](https://cli.github.com/).
5. Opprett et virtuelt miljø og installer avhengigheter med `uv sync`.


## Kjør et skript

I `__main__.py` ligger det kode som henter data fra et åpent datasett på BigQuery.
Koden kan kjøres med `uv run python -m di_python_data_analyse`, eller med `uv run bigquery` som er definert under `[project.scripts]` i `pyproject.toml`.


## Legg til en ny avhengighet

Prøv å legge til en ny avhengighet i prosjektet og ta den i bruk i `__main__.py`.