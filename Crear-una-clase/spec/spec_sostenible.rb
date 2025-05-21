require_relative '../lib/sostenible.rb'

describe Sostenible do
  before :all do
    @sostenible = Sostenible.new("Granja Verde", [100, 50], [["vaca", "Mamífero", 200], ["gallina", "Ave", 50]])
    @sostenible2 = Sostenible.new("Granja Azul", [200, 100], [["oveja", "Mamífero", 150], ["pato", "Ave", 70]])
  end

  it "Inicializar el objeto" do
    expect(@sostenible).to be_instance_of(Sostenible)
    expect(@sostenible2).to be_instance_of(Sostenible)
  end

  it "Comprobar el nombre" do
    expect(@sostenible.nombre).to be_instance_of(String)
    expect(@sostenible.nombre).to eq("Granja Verde")
  end

  it "Comprobar las huellas" do
    expect(@sostenible.huellas).to be_instance_of(Array)
    expect(@sostenible.huellas).to eq([100, 50])
  end

  it "Comprobar los animales" do
    expect(@sostenible.animales).to be_instance_of(Array)
    expect(@sostenible.animales[0]).to be_instance_of(Array)
    # Para los animales
    expect(@sostenible.animales[0][0]).to be_instance_of(String)
    expect(@sostenible.animales[0][0]).to eq("vaca")
    # Para el tipo de animal
    expect(@sostenible.animales[0][1]).to be_instance_of(String)
    expect(@sostenible.animales[0][1]).to eq("Mamífero")
    # Para el precio
    expect(@sostenible.animales[0][2]).to be_instance_of(Integer)
    expect(@sostenible.animales[0][2]).to eq(200)
  end

  it "Comprobar el método to_s" do
    expect(@sostenible.to_s).to be_instance_of(String)
    expect(@sostenible.to_s).to eq("Granja: Granja Verde, Huellas: [100, 50], Animales: [[\"vaca\", \"Mamífero\", 200], [\"gallina\", \"Ave\", 50]]")
  end
end