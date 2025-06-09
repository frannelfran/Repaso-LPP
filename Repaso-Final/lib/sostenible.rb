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

# Cooperativa de granjas que indican sus dos valores de huellas mediante
# hilos para hallar cada uno de sus valores

granja1 = Sostenible.new(1, {carbono: 3, hidrica: 5}, [
      {id: "Vaca", tipo: "Mamifero", precio: 3.5},
      {id: "Cerdo", tipo: "Mamifero", precio: 2.8}
    ])
    granja2 = Sostenible.new(2, {carbono: 2, hidrica: 4}, [
      {id: "Oveja", tipo: "Mamifero", precio: 2.0}
    ])
    granja3 = Sostenible.new(3, {carbono: 5, hidrica: 3}, [
      {id: "Gallina", tipo: "Ave", precio: 1.5},
      {id: "Pato", tipo: "Ave", precio: 1.8},
      {id: "Pavo", tipo: "Ave", precio: 2.2}
    ])

@cooperativa = [granja1, granja2, granja3]

threads = []
for i in 0...@cooperativa.size
  hilo = Thread.new do
    puts "La granja #{@cooperativa[i].id} tiene las huellas: #{@cooperativa[i].huellas}"
  end
  threads.push(hilo)
end

for i in 0...threads.size
  threads[i].join
end