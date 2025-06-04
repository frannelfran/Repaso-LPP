require_relative '../lib/productor.rb'

describe Productor do
  #it "Prueba para inicializar la clase" do
  #  expect(Productor.new).not_to eq(nil)
  #  expect(Productor.new).to be_instance_of(Productor)
  #end

  #it "Prueba para agregar el identificador a la empresa" do
  #  expect(Productor.new(1)).not_to eq(nil)
  #  expect(Productor.new(1)).to be_instance_of(Productor)
  #end

  #it "Prueba para agregar cultivos a la empresa" do
  #  productor = Productor.new(1, [{:nombre => "Maiz", :superficie => 12, :temporada => "Primavera"}])
  #  expect(productor).not_to eq(nil)
  #  expect(productor).to be_instance_of(Productor)
  #end

  it "Prueba para agregar el volumen de ventas" do
    productor = Productor.new(1, [{:nombre => "Maiz", :superficie => 12, :temporada => "Primavera"}], [12, 5])
    expect(productor).not_to eq(nil)
    expect(productor).to be_instance_of(Productor)
  end

  it "Prueba para los getters" do
    productor = Productor.new(1, [{:nombre => "Maiz", :superficie => 12, :temporada => "Primavera"}], [12, 5])

    # Para el id
    expect(productor.id).to be_instance_of(Integer)
    expect(productor.id).to eq(1)
    # Para los cultivos
    expect(productor.cultivos).to be_instance_of(Array)
    expect(productor.cultivos[0]).to be_instance_of(Hash)
    expect(productor.cultivos[0][:nombre]).to be_instance_of(String)
    expect(productor.cultivos[0][:superficie]).to be_instance_of(Integer)
    expect(productor.cultivos[0][:temporada]).to be_instance_of(String)

    # Para el conjunto de valores
    expect(productor.valores).to be_instance_of(Array)
    expect(productor.valores[0]).to be_instance_of(Integer)
    expect(productor.valores[1]).to be_instance_of(Integer)
  end

  it "Prueba para el método to_s" do
    productor = Productor.new(1, [{:nombre => "Maiz", :superficie => 12, :temporada => "Primavera"}], [12, 5])

    expect(productor.to_s).to be_instance_of(String)
    expect(productor.to_s).to eq("El productor con id 1 tiene los siguientes cultivos: [{:nombre=>\"Maiz\", :superficie=>12, :temporada=>\"Primavera\"}] y tiene los siguientes valores: [12, 5]")
  end

  it "Prueba para el método que alcula el volumen de las ventas" do
    productor = Productor.new(1, [{:nombre => "Maiz", :superficie => 12, :temporada => "Primavera"}], [12, 5])

    expect(productor.volumen_ventas()).to be_instance_of(Integer)
    expect(productor.volumen_ventas()).to eq(60)
  end
end