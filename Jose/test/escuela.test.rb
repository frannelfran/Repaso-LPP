require_relative '../lib/escuela.rb'
require 'test/unit'

class TestEscuela < Test::Unit::TestCase
  def setup
    @escuela1 = Escuela.new(1, "Publico", [
      { :nombre => "Pepe", :nota => 2.5 },
      { :nombre => "Ana", :nota => 7.0 },
      { :nombre => "Luis", :nota => 5.5 },
      { :nombre => "Marta", :nota => 8.0 },
      { :nombre => "Carlos", :nota => 6.0 }
    ])
    @escuela2 = Escuela.new(2, "Publico", [
      { :nombre => "Jose", :nota => 10.0 },
      { :nombre => "Lucia", :nota => 9.5 },
      { :nombre => "Raul", :nota => 7.5 },
      { :nombre => "Elena", :nota => 8.5 },
      { :nombre => "Sara", :nota => 6.5 }
    ])
    @escuelas = [@escuela1, @escuela2]
  end

  def test_max_nota
    assert_instance_of(Float, maxNota(@escuelas, "Publico"))
    assert_equal(10.0, maxNota(@escuelas, "Publico"))
  end

  def test_contar_tipo
    assert_instance_of(Integer, contarTipo(@escuelas, "Publico"))
    assert_equal(2, contarTipo(@escuelas, "Publico"))
  end

  def test_media_notas
    assert_instance_of(Float, contarMedias(@escuelas))
    assert_equal(7.1, contarMedias(@escuelas))
  end
end