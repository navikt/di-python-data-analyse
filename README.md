# Python Dataanalyse - Data og Informasjonsforvaltning

Dette repositoriet kan brukes for å validere lokalt pythonoppsett, og er ment som en standard for hvordan vi jobber med dataanalyse i Python i Data og Informasjonsforvaltning.

## Forberedelser

1. Sett opp maskinen ved å følge [Oppsett for ny Mac eller Linux](https://navikt.github.io/ny-i-nav/ny-unix.html) eller [Oppsett for ny Windows](https://navikt.github.io/ny-i-nav/ny-windows.html).
2. Installer [VS Code](https://code.visualstudio.com/download).
3. Klon repoet med [GitHub CLI](https://cli.github.com/).
4. Vi bruker **just** for å enkelt kjøre en rekke kommandoer. Installeres med `brew install just`. Les mer på [https://github.com/casey/just](https://github.com/casey/just).
5. Kjør `just install` og du er klar til å kjøre scripts.
    - Alternativt kan du kjøre kommandoen som er listet opp under `bootstrap`og `install` i `justfile`
6. Kjør `nais login` og velg riktig prosjekt om du skal jobbe mot GCP.
    - gcloud projects list
    - gcloud config set project PROJECT_ID

## Kjør et skript

I `__main__.py` ligger det kode som henter data fra et åpent datasett på BigQuery.
Koden kan kjøres med `uv run python -m di_python_data_analyse`, eller med `uv run bigquery` som er definert under `[project.scripts]` i `pyproject.toml`.

## Legg til en ny avhengighet

Prøv å legge til en ny avhengighet i prosjektet og ta den i bruk i `__main__.py`.

## Kort om nais og gcp

For å kunne kjøre spørringer mot BigQuery må du logge inn på et Google Cloud-prosjekt, og ha tilgangen `bigquery.JobUser` på prosjektet.
Når du blir medlem av et nais team, får du også tilgang til et Google Cloud-prosjekt.
Du kan lese mer på [nais sin dokumentasjon](https://docs.nais.io/) og [Google sin dokumentasjon](https://cloud.google.com/docs).

## Henvendelser

Spørsmål knyttet til koden eller repositoryet kan stilles som issues her på GitHub.

### For Nav-ansatte

Interne henvendelser kan sendes via Slack i kanalen [#data-science-golden-path](https://nav-it.slack.com/archives/C090Z1P4BM1).
