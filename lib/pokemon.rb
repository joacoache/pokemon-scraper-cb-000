class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ( ?, ? )", [name, type])
  end

  def self.find(id, db)
    a = db.execute("SELECT * FROM pokemon WHERE id = ?;", [id]).flatten
    self.new(id: a[0], name: a[1], type: a[2], db: db)
  end

end
