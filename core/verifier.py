from eth_account import Account
from eth_account.messages import encode_defunct


def verify_signature(address: str, message: str, signature: str) -> bool:
    msg = encode_defunct(text=message)
    recovered = Account.recover_message(msg, signature=signature)
    return recovered.lower() == address.lower()
