class Vehiculo
  attr_reader :id, :precio, :propietarios

  def initialize(id, precio, propietarios = [])
    @id = id
    @precio = precio
    @propietarios = propietarios
  end

  def to_s
    "El coche con id #{@id} vale #{@precio} euros y tuvo los siguientes propietarios: #{@propietarios}"
  end

end