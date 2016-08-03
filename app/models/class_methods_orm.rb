module ClassMethodsORM

  def table
    name.downcase + "s"
  end

  def escape(string)
    SQLite3::Database.quote(string)
  end

  def find(id)
    result = DB.execute("SELECT * FROM #{table} WHERE id = #{id}")[0]
    if result.nil?
      nil
    else
      self.new(result)
    end
  end

  def where(search_params)
    search_array = search_params.collect do |k, v|
      k.to_s + "='" + escape(v.to_s) + "'"
    end
    where = search_array.join(" AND ")

    results = DB.execute("SELECT * FROM #{table} WHERE #{where}")
    results.map! { |result| self.new(result)}
    results
  end


end
