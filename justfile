default:
    @just --list --unsorted

# Installerer nødvendige pakker for andre kommandoer
bootstrap:
    @uv --version > /dev/null 2>&1 || brew install uv
    @nais --version > /dev/null 2>&1 || brew tap nais/tap || brew install nais
    @gcloud --version > /dev/null 2>&1 || brew install --cask google-cloud-sdk

# Setter opp virtuelt python-miljø
install: bootstrap
    @printf "Setter opp miljøet\n"
    @uv sync --dev

# Oppgrader dependencies og setter opp miljøet på nytt
update-dependencies: bootstrap
    @printf "Oppgraderer dependencies\n"
    @printf "Husk å sjekke inn endringer i pyproject.toml og uv.lock"
    @uv sync --upgrade --dev

# Kjører linting
lint: bootstrap install
    @printf "Linter kode\n"
    @uv run ruff check .

# Formaterer koden
format: bootstrap install
    @printf "Formaterer kode\n"
    @uv run ruff format .

# Precommit
precommit: bootstrap install format lint
    @printf "Precommit er ferdig\n"

# Generer requirements.txt
requirements: bootstrap install
    @printf "Genererer requirements.txt\n"
    @uv export --no-emit-workspace --no-dev --no-annotate --no-header --no-hashes --output-file requirements.txt

# Logger inn om nødvendig
login: bootstrap
    @gcloud auth print-identity-token >/dev/null 2>&1 || nais login

# Test bigquerykobling
test-bigquery: bootstrap install login
    @printf "Tester bigquerykobling\n"
    @uv run bigquery
