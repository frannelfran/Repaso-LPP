# Ejercicio 1: Hacer una clase de servicios que gestiona una empresa de gestión de 
#              servicios sanitarios que guarda los siguientes datos: un número identificador, 
#              un tipo de servicio (público o privado) y un conjunto de especialidades junto a su precio 
#              (las especialidades pueden ser: general, pediatria y geriatria)


class Servicios
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
end