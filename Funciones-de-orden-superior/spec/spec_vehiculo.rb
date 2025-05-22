require_relative '../lib/vehiculo.rb'

describe Vehiculo do
  before :all do
    @vehiculo1 = Vehiculo.new(1, 12.3, [["Fer", 123]])
    @vehiculo2 = Vehiculo.new(2, 20.3, [["Fer", 123], ["Esther", 2345]])
    @vehiculo3 = Vehiculo.new(3, 40.5, [["Fer", 123], ["Esther", 2345], ["Carlos", 567]])
    @consecionario = [@vehiculo1, @vehiculo2, @vehiculo3]
  end

  it "Test para la función que calcula el precio más alto de los coches" do
    expect(mayorPrecio(@consecionario)).to be_instance_of(Float)
    expect(mayorPrecio(@consecionario)).to eq(40.5)
  end

  it "Test para obtener el vehículo de menor precio" do
    expect(menorPrecio(@consecionario)).to be_instance_of(Vehiculo)
    expect(menorPrecio(@consecionario)).to eq(@vehiculo1)
  end

  it "Test para sumar precios" do
    nuevo = sumarPrecio(@consecionario, 1)
    expect(nuevo).to be_instance_of(Array)
    expect(nuevo[0].precio).to eq(13.3)
  end
end

