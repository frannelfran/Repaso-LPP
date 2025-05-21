require_relative '../lib/sostenible.rb'
require 'test/unit'

class TestSostenible < Test::Unit::TestCase
  def setup
    @sostenible = Sostenible.new("Granja Verde", [100, 50], [["vaca", "Mamífero", 200], ["gallina", "Ave", 50]])
    @sostenible2 = Sostenible.new("Granja Azul", [200, 100], [["oveja", "Mamífero", 150], ["pato", "Ave", 70]])
  end

  def test_inicializar_objeto
    assert_instance_of(Sostenible, @sostenible)
    assert_instance_of(Sostenible, @sostenible2)
  end

  def test_nombre
    assert_instance_of(String, @sostenible.nombre)
    assert_equal("Granja Verde", @sostenible.nombre)
  end

  def test_huellas
    assert_instance_of(Array, @sostenible.huellas)
    assert_equal([100, 50], @sostenible.huellas)
  end

  def test_animales
    assert_instance_of(Array, @sostenible.animales)
    assert_instance_of(Array, @sostenible.animales[0])
    assert_equal("vaca", @sostenible.animales[0][0])
    assert_equal("Mamífero", @sostenible.animales[0][1])
    assert_equal(200, @sostenible.animales[0][2])
  end

  def test_to_s
    assert_instance_of(String, @sostenible.to_s)
    assert_equal("Granja: Granja Verde, Huellas: [100, 50], Animales: [[\"vaca\", \"Mamífero\", 200], [\"gallina\", \"Ave\", 50]]", @sostenible.to_s)
  end
end