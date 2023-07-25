class ErrorSerializer
  def self.error_message(error)
    {"errors": [{ detail: error.message }]}
  end
end