# Python Dataanalyse - Data og Informasjonsforvaltning

**Dette repositoriet har følgende formål:**

- Validere at lokalt Python-oppsett fungerer som forventet.
- Vise verktøy og oppsett som gjør datautvikleropplevelsen bedre.
- På sikt være en standard for datanalyse i Python i Data og Informasjonsforvaltning, med eksempler som kan brukes i andre prosjekter.

## Validere lokalt Python-oppsett

Dette er lagt opp til å være en interaktiv sesjon, feks med nyansatte.
Det vil sikre at alle kan kjøre Python-kode på samme måte, og vil gi noe innføring i kjekke verktøy.

### Forberedelser

1. Sett opp maskinen ved å følge [Oppsett for ny Mac eller Linux](https://navikt.github.io/ny-i-nav/ny-unix.html) eller [Oppsett for ny Windows](https://navikt.github.io/ny-i-nav/ny-windows.html).
2. Installer [VS Code](https://code.visualstudio.com/download).
3. Klon repoet med [GitHub CLI](https://cli.github.com/).
4. Vi bruker **just** for å enkelt kjøre en rekke kommandoer. Installeres med `brew install just`. Les mer på [https://github.com/casey/just](https://github.com/casey/just).
5. Kjør `just install` og du er klar til å kjøre scripts.
   - Alternativt kan du kjøre kommandoen som er listet opp under `bootstrap`og `install` i `justfile`
6. Kjør `nais login` og velg riktig prosjekt om du skal jobbe mot GCP.
   - `gcloud projects list`
   - `gcloud config set project PROJECT_ID`

### Kjør et skript

I `__main__.py` ligger det kode som henter data fra et åpent datasett på BigQuery.
Koden kan kjøres med `uv run python -m di_python_data_analyse`, eller med `uv run bigquery` som er definert under `[project.scripts]` i `pyproject.toml`.

### Legg til en ny avhengighet

Prøv å legge til en ny avhengighet i prosjektet og ta den i bruk i `__main__.py`.

## Kort om nais, gcp og nada

For å kunne kjøre spørringer mot BigQuery må du logge inn på et Google Cloud-prosjekt, og ha tilgangen `bigquery.JobUser` på prosjektet.
Når du blir medlem av et nais team, får du også tilgang til et Google Cloud-prosjekt.
Du kan lese mer på [nais sin dokumentasjon](https://docs.nais.io/) og [Google sin dokumentasjon](https://cloud.google.com/docs).
Nada er et dataplattformteam i Nav som drifter [Datamarkedsplassen](https://data.ansatt.nav.no/) og tilrettelegger for kodebasert dataanalyse.
[Nada har egen dokumentasjon](https://docs.knada.io/) om Airflow, Jupyter notebooks mot onprem, Metabase og mer.

## Formatering og linting

Formålet med formatering er å gjøre koden mer lesbar og konsistent, mens linting hjelper oss med å oppdage potensielle feil og å forbedre kodekvaliteten.\
Eksempler på formatering: `mellomrom, linjeskift, strengformatering, osv`.\
Eksempler på linting: `ubrukte variabler, feil bruk av funksjoner, typesjekker, osv`.

Dette repoet bruker ruff til formatering og linting.
Innstillinger settes i pyproject.toml.
For linting kan man inkludere og ekskluder regler under `tool.ruff.lint`.
Ruff har et sett med default-regler som kan endre seg i nye versjoner.
Det kan derfor være lurt å velge et spesifikt sett med regler.

I justfilen finnes kommandoen : `precommit`, som kjører linting og formatering.
Her kan du legge til flere kommandoer du ønsker at skal kjøres før kode committes.


## Kort om dependabot og Ghep

Dependabot hjelper oss å holde avhengighetene i prosjektet oppdatert, som er viktig for sikkerhet og stabilitet.
[Ghep, eller GitHub Event Pusher](https://github.com/navikt/ghep), er en Github App laget av [Kyrre](https://github.com/Kyrremann) som sender meldinger til Slack når det skjer noe i repositoriet.
Kombinasjonen av disse to gir oss en god oversikt over endringer i prosjektet, feks sikkerhetshull i pakkene som blir brukt og commits.

Dependabot konfigureres i `.github/dependabot.yaml`, og vil automatisk foreslå å oppdatere avhengighetene i prosjektet med pull requests.
Ghep konfigureres i repoet `navikt/ghep`.

## Python-versjoner

Vi spesifiserer Python-versjon på to måter:

- `pyproject.toml`: minimum versjon prosjektet støtter
- `.python-version`: spesifikk versjon vi bruker lokalt

Bruk samme Python-versjon lokalt som i produksjon (feks Airflow eller naisjob) for å unngå kompatibilitetsproblemer.

Eks: du kjører 3.13 lokalt, og spesifiserer det i `pyproject.toml`, men Airflow-instansen kjører 3.11.
Da vil uv forsøke å laste ned 3.13 for hver kjøring i Airflow.

## Henvendelser

Spørsmål knyttet til koden eller repositoryet kan stilles som issues her på GitHub.

### For Nav-ansatte

Interne henvendelser kan sendes via Slack i kanalen [#data-science-golden-path](https://nav-it.slack.com/archives/C090Z1P4BM1).
