# Desarrolle con Unit Testing la clase Sostenible, que representa una granja sostenible. 
# Debe tener un identificador que almacenará el nombre de la granja, un conjunto de valores 
# correspondientes a sus huellas (de carbono,  huella hídrica) y un conjunto de animales 
# (Identificador, tipo y precio). Describe la jerarquía de clases y estructura de directorio.

class Sostenible
  include Comparable
  attr_reader :id, :huellas, :animales

  def initialize(id, huellas, animales)
    @id = id
    @huellas = huellas
    @animales= animales
  end

  def to_s
    "La granja con id #{@id} tiene las siguientes huellas #{@huellas} y los siguientes animales: #{@animales}"
  end

  def <=>(other)
    huellas[:carbono] + huellas[:hidrica] <=> other.huellas[:carbono] + other.huellas[:hidrica]
  end
end

def maxSostenible(cooperativa)
  cooperativa.min
end

# Dada una cooperativa y un tipo de animal, obtener el mayor precio para ese tipo de animal
def mayorPrecio(cooperativa, tipo)
  precios = cooperativa.flat_map { |s| s.animales.select { |a| a[:tipo] == tipo}}
  precios = precios.flat_map { |a| a[:precio]}
  precios.max
end