# Una cooperativa es un conjunto de granjas sostenibles, usando RSpec, hacer una función de orden 
# superior mediante la cuál al realizar una combinación lineal usando sus huellas, sacamos el 
# nombre de la granja más sostenible

require_relative '../lib/sostenible.rb'

describe Sostenible do
  before :all do
    @granja1 = Sostenible.new(1, {carbono: 3, hidrica: 5}, [
      {id: "Vaca", tipo: "Mamifero", precio: 3.5},
      {id: "Cerdo", tipo: "Mamifero", precio: 2.8}
    ])
    @granja2 = Sostenible.new(2, {carbono: 2, hidrica: 4}, [
      {id: "Oveja", tipo: "Mamifero", precio: 2.0}
    ])
    @granja3 = Sostenible.new(3, {carbono: 5, hidrica: 3}, [
      {id: "Gallina", tipo: "Ave", precio: 1.5},
      {id: "Pato", tipo: "Ave", precio: 1.8},
      {id: "Pavo", tipo: "Ave", precio: 2.2}
    ])

    @cooperativa = [@granja1, @granja2, @granja3]
  end

  it "Prueba para ver la granja más sostenible por la suma de sus huellas" do
    expect(maxSostenible(@cooperativa)).to be_instance_of(Sostenible)
    expect(maxSostenible(@cooperativa)).to eq(@granja2)
  end

  it "Prueba para obtener el mayor precio de un tipo de animal" do
    expect(mayorPrecio(@cooperativa, "Mamifero")).to be_instance_of(Float)
    expect(mayorPrecio(@cooperativa, "Mamifero")).to eq(3.5)
  end
end