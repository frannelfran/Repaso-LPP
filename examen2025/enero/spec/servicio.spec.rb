require_relative '../lib/servicio.rb'

describe Servicio do
  #it "Prueba para inicializar la clase" do
  #  expect(Servicio.new).not_to eq(nil)
  #  expect(Servicio.new).to be_instance_of(Servicio)
  #end

  #it "Prueba para agregar el identificador" do
  #  expect(Servicio.new(1)).not_to eq(nil)
  #  expect(Servicio.new(1)).to be_instance_of(Servicio)
  #end

  #it "Prueba para agregar el tipo de servicio" do
  #  expect(Servicio.new(1, "publico")).not_to eq(nil)
  #  expect(Servicio.new(1, "publico")).to be_instance_of(Servicio)
  #end

  it "Prueba para agregar las especialidades" do
    servicio = Servicio.new(1, "publico", [{:tipo => "general", :precio => 12.5}])
    expect(servicio).not_to eq(nil)
    expect(servicio).to be_instance_of(Servicio)
  end

  it "Prueba para el método to_s" do
    servicio = Servicio.new(1, "publico", [{:tipo => "general", :precio => 12.5}])
    expect(servicio.to_s).to be_instance_of(String)
    expect(servicio.to_s).to eq("El servicio con id 1 de tipo publico tiene las siguientes especialidades: [{:tipo=>\"general\", :precio=>12.5}]")
  end
end
