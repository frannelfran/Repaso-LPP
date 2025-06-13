# Hacer con Unit Testing una clase que representa una receta de cocina.
# La receta tendrá un identificador numérico, un conjunto de ingredientes (nombre y cantidad)
# Y el precio que costaría hacer esa receta.

class Receta
  attr_reader :id, :ingredientes, :precio

  def initialize(id, ingredientes, precio)
    @id = id
    @ingredientes = ingredientes
    @precio = precio
  end

  def to_s
    "La receta con id #{@id} usa los siguientes ingredientes: #{@ingredientes} y tiene de precio #{@precio}"
  end
end