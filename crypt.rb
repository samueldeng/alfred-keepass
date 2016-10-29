def decrypt(data, key, iv)
	decode_cipher = OpenSSL::Cipher::Cipher.new("AES-256-CBC")
	decode_cipher.decrypt
	decode_cipher.key = Base64.decode64(key)
	decode_cipher.iv = Base64.decode64(iv)
	decode_cipher.update(Base64.decode64(data)) + decode_cipher.final
end

def encrypt(data, key, iv)
	cipher_nonce = OpenSSL::Cipher::Cipher.new("AES-256-CBC")
	cipher_nonce.encrypt
	cipher_nonce.key = Base64.decode64(key)
	cipher_nonce.iv = iv
	b64enc(cipher_nonce.update(data) + cipher_nonce.final)

end

def b64enc(data)
      Base64.encode64(data).gsub(/\n/, '')
end