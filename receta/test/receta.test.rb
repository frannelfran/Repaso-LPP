require_relative '../lib/receta.rb'
require 'test/unit'

class TestReceta < Test::Unit::TestCase
  #def test_inicializacion
  #  assert_not_equal(nil, Receta.new)
  #  assert_instance_of(Receta, Receta.new)
  #end

  #def test_agregar_id
  #  assert_not_equal(nil, Receta.new(1))
  #  assert_instance_of(Receta, Receta.new(1))
  #end

  #def test_agregar_ingredientes
  #  receta = Receta.new(1, [{:nombre => "arroz", :cantidad => 3.2}])
  #  assert_not_equal(nil, receta)
  #  assert_instance_of(Receta, receta)
  #end

  def test_agregar_precio
    receta = Receta.new(1, [{:nombre => "arroz", :cantidad => 2.4}], 13.5)
    assert_not_equal(nil, receta)
    assert_instance_of(Receta, receta)
  end

  def test_to_s
    receta = Receta.new(1, [{:nombre => "arroz", :cantidad => 2.4}], 13.5)
    assert_instance_of(String, receta.to_s)
    assert_equal("La receta con id 1 usa los siguientes ingredientes: [{:nombre=>\"arroz\", :cantidad=>2.4}] y tiene de precio 13.5", receta.to_s)
  end

  def test_getters
    receta = Receta.new(1, [{:nombre => "arroz", :cantidad => 2.4}], 13.5)
    # para el id
    assert_instance_of(Integer, receta.id)
    # para los ingredientes
    assert_instance_of(Array, receta.ingredientes)
    assert_instance_of(Hash, receta.ingredientes[0])
    assert_instance_of(String, receta.ingredientes[0][:nombre])
    assert_instance_of(Float, receta.ingredientes[0][:cantidad])
    # para el precio
    assert_instance_of(Float, receta.precio)
  end
end