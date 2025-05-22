require_relative '../lib/vehiculo.rb'
require 'test/unit'

class TestVehiculo < Test::Unit::TestCase
  def setup
    @vehiculo = Vehiculo.new(1, 13.5, [["Lucy", 1234], ["Fernando", 123]])
  end

  def test_inicializacion
    assert_not_equal(nil, @vehiculo)
    assert_instance_of(Vehiculo, @vehiculo)
  end

  def test_id
    assert_instance_of(Integer, @vehiculo.id)
    assert_equal(1, @vehiculo.id)
  end

  def test_precio
    assert_instance_of(Float, @vehiculo.precio)
    assert_equal(13.5, @vehiculo.precio)
  end

  def test_propietarios
    assert_instance_of(Array, @vehiculo.propietarios)
    assert_instance_of(Array, @vehiculo.propietarios[0])
    assert_instance_of(String, @vehiculo.propietarios[0][0])
    assert_instance_of(Integer, @vehiculo.propietarios[0][1])
  end

  def test_to_s
    assert_instance_of(String, @vehiculo.to_s)
    assert_equal("El coche con id 1 vale 13.5 euros y tuvo los siguientes propietarios: [[\"Lucy\", 1234], [\"Fernando\", 123]]", @vehiculo.to_s)
  end
end