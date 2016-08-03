module InstanceMethodsORM

  # Escape a string for an SQL query.
  # 
  # string - the string to be escaped
  #
  # Returns the escaped String.
  def escape(string)
    string = SQLite3::Database.quote(string)
    "'#{string}'"
  end

  # Formats values for a SQL query.
  # 
  # values - the array of values
  #
  # Returns an Array of values with the strings escaped.
  def format_values(values)
    values.map do |value|
      if value.class.to_s == "String"
        escape(value)
      else
        value
      end
    end
  end

  # Gets the name of the table for a given instance's class.
  # Kind of a hacky way to pluralize.
  #
  # Returns a String of the table name.
  def table
    self.class.to_s.downcase + "s"
  end

  # Deletes an item from the database.
  def delete
    DB.execute("DELETE FROM #{table} WHERE id = #{id}")
  end

  # Gets a list of the columns for this table.
  #
  # Returns an Array of Strings of the column names.
  def columns
    DB.execute2("SELECT * FROM #{table}")[0]
  end

  # Makes a list of the data stored on this object that needs to go in the DB.
  # Based on the columns of the current table.
  # Removes nil values.
  #
  # Returns a Hash of columns and their values.
  def fields
    fields = columns.map {|field| [field, instance_variable_get("@#{field}")]}
    Hash[fields].reject{ |k, v| v.nil? }
  end

  # Saves an item to the database.
  def save
    keys = fields.keys.join(",")
    values = format_values(fields.values).join(",")

    DB.execute("INSERT INTO #{table} (#{keys}) VALUES (#{values})")
    @id = DB.last_insert_row_id
  end

  # Updates an item's attributes to match the provided hash.
  # Also stores them in the database.
  #
  # attributes - a hash of column names and their values
  def update(attributes)
    attributes.each do |k, v|
      instance_variable_set("@#{k}", v)
    end
    values = attributes.map { |k, v| "#{k}=#{escape(v)}"}.join(",")
    DB.execute("UPDATE #{table} SET #{values} WHERE id=#{id}")
  end

end