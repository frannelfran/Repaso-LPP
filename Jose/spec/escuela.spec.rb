require_relative '../lib/escuela.rb'

describe Escuela do
#it "Prueba para inicializar la instancia" do
#  expect(Escuela.new(1, "Privado")).to be_instance_of(Escuela)
#  expect(Escuela.new(1, "Privado")).not_to eq(nil)
#end
#
#it "Prueba para el identificador" do
#  expect(Escuela.new(1, "Privado")).to be_instance_of(Escuela)
#  expect(Escuela.new(1, "Privado")).not_to eq(nil)
#end
#
#it "Prueba para el tipo de escuela" do
#  expect(Escuela.new(1, "Privado")).to be_instance_of(Escuela)
#  expect(Escuela.new(1, "Privado")).not_to eq(nil)
#end

  it "Prueba para los alumnos" do
    expect(Escuela.new(1, "Privado", [{:nombre => "Jose", :nota => 1.2}])).to be_instance_of(Escuela)
    expect(Escuela.new(1, "Privado", [{:nombre => "Juan", :nota => 5}])).not_to eq(nil)
  end

  it "Pruebas para los getters" do
    escuela = Escuela.new(1, "Privado", [{:nombre => "Juan", :nota => 1.2}, {:nombre => "Jose", :nota => 10}])
    # Para el identificador
    expect(escuela.id).to be_instance_of(Integer)
    expect(escuela.id).to eq(1)

    # Para el tipo de institución
    expect(escuela.tipo).to be_instance_of(String)
    expect(escuela.tipo).to eq("Privado")

    # Para los estudiantes
    expect(escuela.estudiantes[0][:nombre]).to be_instance_of(String)
    expect(escuela.estudiantes[0][:nota]).to be_instance_of(Float)
    expect(escuela.estudiantes[0][:nombre]).to eq("Juan")
    expect(escuela.estudiantes[0][:nota]).to eq(1.2)
  end

  it "Pruebas para el método to_s" do
    escuela = Escuela.new(1, "Privado", [{:nombre => "Juan", :nota => 1.2}])
    expect(escuela.to_s()).to be_instance_of(String)
    expect(escuela.to_s()).to eq("La escuela con id 1 es de tipo Privado y tiene los siguientes estudiantes: [{:nombre=>\"Juan\", :nota=>1.2}]")
  end
end