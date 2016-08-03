module ClassMethodsORM

  # Gets the name of the table for a given class.
  # Kind of a hacky way to pluralize.
  #
  # Returns a String of the table name.
  def table
    name.downcase + "s"
  end

  # Escape a string for an SQL query.
  # 
  # string - the string to be escaped
  #
  # Returns the escaped String.
  def escape(string)
    SQLite3::Database.quote(string)
  end

  # Finds an item in this table.
  # 
  # id - the ID of the row
  #
  # Returns an Object of the given class.
  def find(id)
    result = DB.execute("SELECT * FROM #{table} WHERE id = #{id}")[0]
    if result.nil?
      nil
    else
      self.new(result)
    end
  end

  # Finds multiple items matching the search parameters.
  #
  # search_params - a hash of column names and values
  #
  # Returns an Array of Objects of the given class.
  def where(search_params)
    search_array = search_params.collect do |k, v|
      k.to_s + "='" + escape(v.to_s) + "'"
    end
    where = search_array.join(" AND ")

    results = DB.execute("SELECT * FROM #{table} WHERE #{where}")
    results.map { |result| self.new(result)}

  end

  # Gets all items in this class from the database.
  #
  # Returns an Array of Objects of the given class.
  def all
    results = DB.execute("SELECT * FROM #{table}")
    results.map { |result| self.new(result)}
  end

end
