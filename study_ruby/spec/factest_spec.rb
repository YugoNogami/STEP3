require_relative '../lib/factest'

describe '四則演算' do
    describe '足し算' do
        it '1 + 1 は 2 になること' do
            expect(1 + 1).to eq 2
        end
    end

    describe '引き算' do
        it '10 - 9 は1となること' do
            expect(10- 1).to eq 9
        end
    end
end

describe Factest do
    describe '#greet' do
        let(:factest){FactoryGirl.build(:factest)}
        subject {factest.greet}
        context'12歳以下の場合' do
            #let(:age){ 12 }
            it 'ひらがなで答えること' do
                is_expected.to eq 'ぼくはたろうだよ。'
            end
        end
        context '13歳以上の場合' do
            #let(:age){ 11 }
            #it '漢字で答えること' do
            #    is_expected.to eq '僕はたろうです。'
            #end
            it {is_expected.to eq '僕はたろうです。'}
        end
    end
end

