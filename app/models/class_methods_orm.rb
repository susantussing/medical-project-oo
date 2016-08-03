module ClassMethodsORM

  def table
    name.downcase + "s"
  end

  def find(id)
    result = DB.execute("SELECT * FROM #{table} WHERE id = #{id}")[0]
    if result.nil?
      nil
    else
      self.new(result)
    end
  end

end
