# Hacer con Unit Testing una clase que representa una receta de cocina.
# La receta tendrá un identificador numérico, un conjunto de ingredientes (nombre y cantidad)
# Y el precio que costaría hacer esa receta.

class Receta
  include Comparable
  attr_reader :id, :ingredientes, :precio

  def initialize(id, ingredientes, precio)
    @id = id
    @ingredientes = ingredientes
    @precio = precio
  end

  def to_s
    "La receta con id #{@id} usa los siguientes ingredientes: #{@ingredientes} y tiene de precio #{@precio}"
  end

  def <=>(other)
    precio <=> other.precio
  end
end

# Obtener el nombre del producto que se necesita la mayor cantidad en un recetario
def obtenerProducto(recetario)
  productos = recetario.flat_map { |r| r.ingredientes }
  productos.max { |p| p[:cantidad] }[:nombre]
end

# Obtener la receta con mayor precio
def maxCostosa(recetario)
  recetario.max
end

# Obtener la receta que requiera mayor cantidad de ingredientes
def sumarCantidades(ingredientes)
  suma = 0
  for i in 0...ingredientes.size
    suma += ingredientes[i][:cantidad]
  end
  suma
end

def mayorCantidad(recetario)
  recetario.max_by { |r| sumarCantidades(r.ingredientes)}
end

# Dado un recetario y un ingrediente devolver la receta que requiera mayor cantidad de dicho ingrediente
def calcularMayorCantidad(ingredientes, nombre)
  cantidad = 0
  for i in 0...ingredientes.size
    if ingredientes[i][:nombre] == nombre && ingredientes[i][:cantidad] > cantidad
      cantidad = ingredientes[i][:cantidad]
    end
  end
  cantidad
end

def obtenerReceta(recetario, nombre)
  recetas = recetario.select { |r| r.ingredientes.select { |i| i[:nombre] == nombre}}
  recetas.max_by { |r| calcularMayorCantidad(r.ingredientes, nombre)}
end

# En una cocina, un chef debe de llevar un alimento a la olla pero primero debe recogerlo en una mesa.
# Ralizar con hilos esta situación

mutex = Mutex.new
CV = ConditionVariable.new

def recogerIngrediente(ingrediente)
  puts "El chef recogio el #{ingrediente}" 
end

def dejarEnOlla(ingrediente)
  puts "El chef dejo el #{ingrediente} en la olla"
end

hilo1 = Thread.new do
  mutex.synchronize do
    recogerIngrediente("arroz")
    CV.signal
  end
end

hilo2 = Thread.new do
  mutex.synchronize do
    CV.wait(mutex)
    dejarEnOlla("arroz")
  end
end

hilo1.join
hilo2.join