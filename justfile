default:
    @just --list --unsorted

# Installerer nødvendige pakker for andre kommandoer
bootstrap:
    @printf "Sørger for at nødvendige pakker er installert\n"
    @uv --version > /dev/null 2>&1 || brew install uv
    @nais --version > /dev/null 2>&1 || brew tap nais/tap || brew install nais

# Setter opp miljøet
install: bootstrap
    @printf "Setter opp miljøet\n"
    @uv sync --dev

# Oppgrader dependencies og setter opp miljøet på nytt
update-dependencies: bootstrap
    @printf "Oppgraderer dependencies\n"
    @uv sync --upgrade --dev

# Kjører linting
lint:
    @printf "Linter kode\n"
    @uv run ruff check .

# Formaterer koden
format:
    @printf "Formaterer kode\n"
    @uv run ruff format .

# Generer requirements.txt
requirements:
    @printf "Genererer requirements.txt\n"
    @uv export --no-emit-workspace --no-dev --no-annotate --no-header --no-hashes --output-file requirements.txt

# Test bigquerykobling
test-bigquery:
    @printf "Tester bigquerykobling\n"
    @gcloud auth print-identity-token >/dev/null 2>&1 || nais login
    @uv run bigquery

