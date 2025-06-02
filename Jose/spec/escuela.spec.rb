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

  it "Pruebas para los getters"
  escuela = Escuela.new(1, "Privado", [{:nombre => "Juan", :nota => 1.2}, {:nombre = "Jose", :nota => 10}])
  # Para 
end