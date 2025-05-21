require_relative '../lib/servicios.rb'

describe Servicio do
  before :all do
    @servicio1 = Servicio.new(1, "Público", [["General", 100], ["Pediatria", 50]])
  end

  it "Inicialización del objeto" do
    expect(@servicio1).to be_instance_of(Servicio)
  end

  it "Prueba para el identificador" do
    expect(@servicio1.id).to be_instance_of(Integer)
    expect(@servicio1.id).to eq(1)
  end

  it "Prueba para el tipo de servicio" do
    expect(@servicio1.tipo).to be_instance_of(String)
    expect(@servicio1.tipo).to eq("Público")
  end

  it "Prueba para las especialidades" do
    expect(@servicio1.especialidades).to be_instance_of(Array)
    expect(@servicio1.especialidades[0]).to be_instance_of(Array)
    expect(@servicio1.especialidades[0]).to eq(["General", 100])
  end

  it "Prueba para el to_s" do
    expect(@servicio1.to_s).to be_instance_of(String)
    expect(@servicio1.to_s).to eq("El servicio con id 1 de tipo Público tiene las siguientes especialidades: [[\"General\", 100], [\"Pediatria\", 50]]")
  end
end