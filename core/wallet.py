from mnemonic import Mnemonic
from eth_account import Account


Account.enable_unaudited_hdwallet_features()


def generate_wallet():
    mnemo = Mnemonic("english")
    words = mnemo.generate(strength=128)
    acct = Account.from_mnemonic(words)

    return {
        "mnemonic": words,
        "address": acct.address,
        "private_key": acct.key.hex()
    }
