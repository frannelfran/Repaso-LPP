require_relative '../lib/consulta.rb'
require 'test/unit'

class TestConsulta < Test::Unit::TestCase
  #def test_inicializacion
  #  assert_not_equal(nil, Consulta.new)
  #  assert_instance_of(Consulta, Consulta.new)
  #end

  #def test_agregar_id
  #  assert_not_equal(nil, Consulta.new(1))
  #  assert_instance_of(Consulta, Consulta.new(1))
  #end

  #def test_agregar_tipo
  #  assert_not_equal(nil, Consulta.new(1, "general"))
  #  assert_instance_of(Consulta, Consulta.new(1, "general"))
  #end

  #def test_agregar_precio
  #  consulta = Consulta.new(1, "general", 18.0)
  #  assert_not_equal(nil, consulta)
  #  assert_instance_of(Consulta, consulta)
  #end

  def test_agregar_pacientes
    consulta = Consulta.new(1, "general", 18.0, [{:id => 1, :consultas => 8}])
    assert_not_equal(nil, consulta)
    assert_instance_of(Consulta, consulta)
  end

  def test_to_s
    consulta = Consulta.new(1, "general", 18.0, [{:id => 1, :consultas => 8}])
    assert_instance_of(String, consulta.to_s)
    assert_equal("La consulta 1 de tipo general cuesta 18.0 euros y tiene los siguientes pacientes: [{:id=>1, :consultas=>8}]", consulta.to_s)
  end

  def test_getters
    consulta = Consulta.new(1, "general", 18.0, [{:id => 1, :consultas => 8}])
    # Para el id
    assert_instance_of(Integer, consulta.id)
    # Para el tipo
    assert_instance_of(String, consulta.tipo)
    # Para el precio
    assert_instance_of(Float, consulta.precio)
    # Para los pacientes
    assert_instance_of(Array, consulta.pacientes)
    assert_instance_of(Hash, consulta.pacientes[0])
    assert_instance_of(Integer, consulta.pacientes[0][:id])
    assert_instance_of(Integer, consulta.pacientes[0][:consultas])
  end
end