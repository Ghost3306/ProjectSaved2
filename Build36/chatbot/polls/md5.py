import hashlib
 
def md5_encode(str):
    res = hashlib.md5(str.encode())
    return res.hexdigest()
