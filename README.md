# EthForge 🔐

A simple CLI and REST API for:
- ✅ Generating Ethereum wallets (HD wallet)
- 🔐 Retrieving the private key
- ✍️ Signing and ✅ verifying messages
- 🌐 Interacting via both Web interface and CLI

## 🚀 Installation

```bash
git clone https://github.com/Escape198/EthForge.git
cd ethforge
python -m venv venv
source env/bin/activate # or .\venv\Scripts\activate on Windows
pip install -r requirements.txt
```

## ⚙️ Quick Start

```bash
make run-api   # start the FastAPI server
make create    # generate a new wallet
make sign      # sign a message
```

## 📡 REST API

```bash
GET /wallet/create - Generates a new wallet

POST /wallet/sign - Signs a message

POST /wallet/verify - Verifies a signature
```

## 📟 CLI
```bash
python cli/main.py create
python cli/main.py sign
```

## 🧪 Tests
```bash
make test
```

## 🛡 Security
The private key is never stored.

HD Wallet support (BIP39).

Safe interaction via CLI and REST API.
