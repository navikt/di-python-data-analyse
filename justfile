default:
    @just --list



# Installerer nødvendige pakker for andre kommandoer
bootstrap:
    @printf "Installerer nødvendige pakker\n"
    @uv --version || brew install uv
    @nais --version || brew install nais || brew tap nais/tap

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
    @uv run sync --no-dev
    @uv pip freeze > requirements.txt
    @uv run sync --dev
    @grep -v '^-e ' requirements.txt > requirements.txt.temp && mv requirements.txt.temp requirements.txt

# Test bigquerykobling
test-bigquery *args:
    @if [[ "{{args}}" == *"--auth"* ]]; then printf "Logger inn med nais...\n"; nais login; fi
    @printf "Tester bigquerykobling\n"
    @uv run bigquery

