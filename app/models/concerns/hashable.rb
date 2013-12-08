module Hashable

  def self.included(base)
    base.extend(ClassMethods)
  end

  def encrypt
    hashids = Hashids.new ENV['HASH_SALT']
    hashids.encrypt(self.id)
  end

  module ClassMethods
    def decrypt(num)
      # TODO figure out the best place for this
      hashids = Hashids.new ENV['HASH_SALT']
      num = hashids.decrypt(num)
      Post.find_by(:id => num)
    end
  end
end