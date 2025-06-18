# Realizar con Unit Testing una clase que represente la consulta de un médico.
# Esa clase tendrá como atributos un identificador numérico, el tipo 
# (sólo puede ser general, pediatría o geriatría), el precio de la consulta y un conjunto
# de pacientes (identificador y numero de consultas).

class Consulta
  include Comparable
  attr_reader :id, :tipo, :precio, :pacientes

  def initialize(id, tipo, precio, pacientes)
    @id = id
    if tipo != "general" && tipo != "pediatria" && tipo != "geriatria"
      throw new Error("El tipo solo puede ser general, pediatria o geriatria")
    else
      @tipo = tipo
    end
    @precio = precio
    @pacientes = pacientes
  end

  def to_s
    "La consulta #{@id} de tipo #{@tipo} cuesta #{@precio} euros y tiene los siguientes pacientes: #{@pacientes}"
  end

  def beneficio
    total = 0
    for i in 0...pacientes.size
      total += precio * pacientes[i][:consultas]
    end
    total
  end

  def <=>(other)
    beneficio <=> other.beneficio
  end
end

# Una cooperativa sanitaria es aquella formada por un conjunto de consultas, hallar 
# que consulta ha adquirido un mayor beneficio de una cooperativa
# para ello hay que hacer la clase Comparable, hacer con RSPEC.

def maxBeneficio(cooperativa)
  cooperativa.max
end

# Dada un tipo de consulta y una cooperativa hallar que paciente ha ido a menos consultas.
def minConsultas(cooperativa, tipo)
  consultas = cooperativa.select { |c| c.tipo == tipo }
  pacientes = consultas.flat_map { |c| c.pacientes }
  pacientes.min_by { |p| p[:consultas]}[:id]
end

# Un administrador ddebe depositar en una bandeja el expediente de una persona, una
# enfermera retira el expediente de la bandeja y lo lleva a la consulta del médico.
# Realizar 2 hilos para poner y retirar el expediente de la bandeja.

mutex = Mutex.new
CV = ConditionVariable.new

def ponerBandeja(expediente)
  puts "El expediente #{expediente} se ha colocado en la bandeja"
end

def quitarBandeja(expediente)
  puts "El expediente #{expediente} se ha retirado de la bandeja"
end

hiloAdministrador = Thread.new do
  sleep(0.1)
  mutex.synchronize do
    ponerBandeja(2222)
    CV.signal
  end
end

hiloEnfermera = Thread.new do
  mutex.synchronize do
    CV.wait(mutex)
    quitarBandeja(2222)
  end
end

hiloAdministrador.join
hiloEnfermera.join