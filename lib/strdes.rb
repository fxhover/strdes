# String encryption and decryption
class Strdes
  require 'openssl'
  require 'base64'

  ALG = 'DES-EDE3-CBC'
  KEY = 'uryeiowl'
  DES_KEY = 'uyiofs3w'

  class << self
    # String encryption
    # Example:
    #   >> Strdes.encode("need encryption string")
    #   => "SuO9XVv5gV3TqeNIocUTp-5APhtRTeMr"
    # Arguments:
    #   str: (String)
    def encode(str)
      des = OpenSSL::Cipher::Cipher.new ALG
      des.pkcs5_keyivgen KEY, DES_KEY
      des.encrypt
      cipher = des.update str
      cipher << des.final
      Base64.urlsafe_encode64 cipher
    end

    # String decryption
    # Example:
    #   >> Strdes.decode("SuO9XVv5gV3TqeNIocUTp-5APhtRTeMr")
    #   => "need encryption string"
    # Arguments:
    #   str: (String)
    def decode(str)
      str = Base64.urlsafe_decode64 str
      des = OpenSSL::Cipher::Cipher.new ALG
      des.pkcs5_keyivgen KEY, DES_KEY
      des.decrypt
      des.update(str) + des.final
    end
  end
end
