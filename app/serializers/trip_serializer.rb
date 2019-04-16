class TripSerializer < ActiveModel::Serializer
  attributes :id, :place, :street, :city, :state, :zip, :from_date, :to_date, :families_joining,
            :tripfamilies
end
