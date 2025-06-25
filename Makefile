# Detect OS for compatibility
OS := $(shell uname -s)

# Venv activate prefix
ifeq ($(OS),Windows_NT)
	VENV_ACTIVATE = .\.venv\Scripts\activate
	PYTHON = .\.venv\Scripts\python
	PIP = .\.venv\Scripts\pip
else
	VENV_ACTIVATE = source .venv/bin/activate
	PYTHON = .venv/bin/python
	PIP = .venv/bin/pip
endif

# -----------------------------
# 🛠️  Setup and install
# -----------------------------

install:
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt

venv:
	python -m venv .venv
	$(MAKE) install

env:
	cp .env.example .env

# -----------------------------
# 🚀 Run
# -----------------------------

run-api:
	$(PYTHON) -m uvicorn api.main:app --reload

create:
	$(PYTHON) cli/main.py create

sign:
	$(PYTHON) cli/main.py sign

# -----------------------------
# 🧪 Tests & Lint
# -----------------------------

test:
	$(PYTHON) -m pytest tests

lint:
	ruff .

# -----------------------------
# 🧼 Clean
# -----------------------------

clean:
	rm -rf __pycache__ .pytest_cache .venv *.pyc .mypy_cache

# -----------------------------
# 🧩 Help
# -----------------------------

help:
	@echo "🛠  Makefile commands:"
	@echo "  venv        - create a virtual environment"
	@echo "  install     - install dependencies"
	@echo "  env         - create .env from template"
	@echo "  run-api     - start FastAPI server"
	@echo "  create      - generate an Ethereum wallet"
	@echo "  sign        - sign a message"
	@echo "  test        - run tests"
	@echo "  lint        - run linter (ruff)"
	@echo "  clean       - remove temporary files"