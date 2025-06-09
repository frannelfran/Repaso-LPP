# Desarrolle con Unit Testing la clase Sostenible, que representa una granja sostenible. 
# Debe tener un identificador que almacenará el nombre de la granja, un conjunto de valores 
# correspondientes a sus huellas (de carbono,  huella hídrica) y un conjunto de animales 
# (Identificador, tipo y precio). Describe la jerarquía de clases y estructura de directorio.

class Sostenible
  attr_reader :id, :huellas, :animales

  def initialize(id, huellas, animales)
    @id = id
    @huellas = huellas
    @animales= animales
  end

  def to_s
    "La granja con id #{@id} tiene las siguientes huellas #{@huellas} y los siguientes animales: #{@animales}"
  end
end