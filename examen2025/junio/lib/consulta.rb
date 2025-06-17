# Realizar con Unit Testing una clase que represente la consulta de un médico.
# Esa clase tendrá como atributos un identificador numérico, el tipo 
# (sólo puede ser general, pediatría o geriatría), el precio de la consulta y un conjunto
# de pacientes (identificador y numero de consultas).

class Consulta
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
end