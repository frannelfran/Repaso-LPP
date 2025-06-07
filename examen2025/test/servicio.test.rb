require_relative '../lib/servicio.rb'
require 'test/unit'

class TestServicio < Test::Unit::TestCase
  def setup
    @servicio1 = Servicio.new(1, "publico", [{:tipo => "general", :precio => 12.5}])
    @servicio2 = Servicio.new(2, "publico", [{:tipo => "general", :precio => 2.5}, {:tipo => "geriatria", :precio => 4.1}])
    @servicios = [@servicio1, @servicio2]
  end

  def test_maxEspecialidades
    assert_instance_of(Servicio, maxNumeroEspecialidades(@servicios))
    assert_equal(@servicio2, maxNumeroEspecialidades(@servicios))
  end

  def testMenorPrecio
    assert_instance_of(Servicio, menorPrecioEspecialidad(@servicios, "general"))
    assert_equal(@servicio2, menorPrecioEspecialidad(@servicios, "general"))
  end
end