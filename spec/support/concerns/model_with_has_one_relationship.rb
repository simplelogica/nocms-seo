shared_examples_for "model with has one relationship" do |model_name, related_model_factory, has_one_relationship, belongs_to_relationship|

  context "when creating one #{has_one_relationship}" do

    let(:model_object) { create model_name }
    let(:related_object)  { create related_model_factory, belongs_to_relationship => model_object }

    before do
      related_object
    end

    subject { model_object }

    it("should relate to its #{has_one_relationship}") { expect(subject.send(has_one_relationship.to_sym)).to eq related_object }

    context "related #{has_one_relationship.to_s}" do

      subject { related_object }

      it("should relate to the original #{belongs_to_relationship}") {
        expect(subject.send(belongs_to_relationship.to_sym)).to eq model_object
      }

    end

  end

end
