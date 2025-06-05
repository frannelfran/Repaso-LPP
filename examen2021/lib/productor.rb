####################################### Pregunta 1 ##########################################
# Desarrolle con RSpec la clase Productor que representa a una empresa agrícola. Ha de
# contar con un identificador que almacenará el nombre de la empresa, un conjunto de cultivos
# que almacenará la siguiente información para cada cultivo (nombre, superficie, temporada),
# y un conjunto que almacenará los dos valores que multiplicados dan el volumen de ventas
# de la empresa (total_productos_vendidos, precio_unitario_venta).
#############################################################################################

class Productor
  include Comparable
  attr_accessor :id, :cultivos, :valores

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

  def <=>(other)
    volumen_ventas() <=> other.volumen_ventas
  end

end

#############################################################################################
####################################### Pregunta 2 ##########################################
# Una cooperativa está compuesta por un conjunto de productores. Usando programación
# funcional, escriba el código Ruby de una función de orden superior para calcular el valor
# mínimo del volumen de ventas de los productores que forman parte una cooperativa.
# Describa su implementación.
# Escriba una prueba unitaria para comprobar el correcto funcionamiento del método para
# calcular el valor mínimo del volumen de ventas que ha desarrollado. ¿Dónde se ha de
# almacenar el código fuente de la prueba?
#############################################################################################

def menorVolumenVentas(cooperativa)
  cooperativa.min
end

#############################################################################################
####################################### Pregunta 3 ##########################################
# Escriba la prueba unitaria y el código Ruby de una función de orden superior que
# permita incrementar en un factor el precio_unitario_venta, del volumen de ventas,
# de los productores de una cooperativa usando programación funcional. Describa su
# implementación.
#############################################################################################

def incrementar_factor(productor, factor)
  productor.valores[1] += factor
end

def incrementar(cooperativa)
  cooperativa.flat_map { |p| incrementar_factor(p, 1)}
end

# #############################################################################################
####################################### Pregunta 4 ##########################################
# Escriba la prueba unitaria y el código Ruby de una función de orden superior que devuelva
# la instancia con mayor superficie total de una temporada de cultivo de los productores de una 
# cooperativa usando programación funcional. Describa su implementación.
#############################################################################################

def sumarSuperficie(cultivos, temporada)
  suma = 0
  for i in 0...cultivos.size
    if (cultivos[i][:temporada] == temporada)
      suma += cultivos[i][:superficie]
    end
  end
  suma
end

def mayorSuperficie(cooperativa, temporada)
  cooperativa.max_by { |p| sumarSuperficie(p.cultivos, temporada)}
end

# Devolver el cultivo con mayor superficie según la temporada
def mayorSuperficieCultivo(cooperativa, temporada)
  cultivos = cooperativa.flat_map { |p| p.cultivos.select { |c| c[:temporada] == temporada } }
  cultivos.max_by { |c| c[:superficie] }[:nombre] if !cultivos.empty?
end

# #############################################################################################
####################################### Pregunta 5 ##########################################
# En un mercadillo, un agricultor cosecha un producto y lo pone en un expositor. Un
# empleado recoge el producto del expositor y lo lleva al mostrador del cliente. Escriba el
# código Ruby que permita a dos hilos poner y retirar productos del expositor Describa su
# implementación.
#############################################################################################

mutex = Mutex.new

@expositor = []
@mostrador = []

empleado = ConditionVariable.new
cliente = ConditionVariable.new

def ponerExpositor (prod)
	puts("Pone " + prod + " en " + "Expositor")
	@expositor << prod
end

def quitarExpositor (prod) 
	puts("Quita " + prod + " de " + "Expositor")
	@expositor.delete(prod)
end

def ponerMostrador (prod)
	puts("Pone " + prod + " en " + "Mostrador")
	@mostrador << prod
end

def quitarMostrador (prod) 
	puts("Quita " + prod + " de " + "Mostrador")
	@mostrador.delete(prod)
end


# Creamos hilos pero no iniciamos la sincronización todavía
threadEmpleado = Thread.new do
  mutex.synchronize do
    puts "Empleado: Esperando producto en el expositor"
    empleado.wait(mutex) # Espera a que el agricultor ponga el producto
    puts "Empleado: Recogiendo producto del expositor"
    quitarExpositor("semilla")
    ponerMostrador("semilla")
    puts "Empleado: Producto puesto en el mostrador"
    cliente.signal # Avisa al cliente
  end
end

threadCliente = Thread.new do
  mutex.synchronize do
    puts "Cliente: Esperando producto en el mostrador"
    cliente.wait(mutex) # Espera a que el empleado ponga el producto
    puts "Cliente: Recogiendo producto del mostrador"
    quitarMostrador("semilla")
    puts "Cliente: Producto recogido"
  end
end

# El agricultor inicia la secuencia después de que los otros hilos estén esperando
threadAgricultor = Thread.new do
  sleep(0.1) # Pequeña pausa para asegurar que los otros hilos estén esperando
  mutex.synchronize do
    puts "Agricultor: Poniendo producto en el expositor"
    ponerExpositor("semilla")
    puts "Agricultor: Avisando al empleado"
    empleado.signal # Avisa al empleado
  end
end

# Espera a que todos los hilos terminen
threadAgricultor.join
threadEmpleado.join
threadCliente.join