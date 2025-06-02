# Tenemos una escuela que tiene los siguientes atrtibutos, identificador para
# identificar la escuela, tipo de escuela, (publica o privada) y un conjunto de estudiantes
# (Nombre del estudiante, nota). REalizar mediante TDD la clase para representar una escuela.

class Escuela
  attr_reader :id, :tipo, :estudiantes
  def initialize(id, tipo, estudiantes)
    @id = id
    if (tipo == "Publico" || tipo == "Privado")
      @tipo = tipo
    else
      raise ArgumentError "El tipo debe ser Publico o Privado"
    end
    @estudiantes = estudiantes
  end
end