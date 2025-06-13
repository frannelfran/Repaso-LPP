require_relative '../lib/receta.rb'

describe Receta do
  before :all do
    @receta1 = Receta.new(1, [{:nombre => "arroz", :cantidad => 2.1}], 13.5)
    @receta2 = Receta.new(2, [{:nombre => "arroz", :cantidad => 5.4}, {:nombre => "lechuga", :cantidad => 8.9}], 14.3)
    @recetario = [@receta1, @receta2]
  end

  it "Prueba para obtener el producto que se requiere la mayor cantidad" do
    expect(obtenerProducto(@recetario)).to be_instance_of(String)
    expect(obtenerProducto(@recetario)).to eq("lechuga")
  end

  it "Prueba para obtener la receta mas costosa" do
    expect(maxCostosa(@recetario)).to be_instance_of(Receta)
    expect(maxCostosa(@recetario)).to eq(@receta2)
  end

  it "Prueba para obtener la reeta con mayor cantidad de ingredientes" do
    expect(mayorCantidad(@recetario)).to be_instance_of(Receta)
    expect(mayorCantidad(@recetario)).to eq(@receta2)
  end

  it "Prueba para obtener la receta que requiera mayor cantidad deun ingrediente" do
    expect(obtenerReceta(@recetario, "arroz")).to be_instance_of(Receta)
    expect(obtenerReceta(@recetario, "arroz")).to eq(@receta2)
  end
end