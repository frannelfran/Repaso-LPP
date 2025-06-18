require_relative '../lib/consulta.rb'

describe Consulta do
  before :all do
    @consulta1 = Consulta.new(1, "general", 18.00, [{:id => 1, :consultas => 7}])
    @consulta2 = Consulta.new(2, "general", 25.00, [
      {:id => 2, :consultas => 5},
      {:id => 3, :consultas => 3}
    ])
    @consulta3 = Consulta.new(3, "geriatria", 40.00, [
      {:id => 4, :consultas => 2},
      {:id => 5, :consultas => 4},
      {:id => 6, :consultas => 1}
    ])
    @consulta4 = Consulta.new(4, "pediatria", 22.00, [
      {:id => 7, :consultas => 6},
      {:id => 8, :consultas => 2},
      {:id => 9, :consultas => 5},
      {:id => 10, :consultas => 3}
    ])

    @cooperativa = [@consulta1, @consulta2, @consulta3, @consulta4]
  end

  it "Prueba para hallar la consulta con mayor beneficio" do
    expect(maxBeneficio(@cooperativa)).to be_instance_of(Consulta)
    expect(maxBeneficio(@cooperativa)).to eq(@consulta4)
  end

  it "Prueba para hallar el paciente con menor numero de consultas" do
    expect(minConsultas(@cooperativa, "general")).to be_instance_of(Integer)
    expect(minConsultas(@cooperativa, "general")).to eq(3)
  end
end