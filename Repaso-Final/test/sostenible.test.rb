require_relative '../lib/sostenible.rb'
require 'test/unit'

class TestSostenible < Test::Unit::TestCase
  #def test_inicializacion
  #  assert_not_equal(nil, Sostenible.new)
  #  assert_instance_of(Sostenible, Sostenible.new)
  #end

  #def test_agregar_id
  #  assert_not_equal(nil, Sostenible.new(1))
  #  assert_instance_of(Sostenible, Sostenible.new(1))
  #end

  #def test_agregar_huellas
  #  assert_not_equal(nil, Sostenible.new(1, {:carbono => 2, :hidrica => 4}))
  #  assert_instance_of(Sostenible, Sostenible.new(1, {:carbono => 2, :hidrica => 4}))
  #end
  
  def test_agregar_animales
    assert_not_equal(nil, Sostenible.new(1, {:carbono => 3, :hidrica => 5}, [{:id => "Vaca", :tipo => "Mamifero", :precio => 3.5}]))
    assert_instance_of(Sostenible, Sostenible.new(1, {:carbono => 3, :hidrica => 5}, [{:id => "Vaca", :tipo => "Mamifero", :precio => 3.5}]))
  end

  def test_agregar_to_s
    granja = Sostenible.new(1, {:carbono => 3, :hidrica => 5}, [{:id => "Vaca", :tipo => "Mamifero", :precio => 3.5}])
    assert_instance_of(String, granja.to_s)
    assert_equal("La granja con id 1 tiene las siguientes huellas {:carbono=>3, :hidrica=>5} y los siguientes animales: [{:id=>\"Vaca\", :tipo=>\"Mamifero\", :precio=>3.5}]", granja.to_s)
  end

  def test_getters
    granja = Sostenible.new(1, {:carbono => 3, :hidrica => 5}, [{:id => "Vaca", :tipo => "Mamifero", :precio => 3.5}])
    # Para el id
    assert_instance_of(Integer, granja.id)
    assert_equal(1, granja.id)

    # Para las huellas
    assert_instance_of(Hash, granja.huellas)
    assert_instance_of(Integer, granja.huellas[:carbono])
    assert_instance_of(Integer, granja.huellas[:hidrica])

    # Para los animales
    assert_instance_of(Array, granja.animales)
    assert_instance_of(Hash, granja.animales[0])
    assert_instance_of(String, granja.animales[0][:id])
    assert_instance_of(String, granja.animales[0][:tipo])
    assert_instance_of(Float, granja.animales[0][:precio])
  end
end