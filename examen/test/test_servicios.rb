require_relative '../lib/servicios.rb'
require 'test/unit'

class TestServicios < Test::Unit::TestCase
  def setup
    @servicio1 = Servicio.new(1, "Público", [["General", 50], ["Pediatria", 100]])
    @servicio2 = Servicio.new(2, "Privado", [["General", 180]])
    @servicios = [@servicio1, @servicio2]
  end

  def test_mayor_numero_especialidades
    assert_instance_of(Servicio, mayorNumeroEspecialidades(@servicios))
    assert_equal(@servicio1, mayorNumeroEspecialidades(@servicios))
  end

  def test_menor_precio
    assert_instance_of(Integer, menorPrecio(@servicios, "General"))
    assert_equal(50, menorPrecio(@servicios, "General"))
  end

  def test_menor_precio_especialidad
    assert_instance_of(Servicio, menorPrecioEspecialidad(@servicios, "General"))
    assert_equal(@servicio1, menorPrecioEspecialidad(@servicios, "General"))
  end

  def test_mayor_especialidades_tipo
    assert_instance_of(Servicio, mayorEspecialidadTipo(@servicios, "Público"))
    assert_equal(@servicio1, mayorEspecialidadTipo(@servicios, "Público"))
  end
end