if defined?(ActiveRecord::Relation)
  class ActiveRecord::Relation
    delegate :to_deep_csv, to: :to_a
  end
end
