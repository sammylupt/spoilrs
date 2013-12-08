module Hashable

  def self.included(base)
    base.extend(ClassMethods)
  end

  def encrypt
    self.class.hashids.encrypt(self.id)
  end

  module ClassMethods
    def decrypt(num)
      num = hashids.decrypt(num)
      Post.find_by(:id => num)
    end

    def hashids
      @hashids ||= Hashids.new ENV['HASH_SALT']
    end

  end
end