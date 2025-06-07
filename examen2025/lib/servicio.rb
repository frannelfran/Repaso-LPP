# Ejercicio 1: Hacer una clase de servicios que gestiona una empresa de gestión de 
#              servicios sanitarios que guarda los siguientes datos: un número identificador, 
#              un tipo de servicio (público o privado) y un conjunto de especialidades junto a su precio 
#              (las especialidades pueden ser: general, pediatria y geriatria)

class Servicio
  attr_reader :id, :tipo, :especialidades
  include Comparable
  def initialize(id, tipo, especialidades)
    if tipo != "publico" && tipo != "privado"
      throw new Error("El tipo debe ser publico o privado")
    end

    for i in 0...especialidades.size
      if especialidades[i][:tipo] != "general" && especialidades[i][:tipo] != "pediatria" && especialidades[i][:tipo] != "geriatria"
        throw new Error("La especialidad debe ser general, pediatria o geriatria")
      end
    end

    @id = id
    @tipo = tipo
    @especialidades = especialidades
  end

  def to_s
    "El servicio con id #{@id} de tipo #{@tipo} tiene las siguientes especialidades: #{@especialidades}"
  end

  def <=>(other)
    especialidades.size <=> other.especialidades.size
  end
end


# Ejercicio 2: programacion funcional

# a) dado un conjunto de servicios, devuelva el servicio con mayor número de especialidades

def maxNumeroEspecialidades(servicios)
  servicios.max
end

# b) un método que dado un conjunto de servicios y una especialidad, te devuelva cual es el servicio con menor precio en dicha especialidad
def menorPrecioEspecialidad(servicios, tipo)
  servicios
    .select { |s| s.especialidades.find { |e| e[:tipo] == tipo}}
    .min_by { |s| menorPrecio(s.especialidades, tipo)}
end

def menorPrecio(especialidades, tipo)
  precioMinimo = 999
  for i in 0...especialidades.size
    if especialidades[i][:tipo] == tipo && especialidades[i][:precio] < precioMinimo
      precioMinimo = especialidades[i][:precio]
    end
  end
  precioMinimo
end