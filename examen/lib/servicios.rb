# Ejercicio 1: Hacer una clase de servicios que gestiona una empresa de gestión de 
#              servicios sanitarios que guarda los siguientes datos: un número identificador, 
#              un tipo de servicio (público o privado) y un conjunto de especialidades junto a su precio 
#              (las especialidades pueden ser: general, pediatria y geriatria)


class Servicio
  include Comparable
  attr_reader :id, :tipo, :especialidades

  def initialize(id, tipo, especialidades = [])
    @id = id
    if (tipo === "Público" || tipo === "Privado")
      @tipo = tipo
    else
      throw new Error("El tipo debe ser público o privado")
    end
    
    for i in 0...especialidades.size
      if (especialidades[i][0] != "General" && especialidades[i][0] != "Pediatria" && especialidades[i][0] != "Geriatria")
        throw new Error("Las especialidades deben ser Pediatria, Geriatria o General ")
      end
    end
    @especialidades = especialidades
  end

  def to_s
    "El servicio con id #{@id} de tipo #{@tipo} tiene las siguientes especialidades: #{@especialidades}"
  end

  def <=>(other)
    @especialidades.size <=> other.especialidades.size
  end
end

def mayorNumeroEspecialidades(servicios)
  servicios.max
end

def menorPrecio(servicios, especialidad)
  servicios
    .map { |s| s.especialidades.find { |esp| esp[0] == especialidad }[1]}
    .min
end

def menorPrecioEspecialidad(servicios, especialidad)
  servicios.min_by { |s| s.especialidades.find { |esp| esp[0] == especialidad}[1]}
end

def mayorEspecialidadTipo(servicios, tipo)
  servicios
    .select { |s| s.tipo == tipo }
    .max
end

servicio1 = Servicio.new(1, "Público", [["General", 50], ["Pediatria", 100]])
servicio2 = Servicio.new(2, "Privado", [["General", 180]])
servicios = [servicio1, servicio2]

# Hilo 1: Calcular el porcentaje de una especialidad en un conjunto de servicios
hilo1 = Thread.new do
  numeroDeEspecialidad = servicios.count { |s| s.especialidades.count { |e| e[1] == "Pediatria"}}
  total = servicios.sum { |s| s.especialidades.size }
  puts (numeroDeEspecialidad / total)
end

# Hilo 2: Calcular el precio medio de una consulta entre un conjunto de servicios
hilo2 = Thread.new do
  precio_medio = servicios.sum { |s| s.especialidades.sum { |e| e[1]}}
  total_servicios = servicios.sum { |s| s.especialidades.size }

  puts (precio_medio / total_servicios)
end

hilo1.join
hilo2.join