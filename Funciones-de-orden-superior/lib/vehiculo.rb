class Vehiculo
  include Comparable
  attr_accessor :id, :precio, :propietarios

  def initialize(id, precio, propietarios = [])
    @id = id
    @precio = precio
    @propietarios = propietarios
  end

  def to_s
    "El coche con id #{@id} vale #{@precio} euros y tuvo los siguientes propietarios: #{@propietarios}"
  end

  def <=>(other)
    @precio <=> other.precio
  end

  def +(precio)
    Vehiculo.new(@id, @precio + precio, @propietarios)
  end
end

# Funciones de orden superior
def mayorPrecio(consecionario)
  consecionario.max { |c| c.precio }.precio
end

def menorPrecio(consecionario)
  consecionario.min
end

# Polimorfismo
def sumarPrecio(consecionario, precio)
  consecionario.map { |c| c + precio}
end