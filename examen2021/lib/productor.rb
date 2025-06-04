####################################### Pregunta 1 ##########################################
# Desarrolle con RSpec la clase Productor que representa a una empresa agrícola. Ha de
# contar con un identificador que almacenará el nombre de la empresa, un conjunto de cultivos
# que almacenará la siguiente información para cada cultivo (nombre, superficie, temporada),
# y un conjunto que almacenará los dos valores que multiplicados dan el volumen de ventas
# de la empresa (total_productos_vendidos, precio_unitario_venta).
#############################################################################################

class Productor
  attr_reader :id, :cultivos, :valores

  def initialize(id, cultivos, valores)
    @id = id
    @cultivos = cultivos
    @valores = valores
  end

  def to_s
    "El productor con id #{@id} tiene los siguientes cultivos: #{@cultivos} y tiene los siguientes valores: #{@valores}"
  end

  def volumen_ventas
    @valores[0] * @valores[1]
  end
end