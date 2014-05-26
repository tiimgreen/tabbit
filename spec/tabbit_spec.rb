describe Tabbit do
  describe '#initialize' do
    it 'handles headers' do
      expect(Tabbit.new('a', 'b', 'c').table).to eq [['a', 'b', 'c']]
    end
  end

  describe '#add_row' do
    it 'adds rows' do
      expect(Tabbit.new('a', 'b').add_row('1', '2')[1]).to eq ['1', '2']
    end
  end

  describe '#to_s' do
    it 'formats an appropriate table (simple)' do
      table = Tabbit.new('a', 'b')
      table.add_row('1', '2')
      expect(table.to_s).to eq "=============\n|  \e[31m\e[1ma\e[0m\e[0m  |  \e[31m\e[1mb\e[0m\e[0m  |\n=============\n|  1  |  2  |\n============="
    end

    it 'formats an appropriate table (complex)' do
      table = Tabbit.new('Name', 'Phone', 'GitHub')
      10.times { |n| table.add_row('Rafal', "123-456-78#{n}", '@rafalchmiel') }
      expect(table.to_s).to eq "============================================\n|  \e[31m\e[1mName\e[0m\e[0m   |  \e[31m\e[1mPhone\e[0m\e[0m        |  \e[31m\e[1mGitHub\e[0m\e[0m        |\n============================================\n|  Rafal  |  123-456-780  |  @rafalchmiel  |\n|  Rafal  |  123-456-781  |  @rafalchmiel  |\n|  Rafal  |  123-456-782  |  @rafalchmiel  |\n|  Rafal  |  123-456-783  |  @rafalchmiel  |\n|  Rafal  |  123-456-784  |  @rafalchmiel  |\n|  Rafal  |  123-456-785  |  @rafalchmiel  |\n|  Rafal  |  123-456-786  |  @rafalchmiel  |\n|  Rafal  |  123-456-787  |  @rafalchmiel  |\n|  Rafal  |  123-456-788  |  @rafalchmiel  |\n|  Rafal  |  123-456-789  |  @rafalchmiel  |\n============================================"
    end
  end

  describe '#size' do
    it 'counts the number of rows in a table' do
      table = Tabbit.new('Name')
      10.times { |n| table.add_row('Rafal') }
      expect(table.size).to eq 10
    end
  end
end
