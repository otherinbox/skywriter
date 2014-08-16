module Skywriter
  module ArgumentParser
    private

    def access_liberally(object, key)
      object[key.to_sym] ||
        object[key.to_s] ||
        object[key.to_s.camelcase.to_sym] ||
        object[key.to_s.camelcase.to_s]
    end

    def delete_liberally(hash, key)
      hash.delete(key.to_sym) ||
        hash.delete(key.to_s) ||
        hash.delete(key.to_s.camelcase) ||
        hash.delete(key.to_s.camelcase.to_sym)
    end
  end
end
