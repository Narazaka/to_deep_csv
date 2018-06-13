require "csv"

class Array
  # to_csv for Array<Array>, Array<Hash>, Array<ActiveRecord::Base>, ActiveRecord::Relation etc.
  #
  # @param [Hash] options CSV options + alpha
  # @option options [Array<Symbol>] column names
  #
  # @example
  #   [{a: 1, b: 2}].to_deep_csv(headers: true)
  #   [[1, 2]].to_deep_csv
  #   [[1, 2]].to_deep_csv(headers: true, columns: [:a, :b])
  #   Foo.all.to_deep_csv(headers: true)
  #   Foo.all.to_deep_csv(columns: [:id, :name])
  #   Foo.all.select(:id, :name).to_deep_csv
  #   {:a => 1}.to_a.to_deep_csv
  #   Foo.all.group(:type).count.to_a.to_deep_csv(headers: true, columns: [:type, :count])
  def to_deep_csv(options = {})
    # true if Hash like
    columns_by_first = self.first.try(:attributes).try(:keys) || self.first.try(:keys)
    columns = options.delete(:columns) || columns_by_first
    CSV.generate("", options) do |csv|
      csv << columns if columns && options[:headers]
      self.each do |record|
        csv << if columns_by_first # Hash like
                 columns.map do |column|
                   Array(column).reduce(record) {|target, key| target.try(key) || target[key] }
                 end
               else # Array like
                 record
               end
      end
    end
  end
end
