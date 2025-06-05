require_relative '../lib/productor.rb'
require 'test/unit'

class TestProductor < Test::Unit::TestCase
  def setup
    @productor1 = Productor.new(1, [{:nombre => "Maiz", :superficie => 12, :temporada => "Primavera"}], [12, 5])
    @productor2 = Productor.new(2, [
      {:nombre => "Trigo", :superficie => 20, :temporada => "Otoño"},
      {:nombre => "Soja", :superficie => 15, :temporada => "Verano"}
    ], [20, 15])
    @productor3 = Productor.new(3, [
      {:nombre => "Cebada", :superficie => 10, :temporada => "Invierno"},
      {:nombre => "Girasol", :superficie => 8, :temporada => "Primavera"},
      {:nombre => "Avena", :superficie => 5, :temporada => "Otoño"}
    ], [10, 8])

    @cooperativa = [@productor1, @productor2, @productor3]
  end

  def test_menorVolumenVentas
    assert_instance_of(Productor, menorVolumenVentas(@cooperativa))
    assert_equal(@productor1, menorVolumenVentas(@cooperativa))
  end

  def test_incrementar
    incrementar(@cooperativa)
    assert_instance_of(Productor, @cooperativa[0])
    assert_equal([12, 6], @cooperativa[0].valores)
  end

  def test_MayorSuperficie
    assert_instance_of(Productor, mayorSuperficie(@cooperativa, "Primavera"))
    assert_equal(@productor1, mayorSuperficie(@cooperativa, "Primavera"))
  end

  def test_nombreMayorSuperficie
    assert_instance_of(String, mayorSuperficieCultivo(@cooperativa, "Otoño"))
    assert_equal("Trigo", mayorSuperficieCultivo(@cooperativa, "Otoño"))
  end
end