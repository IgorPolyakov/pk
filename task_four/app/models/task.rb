# frozen_string_literal: true

require 'digest'
class Task
  include Mongoid::Document
  before_create :set_value
  field :description, type: String
  field :decode, type: String
  field :status, type: Boolean
  field :digest, type: String
  field :digest_type, type: String

  def check_answer
    var = eval "Digest::#{digest_type}.hexdigest decode.to_s"
    if var == digest
      self.status = true
      save
      { "status": 'good_job' }
    else
      { "status": 'wrong' }
    end
  end

  private

  def set_value
    self.digest_type = get_rand_digest_type
    self.digest = eval "Digest::#{digest_type}.hexdigest rand(1000..9999).to_s"
    self.status = false
  end

  def get_rand_digest_type
    %w[MD5 RMD160 SHA1 SHA512 SHA384 SHA256].sample
  end
end
