# encoding: utf-8
query = "{query}"

require "openssl"
require "base64"
require "net/http"
require "json"
load "alfred_workflow.rb"
load "crypt.rb"

keepass_server = "http://localhost:19455"
key_name = "MBP-Chrome"
aes_key = "DBn3Wrqd7rFHu8cgPXCnEzIWgaUXcRXzOplkskcy9fo="
# url = "http://" + query
url = ARGV[0]


iv = OpenSSL::Cipher::Cipher.new("AES-256-CBC").random_iv
nonce = b64enc(iv)

veri = encrypt(nonce, aes_key, iv)
url = encrypt(url, aes_key, iv)

query_body = {
  RequestType: "get-logins",
  Id: key_name,
  Nonce: nonce,
  Verifier: veri,
  Url: url,
}.to_json

# puts query_body

uri = URI(keepass_server)
req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
req.body = query_body
res = Net::HTTP.start(uri.hostname, uri.port) do |http|
  http.request(req)
end
# puts res.body

body = JSON.parse(res.body)
resp_nonce = body["Nonce"]
# puts body["Entries"]


alfred_xml =  AlfredXmlFormatter.new
entries = body["Entries"]
entries.each do |entry|
	title = entry["Name"]
	username = entry["Login"]
	password = entry["Password"]

	title_plain = decrypt(title, aes_key, resp_nonce)
	username_plain = decrypt(username, aes_key, resp_nonce)
	password_plain = decrypt(password, aes_key, resp_nonce)

	kp = KeepassItem.new(title_plain, username_plain, password_plain)
	alfred_xml.add_kp(kp)
	
end

puts alfred_xml.to_string
