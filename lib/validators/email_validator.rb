class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    record.errors.add(attribute, :invalid) unless email_valid?(value)
  end

  private

  def email_valid?(value)
    URI::MailTo::EMAIL_REGEXP.match?(value)
  end
end
