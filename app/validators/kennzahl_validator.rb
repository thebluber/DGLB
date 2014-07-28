class KennzahlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /[0-9]+:[0-9]+/
      record.errors[attribute] << (options[:message] || "Kennzahl hat nicht das richtige Format. (z.B. 1234:1)")
    end
  end
end
